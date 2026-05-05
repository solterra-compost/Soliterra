import 'package:flutter/material.dart';
import 'package:solterra/features/landing/presentation/widgets/colaborate_section.dart';
import 'package:solterra/features/landing/presentation/widgets/get_in_touch_section.dart';
import 'package:solterra/features/landing/presentation/widgets/hero_section.dart';
import 'package:solterra/features/landing/presentation/widgets/nav_bar.dart';
import 'package:solterra/features/landing/presentation/widgets/premium_feature_section.dart';
import 'package:solterra/features/landing/presentation/widgets/solution_section.dart';
import 'package:solterra/features/landing/presentation/widgets/stats_section.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            NavBar(),
            HeroSection(),
            StatsSection(),
            SolutionsSection(),
            ColaborateSection(),
            PremiumFeatureSection(),
            GetInTouchSection(),
          ],
        ),
      ),
    );
  }
}
