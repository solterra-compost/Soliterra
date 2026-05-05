import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/responsive/responsive_layout.dart';
import 'package:solterra/core/theme/app_colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(desktop: _NavBarDesktop(), mobile: _NavBarMobile());
  }
}

class _NavBarDesktop extends StatelessWidget {
  const _NavBarDesktop();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: context.horizontalPadding,
        vertical: 16,
      ),
      child: Row(
        children: [
          _Logo(),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: AppColors.tabColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarMobile extends StatelessWidget {
  const _NavBarMobile();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: context.horizontalPadding,
        vertical: 16,
      ),
      child: Row(
        children: [
          _Logo(),
          const Spacer(),
          Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6)),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.eco, color: Colors.green),
        const SizedBox(width: 6),
        Text(
          'Solterra'.toUpperCase(),
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
