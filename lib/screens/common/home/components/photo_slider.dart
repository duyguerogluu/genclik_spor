import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PhotoSlider extends StatelessWidget {
  final List<String> imageUrls;

  const PhotoSlider({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 4),
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
      ),
      items: imageUrls.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            url,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
    );
  }
}
