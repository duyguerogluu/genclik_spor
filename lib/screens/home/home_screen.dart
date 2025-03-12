import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genclik_spor/screens/home/components/custom_app_bar.dart';
import 'package:genclik_spor/screens/home/components/custom_bottom_bar.dart';
import 'package:genclik_spor/screens/home/components/custom_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page'),
          ],
        ),
      ),
    );
  }
}
