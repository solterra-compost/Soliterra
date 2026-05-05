import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solterra/core/const/app_strings.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/theme/app_colors.dart';
import 'package:solterra/widgets/connect_with_us_button.dart';
import 'package:solterra/widgets/lazy_image.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // ─ Hero image — height via context.responsive() ─
        SizedBox(
          width: double.infinity,
          height: context.responsive(
            mobile: 240.0,
            tablet: 380.0,
            desktop: 700.0,
          ),
          child: LazyImage(assetPath: AppStrings.imgThumbnel),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: context.horizontalPadding,
            left: context.horizontalPadding,
            top: context.responsive(mobile: 30, tablet: 50, desktop: 200),
          ),
          child: Column(
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.green,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Top Notch Webinar Platform',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // ★ Headline — font size via context.responsive()
              Text(
                'Regenerating The Earth\nWith Nano-Biotechnology',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: context.responsive(
                    mobile: 28.0, // small screen
                    tablet: 38.0, // tablet
                    desktop: 52.0, // desktop
                  ),
                  fontWeight: FontWeight.bold,
                  height: 1.15,
                  color: AppColors.scaffoldBackgroundColor,
                ),
              ),
              const SizedBox(height: 24),

              // CTA button
              ConnectWithUsButton(),
            ],
          ),
        ),
      ],
    );
  }
}
