import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/common/components/map_component.dart';
import 'package:genclik_spor/screens/common/gyms/components/gym_slider.dart';
import 'package:genclik_spor/screens/common/gyms/gym_detail_screen.dart';
import 'package:genclik_spor/utils/colors.dart';
import 'package:genclik_spor/utils/extensions.dart';

class GymsScreen extends ConsumerWidget {
  GymsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(child: MapComponent()),
        Expanded(child: GymSlider()),
      ],
    );
  }
}
