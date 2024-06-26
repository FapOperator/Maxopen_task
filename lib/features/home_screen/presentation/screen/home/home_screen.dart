import 'package:flutter/material.dart';
import 'package:maxopen_task/features/home_screen/presentation/screen/home/home_latest/home_latest.dart';
import 'package:maxopen_task/features/home_screen/presentation/screen/home/home_slider/carousel_loading.dart';
import 'package:maxopen_task/features/home_screen/presentation/widgets/custom_title.dart';
import 'package:maxopen_task/features/home_screen/presentation/theme/app_color.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomTitle(
                title: AppLocalizations.of(context)!.topFive,
              ),
              const CarouselSliderDataFound(),
              CustomTitle(
                title: AppLocalizations.of(context)!.latest,
              ),
              const HomeLatest(),
            ],
          ),
        ),
      ),
    );
  }
}
