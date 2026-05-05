import 'package:flutter/material.dart';
import 'package:solterra/core/const/app_strings.dart';
import 'package:solterra/features/landing/presentation/widgets/colaborate_section.dart';
import 'package:solterra/features/landing/presentation/widgets/get_in_touch_section.dart';
import 'package:solterra/features/landing/presentation/widgets/hero_section.dart';
import 'package:solterra/features/landing/presentation/widgets/nav_bar.dart';
import 'package:solterra/features/landing/presentation/widgets/premium_feature_section.dart';
import 'package:solterra/features/landing/presentation/widgets/solution_section.dart';
import 'package:solterra/features/landing/presentation/widgets/stats_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _imagesReady = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImages();
  }

  Future<void> _precacheImages() async {
    await Future.wait([
      precacheImage(const AssetImage(AppStrings.imgThumbnel), context),
      precacheImage(const AssetImage(AppStrings.imgForm), context),
    ]);
    if (mounted) setState(() => _imagesReady = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_imagesReady) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            HeroSection(),
            StatsSection(),
            PremiumFeatureSection(),
            SolutionsSection(),
            ColaborateSection(),
            GetInTouchSection(),
          ],
        ),
      ),
    );
  }
}