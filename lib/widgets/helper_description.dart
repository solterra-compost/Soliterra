import 'package:flutter/material.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/responsive/responsive_layout.dart';
import 'package:solterra/core/theme/app_colors.dart';

class HelperDescription extends StatelessWidget {
  final String label;
  final String text;
  const HelperDescription({required this.label, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: context.responsive(mobile: 30, desktop: 60),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding,
        vertical: context.responsive(mobile: 20, desktop: 42),
      ),
      decoration: BoxDecoration(
        color: AppColors.tabColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ResponsiveLayout(
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: _SectionHeading(label: label)),
                const SizedBox(width: 40),
                Expanded(flex: 6, child: _SectionDescription(text: text)),
              ],
            ),
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionHeading(label: label),
                const SizedBox(height: 18),
                _SectionDescription(text: text),
              ],
            ),
          ),
          SizedBox(height: context.responsive(mobile: 24.0, desktop: 38.0)),
          Divider(color: Colors.green.shade200, thickness: 1),
        ],
      ),
    );
  }
} // ─── Helpers ─────────────────────────────────────────────────

class _SectionHeading extends StatelessWidget {
  final String label;
  const _SectionHeading({required this.label});
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: context.responsive(mobile: 22.0, tablet: 28.0, desktop: 36.0),
        fontWeight: FontWeight.w800,
        color: AppColors.black,
        height: 1.15,
      ),
    );
  }
}

class _SectionDescription extends StatelessWidget {
  final String text;
  const _SectionDescription({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.responsive(mobile: 14.0, tablet: 15.0, desktop: 16.0),
        color: Colors.black87,
        height: 1.75,
      ),
    );
  }
}
