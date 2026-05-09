import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solterra/core/const/app_strings.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/responsive/responsive_layout.dart';
import 'package:solterra/widgets/helper_description.dart';

class SolutionsSection extends StatelessWidget {
  const SolutionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding,
        vertical: context.responsive(mobile: 32.0, tablet: 48.0, desktop: 60.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelperDescription(
            label: 'Our Vision',
            text:
                "We believe in sustainable farming and strive to reduce chemical dependency in agriculture. Our premium vermicompost is designed to nurture soil with organic carbon, ensuring long-term benefits for both farmers and the environment. \nJoin us in our mission to bring back organic farming and create a healthier future for our soil and food.",
          ),
          const SizedBox(height: 32),
          ResponsiveLayout(
            mobile: const _MobileWormFertilizerSection(),
            tablet: const _TabletWormFertilizerSection(),
            desktop: const _DesktopWormFertilizerSection(),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Mobile Layout
// ─────────────────────────────────────────────────────────────
class _MobileWormFertilizerSection extends StatelessWidget {
  const _MobileWormFertilizerSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ImageCard(
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.asset(AppStrings.imgThumbnel, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 18),
        const _TitleAndDescription(),
        const SizedBox(height: 18),
        const _KeyPoints(),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Tablet Layout
// ─────────────────────────────────────────────────────────────
class _TabletWormFertilizerSection extends StatelessWidget {
  const _TabletWormFertilizerSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image height matches title + description height.
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Expanded(flex: 5, child: _ResponsiveImage()),
              SizedBox(width: 32),
              Expanded(flex: 6, child: _TitleAndDescription()),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const _KeyPoints(),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Desktop Layout
// ─────────────────────────────────────────────────────────────
class _DesktopWormFertilizerSection extends StatelessWidget {
  const _DesktopWormFertilizerSection();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Expanded(flex: 5, child: _ResponsiveImage()),
          SizedBox(width: 40),
          Expanded(flex: 6, child: _DesktopContent()),
        ],
      ),
    );
  }
}

class _DesktopContent extends StatelessWidget {
  const _DesktopContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_TitleAndDescription(), SizedBox(height: 24), _KeyPoints()],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Shared Widgets
// ─────────────────────────────────────────────────────────────
class _ResponsiveImage extends StatelessWidget {
  const _ResponsiveImage();

  @override
  Widget build(BuildContext context) {
    return _ImageCard(
      child: Image.asset(
        AppStrings.imgThumbnel,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Widget child;

  const _ImageCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(16), child: child);
  }
}

class _TitleAndDescription extends StatelessWidget {
  const _TitleAndDescription();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Premium Vermicompost Fertilizer',
          style: GoogleFonts.manrope(
            fontSize: context.responsive(
              mobile: 24.0,
              tablet: 30.0,
              desktop: 36.0,
            ),
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Our worm-based organic fertilizer (vermicompost) is produced '
          'using earthworms that naturally convert organic waste into a '
          'nutrient-rich compost. It improves soil fertility, increases '
          'water retention, and promotes healthy root development.',
          style: GoogleFonts.manrope(
            fontSize: context.responsive(
              mobile: 14.0,
              tablet: 15.0,
              desktop: 16.0,
            ),
            height: 1.8,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _KeyPoints extends StatelessWidget {
  const _KeyPoints();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _FeatureItem(
          title: '100% Organic',
          description: 'Free from harmful chemicals and safe for all crops.',
        ),
        _FeatureItem(
          title: 'Improves Soil Health',
          description:
              'Enhances soil structure and beneficial microbial activity.',
        ),
        _FeatureItem(
          title: 'Boosts Plant Growth',
          description:
              'Provides essential nutrients for stronger roots and better yield.',
        ),
        _FeatureItem(
          title: 'Eco-Friendly',
          description: 'Converts biodegradable waste into valuable fertilizer.',
        ),
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const _FeatureItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(Icons.check_circle, size: 18, color: Colors.green),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.manrope(
                  fontSize: context.responsive(
                    mobile: 14.0,
                    tablet: 14.5,
                    desktop: 15.0,
                  ),
                  height: 1.7,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
