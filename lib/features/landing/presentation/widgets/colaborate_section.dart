import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solterra/core/const/app_strings.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/theme/app_colors.dart';
import 'package:solterra/widgets/connect_with_us_button.dart';

class ColaborateSection extends StatelessWidget {
  const ColaborateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          width: double.infinity,
          height: context.responsive(
            mobile: 240.0,
            tablet: 320.0,
            desktop: 420.0,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(AppStrings.imgThumbnel, fit: BoxFit.cover),

              // optional dark overlay for readability
              Container(color: Colors.black.withOpacity(.28)),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.responsive(
                    mobile: 18.0,
                    tablet: 28.0,
                    desktop: 48.0,
                  ),
                  vertical: context.responsive(
                    mobile: 20.0,
                    tablet: 28.0,
                    desktop: 42.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Collaborate And Learn\nFrom Industry Experts\nAnd Enthusiasts",
                      style: GoogleFonts.manrope(
                        fontSize: context.responsive(
                          mobile: 20.0,
                          tablet: 28.0,
                          desktop: 38.0,
                        ),
                        color: AppColors.scaffoldBackgroundColor,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        Text(
                          "Nashik",
                          style: GoogleFonts.manrope(
                            fontSize: context.responsive(
                              mobile: 13.0,
                              tablet: 14.0,
                              desktop: 15.0,
                            ),
                            color: AppColors.scaffoldBackgroundColor,
                            height: 1.5,
                          ),
                        ),

                        const Spacer(),

                        ConnectWithUsButton(
                          bgColor: AppColors.scaffoldBackgroundColor,
                          fgColor: AppColors.black,onTap: (){},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
