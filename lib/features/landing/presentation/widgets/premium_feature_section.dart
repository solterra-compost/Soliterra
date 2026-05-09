import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solterra/core/const/app_strings.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/theme/app_colors.dart';
import 'package:solterra/widgets/helper_description.dart';

class PremiumFeatureSection extends StatelessWidget {
  const PremiumFeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding,
        vertical: 60,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HelperDescription(
            label: 'Our Vision',
            text:
                "We believe in sustainable farming and strive to reduce chemical dependency in agriculture. Our premium vermicompost is designed to nurture soil with organic carbon, ensuring long-term benefits for both farmers and the environment. \nJoin us in our mission to bring back organic farming and create a healthier future for our soil and food.",
          ),
          context.isMobile
              ? const _MobileFeatureLayout()
              : const _DesktopFeatureLayout(),
        ],
      ),
    );
  }
}

class _DesktopFeatureLayout extends StatelessWidget {
  const _DesktopFeatureLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: const [
        Expanded(
          child: _FeatureCard(
            imageHeight: 430,
            title: "Farming Precision",
            description:
                "Our precision farming employs state-of-the-art technology to optimize every aspect of farm operations.",
          ),
        ),
        SizedBox(width: 28),

        Expanded(
          child: _FeatureCard(
            imageHeight: 280,
            title: "Crop Surveillance",
            description:
                "Track your crops' health and growth in real-time with our innovative solutions.",
          ),
        ),
        SizedBox(width: 28),

        Expanded(
          child: _FeatureCard(
            imageHeight: 430,
            title: "Automated Farming",
            description:
                "Enhance farm efficiency and productivity with our cutting-edge automation solutions.",
          ),
        ),
      ],
    );
  }
}

class _MobileFeatureLayout extends StatelessWidget {
  const _MobileFeatureLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _FeatureCard(
          imageHeight: 260,
          title: "Farming Precision",
          description:
              "Our precision farming employs state-of-the-art technology to optimize every aspect of farm operations.",
        ),
        SizedBox(height: 26),
        _FeatureCard(
          imageHeight: 260,
          title: "Crop Surveillance",
          description:
              "Track your crops' health and growth in real-time with our innovative solutions.",
        ),
        SizedBox(height: 26),
        _FeatureCard(
          imageHeight: 260,
          title: "Automated Farming",
          description:
              "Enhance farm efficiency and productivity with our cutting-edge automation solutions.",
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final double imageHeight;
  final String title;
  final String description;

  const _FeatureCard({
    required this.imageHeight,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: SizedBox(
            width: double.infinity,
            height: imageHeight,
            child: Image.asset(AppStrings.imgThumbnel, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 18),

        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: context.responsive(mobile: 24, tablet: 28, desktop: 30),
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          description,
          style: GoogleFonts.manrope(
            fontSize: context.responsive(mobile: 14, tablet: 15, desktop: 16),
            height: 1.5,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
