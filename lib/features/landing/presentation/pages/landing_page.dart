import 'package:flutter/material.dart';
import 'package:solterra/features/landing/presentation/widgets/hero_section.dart';
import 'package:solterra/features/landing/presentation/widgets/nav_bar.dart';

import '../../../../core/const/app_strings.dart';
import '../../../../core/responsive/responsive_extension.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: context.responsive(
                mobile: 240.0,
                tablet: 380.0,
                desktop: 500.0,
              ),
              child: Image.asset(AppStrings.imgThumbnel, fit: BoxFit.cover),
            ),
            Expanded(child: Column(children: [NavBar(), HeroSection()])),
          ],
        ),
      ),
    );
  }
}
