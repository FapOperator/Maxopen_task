import 'package:flutter/material.dart';
import 'package:maxopen_task/features/home_screen/presentation/screen/home_latest/home_latest.dart';
import 'package:maxopen_task/features/home_screen/presentation/screen/home_slider/carousel_loading.dart';
import 'package:maxopen_task/features/home_screen/presentation/widgets/custom_title.dart';
import 'package:maxopen_task/presentation/theme/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          children: [
            CustomTitle(
              title: 'Top Five',
            ),
            CarouselSliderDataFound(),
            CustomTitle(
              title: 'Latest',
            ),
            HomeLatest(),
          ],
        ),
      ),
    );
  }
}
