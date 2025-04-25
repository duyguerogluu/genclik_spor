import 'package:flutter/material.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/screens/common/gyms/gym_detail_screen.dart';

class CustomGymSlider extends StatelessWidget {
  const CustomGymSlider({
    Key? key,
    required this.gyms,
    required this.gymData,
    required this.onShowOnMap,
  }) : super(key: key);

  final List<GymModel> gyms;
  final List<Map<String, dynamic>> gymData;
  final void Function(GymModel gym) onShowOnMap;

  @override
  Widget build(BuildContext context) {
    if (gymData.length != gyms.length) {
      return const Center(child: Text('Veri uyuşmazlığı'));
    }

    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: gyms.length,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        itemBuilder: (context, index) {
          final gym = gyms[index];
          final distance =
              (gymData[index]['distance'] as num?)?.toDouble() ?? 0.0;

          return Container(
            width: 280,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade50, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 8, offset: Offset(0, 4), color: Colors.black12),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image + overlay
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.network(
                          gym.imgUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade300,
                                  Colors.blue.shade500
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: const Center(
                              child: Icon(Icons.fitness_center,
                                  color: Colors.white, size: 40),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Text(
                            gym.gymName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Details + buttons
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Colors.red),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              '${gym.district}, ${gym.city}',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.home,
                              size: 16, color: Colors.orange),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              gym.address ?? 'Adres bilgisi yok',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.directions_walk,
                              size: 16, color: Colors.blue),
                          const SizedBox(width: 4),
                          Text(
                            '${(distance / 1000).toStringAsFixed(1)} km',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => GymDetailScreen(gym: gym),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text('Detaylar'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => onShowOnMap(gym),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.green),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text('Haritada Göster'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
