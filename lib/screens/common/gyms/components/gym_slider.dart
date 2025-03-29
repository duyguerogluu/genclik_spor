import 'package:flutter/material.dart';

class GymSlider extends StatelessWidget {
  final List<Map<String, String>> gyms = [
    {
      "name": "Power Gym",
      "image": "https://via.placeholder.com/150",
      "location": "Kadıköy, İstanbul"
    },
    {
      "name": "FitLife Center",
      "image": "https://via.placeholder.com/150",
      "location": "Beşiktaş, İstanbul"
    },
    {
      "name": "Elite Sports Club",
      "image": "https://via.placeholder.com/150",
      "location": "Şişli, İstanbul"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: gyms.length,
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (context, index) {
          final gym = gyms[index];
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(gym["image"]!),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gym["name"]!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          gym["location"]!,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
