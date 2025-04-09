import 'package:flutter/material.dart';
import 'package:genclik_spor/models/gym_model.dart';
import 'package:genclik_spor/screens/common/gyms/gym_detail_screen.dart';
import 'package:genclik_spor/utils/colors.dart';

class GymSlider extends StatefulWidget {
  final List<GymModel> gyms;
  const GymSlider({super.key, required this.gyms});

  @override
  _GymSliderState createState() => _GymSliderState();
}

class _GymSliderState extends State<GymSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: PageView.builder(
        itemCount: widget.gyms.length,
        controller: PageController(viewportFraction: 0.75),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final gym = widget.gyms[index];
          bool isActive = index == _currentIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GymDetailScreen(gym: gym),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: EdgeInsets.symmetric(
                    horizontal: isActive ? 10 : 30, vertical: 10),
                transform: Matrix4.identity()
                  ..scale(isActive ? 1.1 : 1.0)
                  ..rotateZ(isActive ? 0.0 : 0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: blacko,
                      blurRadius: isActive ? 10 : 5,
                      spreadRadius: isActive ? 3 : 1,
                    )
                  ],
                  image: DecorationImage(
                    image: NetworkImage(gym.imgUrl ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: blacko,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gym.gymName ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              gym.address ?? "",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
