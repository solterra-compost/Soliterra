import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solterra/core/const/app_strings.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/theme/app_colors.dart';
import 'package:solterra/widgets/helper_description.dart';

class PremiumSection extends StatelessWidget {
  const PremiumSection({super.key});

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
            label: 'What We Offer',
            text:
                "Solterra supplies pure, chemical-free worm fertilizer made from natural vermicompost. Each batch is prepared locally with earthworms and organic waste, helping soil recover naturally and support stronger plants from seed to harvest.",
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
            title: "Pure Vermicompost",
            description:
                "Made only from earthworms and organic waste, with zero synthetic chemicals.",
          ),
        ),
        SizedBox(width: 28),

        Expanded(
          child: _FeatureCard(
            imageHeight: 280,
            title: "Local Quality",
            description:
                "Prepared in small batches for fresh, nutrient-rich fertilizer every time.",
          ),
        ),
        SizedBox(width: 28),

        Expanded(
          child: _FeatureCard(
            imageHeight: 430,
            title: "Bulk Supply",
            description:
                "Trusted worm fertilizer for farms, gardens, and plantations across the region.",
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
          title: "Pure Vermicompost",
          description:
              "Made only from earthworms and organic waste, with zero synthetic chemicals.",
        ),
        SizedBox(height: 26),
        _FeatureCard(
          imageHeight: 260,
          title: "Local Quality",
          description:
              "Prepared in small batches for fresh, nutrient-rich fertilizer every time.",
        ),
        SizedBox(height: 26),
        _FeatureCard(
          imageHeight: 260,
          title: "Bulk Supply",
          description:
              "Trusted worm fertilizer for farms, gardens, and plantations across the region.",
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
