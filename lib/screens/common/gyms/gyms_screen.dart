import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/main.dart';
import 'package:genclik_spor/screens/common/gyms/components/gym_search_area.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/screens/common/components/custom_appbar.dart';
import 'package:genclik_spor/screens/common/components/custom_map.dart';
import 'package:genclik_spor/screens/common/gyms/components/custom_gym_slider.dart';
import 'package:genclik_spor/screens/common/gyms/components/city_district_dropdown.dart';
import 'package:genclik_spor/screens/common/gyms/gym_detail_screen.dart';
import 'package:genclik_spor/services/distance_matrix_service.dart';
import 'package:genclik_spor/services/geocoding_service.dart';
import 'package:genclik_spor/services/gym_service.dart';
import 'package:genclik_spor/services/adressfrom_latlng.dart';
import 'package:turkish/turkish.dart';

class GymsScreen extends ConsumerStatefulWidget {
  const GymsScreen({Key? key}) : super(key: key);
  @override
  _GymsScreenState createState() => _GymsScreenState();
}

class _GymsScreenState extends ConsumerState<GymsScreen>
    with AutomaticKeepAliveClientMixin {
  // Marker ikonları
  late BitmapDescriptor _userIcon;
  late BitmapDescriptor _gymIcon;
  late BitmapDescriptor _gymIconSelected;

  final _distanceService = DistanceMatrixService();
  final _geocoder = GeocodingService();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  GoogleMapController? _mapController;
  LatLng? _mapCenter = _defaultCenter;
  String _currentCity = _defaultCity;
  String _currentDistrict = _defaultDistrict;

  LatLng? _userLocation = _defaultCenter;
  static const _defaultCity = 'Gaziantep';
  static const _defaultDistrict = 'Şehitkamil';
  static const _defaultCenter = LatLng(37.0965, 37.3825);

  MapType _mapType = MapType.normal;
  List<GymModel> _gyms = [];
  bool _isLoading = true;
  bool _initialLoading = true;
  bool _refreshing = false;

  GymModel? _highlightedGym;

  PersistentBottomSheetController? _persistentBottomSheetController;

  @override
  void initState() {
    super.initState();
    _loadMarkerIcons();
    _initializeLocationAndFetchGyms();
  }

  Future<void> _loadMarkerIcons() async {
    _userIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/person.png',
    );
    _gymIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/gym.png',
    );
    _gymIconSelected = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/gym_selected.png',
    );
    setState(() {}); // ikonlar hazır olunca yeniden çiz
  }

  @override
  bool get wantKeepAlive => true;

  Future<bool> _getUserLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      _showLocationDisabledDialog();
      return false;
    }
    var p = await Geolocator.checkPermission();
    if (p == LocationPermission.denied) {
      p = await Geolocator.requestPermission();
      if (p == LocationPermission.denied) {
        _showLocationDisabledDialog();
        return false;
      }
    }
    if (p == LocationPermission.deniedForever) {
      _showLocationDisabledDialog();
      return false;
    }
    try {
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );
      _userLocation = LatLng(pos.latitude, pos.longitude);
      return true;
    } catch (_) {
      _showLocationDisabledDialog();
      return false;
    }
  }

  void _showLocationDisabledDialog() {
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Konum Hizmetleri Kapalı'),
        content: const Text(
          'Konumunuz kapalı. Varsayılan olarak Gaziantep/Şehitkamil kullanılacak.',
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(c), child: const Text('Tamam')),
          TextButton(
            onPressed: () {
              Navigator.pop(c);
              Geolocator.openLocationSettings();
            },
            child: const Text('Ayarlar'),
          ),
        ],
      ),
    );
  }

  Future<void> _initializeLocationAndFetchGyms() async {
    final hasLoc = await _getUserLocation();
    // ➋ Başlangıçta her zaman Gaziantep/Şehitkamil’i kullan,
    //     eğer konum açıksa üzerine yazarız.
    String city = _defaultCity;
    String district = _defaultDistrict;

    if (hasLoc && _userLocation != null) {
      final addr = Adress();
      final loc = await addr.getAddressFromLatLng(
        _userLocation!.latitude,
        _userLocation!.longitude,
      );
      if (loc != null) {
        city = loc.key;
        district = loc.value;
        // haritayı gerçek konuma taşı
        _mapCenter = _userLocation;
      }
    } else {
      // konum kapalı olsa bile Şehitkamil merkezine odaklan
      _mapCenter = _defaultCenter;
    }

    setState(() {
      _currentCity = city;
      _currentDistrict = district;
    });

    // initial:true → listeye gelen ilk salona odaklamayı engeller
    await _fetchGyms(city: city, district: district, initial: true);
  }

  Future<void> _fetchGyms({
    required String city,
    required String district,
    bool initial = false,
  }) async {
    if (initial) {
      _initialLoading = true;
    } else {
      _refreshing = true;
    }

    setState(() {
      _currentCity = city;
      _currentDistrict = district;
      _highlightedGym = null;
    });

    List<GymModel> fetched;
    try {
      fetched = await GymService.getGyms(district, city);
    } catch (_) {
      fetched = [];
    }

    // Eğer Gaziantep ise tüm ilçeler gösterilsin, filtreleme YAPILMASIN
    if (city.toLowerCase() == 'gaziantep') {
      // Filtreleme yok, API’den gelen tüm veriler gösterilecek
    } else {
      // Diğer şehirlerde API'den gelen salonları ilçe bazında filtrele
      fetched = fetched
          .where((gym) => gym.city.toLowerCase() == district.toLowerCase())
          .toList();
    }

    if (!initial && fetched.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('İlgili ilçede salon yok veya veriler eklenmedi'),
        ),
      );
      final fallback = _userLocation ?? _defaultCenter;
      _mapController?..moveCamera(CameraUpdate.newLatLngZoom(fallback, 13));
    }

    setState(() {
      _gyms = fetched;
      if (!initial && fetched.isNotEmpty) {
        _mapCenter = LatLng(fetched.first.lat, fetched.first.lng);
      }
    });

    setState(() {
      if (initial) {
        _initialLoading = false;
      } else {
        _refreshing = false;
      }
    });

    if (_mapController != null && _mapCenter != null) {
      _mapController!.moveCamera(CameraUpdate.newLatLngZoom(_mapCenter!, 13));
    }
  }

  /// Mahalle seçimi sonrası hem haritayı hem de userLocation’u günceller
  Future<void> _applySearchArea(String city, String district) async {
    final neighborhoods = await _geocoder.getNeighborhoods(city, district);
    if (neighborhoods.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mahalle bulunamadı')),
      );
      return;
    }

    final chosen = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$city / $district ilçesine ait mahalleler',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              title: Text('Tüm $district İlçesi'),
              onTap: () => Navigator.pop(ctx, ''),
            ),
            ...neighborhoods.map((m) => ListTile(
                  title: Text(m),
                  onTap: () => Navigator.pop(ctx, m),
                )),
          ],
        ),
      ),
    );
    if (chosen == null) return;

    // İlçe merkezine git
    final districtCenter = await _geocoder.geocodeCityDistrict(city, district);
    if (districtCenter != null) {
      _mapController
        ?..moveCamera(CameraUpdate.newLatLngZoom(districtCenter, 13));
      setState(() {
        _userLocation = districtCenter;
        _mapCenter = districtCenter;
      });
    }

    // Mahalle seçtiyse mahalleye git
    if (chosen.isNotEmpty) {
      final ncoord =
          await _geocoder.geocodeNeighborhood(city, district, chosen);
      if (ncoord != null) {
        _mapController?..moveCamera(CameraUpdate.newLatLngZoom(ncoord, 14));
        setState(() {
          _userLocation = ncoord;
          _mapCenter = ncoord;
        });
      }
    }

    // Salon listesini yenile (mesafeler  güncel userLocation’a göre)
    await _fetchGyms(city: city, district: district);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_initialLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Marker seti
    final markers = <Marker>{};
    if (_userLocation != null) {
      markers.add(Marker(
        markerId: const MarkerId('user_location'),
        position: _userLocation!,
        icon: _userIcon,
      ));
    }

    onGymTap(gym) {
      setState(() => _highlightedGym = gym);

      final effectiveUserLocation = _userLocation ?? _defaultCenter;

      _mapController?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(gym.lat, gym.lng),
        ),
      );

      final fut = _distanceService.getTravelInfo(
          effectiveUserLocation, LatLng(gym.lat, gym.lng));

      _scaffoldKey.currentState!.showBottomSheet(
        (c) => Container(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<Map<String, String>>(
            future: fut,
            builder: (c, s) {
              if (s.connectionState != ConnectionState.done) {
                return const SizedBox(
                  height: 180,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return _buildGymDetailSheet(gym: gym, travelInfo: s.data!);
            },
          ),
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        enableDrag: true,
      );
    }

    for (var gym in _gyms) {
      final isSel = gym == _highlightedGym;
      markers.add(Marker(
        markerId: MarkerId(gym.gymName),
        position: LatLng(gym.lat, gym.lng),
        icon: isSel ? _gymIconSelected : _gymIcon,
        onTap: () => onGymTap(gym),
      ));
    }

    final gymsList = _gyms.where((g) => g.lat != 0 && g.lng != 0).toList();
    /*
    final sliderData = gymsList
        .map((g) => {
              'gym': g,
              'distance': _userLocation == null
                  ? null
                  : Geolocator.distanceBetween(_userLocation!.latitude,
                      _userLocation!.longitude, g.lat, g.lng)
            })
        .toList();
    */

    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar("Spor Salonları"),
      floatingActionButton: _persistentBottomSheetController != null
          ? null
          : FloatingActionButton(
              onPressed: () {
                if (_refreshing || _persistentBottomSheetController != null) {
                  return;
                }

                _persistentBottomSheetController =
                    _scaffoldKey.currentState!.showBottomSheet(
                  (c) {
                    return GymSearchAreaWidget(
                      gymList: gymsList,
                      currentCity: _currentCity,
                      currentDistrict: _currentDistrict,
                      onGymTap: onGymTap,
                      onCityDistrictSelected: _applySearchArea,
                    );
                  },
                  constraints: BoxConstraints.loose(
                    Size.fromHeight(
                      MediaQuery.sizeOf(context).height * 0.65,
                    ),
                  ),
                );

                setState(() {});

                _persistentBottomSheetController?.closed.then(
                  (_) => setState(() {
                    _persistentBottomSheetController = null;
                  }),
                );
              },
              child: const Icon(Icons.search),
            ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Harita
                CustomMap(
                  center: _mapCenter ?? _defaultCenter,
                  zoom: _mapCenter != null ? 13 : 11,
                  mapType: _mapType,
                  markers: markers,
                  onMapCreated: (ctrl) {
                    _mapController = ctrl;
                    if (_mapCenter != null) {
                      _mapController!.moveCamera(
                          CameraUpdate.newLatLngZoom(_mapCenter!, 13));
                    }
                  },
                ),

                //   aşağıda ki kod çıktısı canlıya çıkınca kullanılacak
                //
                //  if (_gyms.isEmpty)
                //           Center(
                //             child: Container(
                //               padding: const EdgeInsets.all(12),
                //               color: Colors.white70,
                //               child: const Text("Yakınınızda spor salonu bulunamadı."),
                //             ),
                //           ),
                /*
                // Üst bar + dropdown
                Positioned(
                  top: 16,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 4)
                      ],
                    ),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Row(children: [
                        const Icon(Icons.location_on, color: Colors.blue),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Konum: $_currentCity, $_currentDistrict',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 8),
                      CityDistrictDropdown(
                          onCityDistrictSelected: _applySearchArea),
                    ]),
                  ),
                ),
                */

                /*
              // Harita tipi switch
              Positioned(
                top: 16, right: 16,
                child: DropdownButton<MapType>(
                  value: _mapType,
                  onChanged: (t) => setState(() => _mapType = t!),
                  items: const [
                    DropdownMenuItem(value: MapType.normal, child: Text('Normal')),
                    DropdownMenuItem(value: MapType.satellite, child: Text('Satellite')),
                    DropdownMenuItem(value: MapType.terrain, child: Text('Terrain')),
                    DropdownMenuItem(value: MapType.hybrid, child: Text('Hybrid')),
                  ],
                ),
              ),
            
              // Alt slider
              if (sliderData.isNotEmpty)
                Positioned(
                  left: 0, right: 0, bottom: 0,
                  child: Container(
                    height: 240,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter, end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black26],
                      ),
                    ),
                    child: CustomGymSlider(
                      gyms: gymsList,
                      gymData: sliderData,
                      onShowOnMap: (gym) {
                        setState(() => _highlightedGym = gym);
                        _mapController?.moveCamera(
                          CameraUpdate.newLatLngZoom(
                              LatLng(gym.lat, gym.lng), 15),
                        );
                      },
                    ),
                  ),
                ),
                */
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTravelInfoColumn(
      IconData icon, String label, String value, Color color) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center),
          const SizedBox(height: 2),
          Text(value,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              softWrap: true),
        ],
      ),
    );
  }

  Widget _buildGymDetailSheet({
    required GymModel gym,
    required Map<String, String> travelInfo,
  }) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2)),
          ),
          Text(gym.gymName,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildTravelInfoColumn(Icons.directions_car, 'Arabayla',
                  travelInfo['driving'] ?? '—', Colors.blue),
              _buildTravelInfoColumn(Icons.directions_walk, 'Yürüyerek',
                  travelInfo['walking'] ?? '—', Colors.green),
              _buildTravelInfoColumn(Icons.directions_bike, 'Bisikletle',
                  travelInfo['bicycling'] ?? '—', Colors.orange),
              _buildTravelInfoColumn(Icons.directions_transit, 'Toplu Taşıma',
                  travelInfo['transit'] ?? '—', Colors.purple),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => GymDetailScreen(gym: gym))),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: const Text('Detayları Görüntüle'),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
