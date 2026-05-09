import 'package:flutter/material.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/responsive/responsive_layout.dart';
import 'package:solterra/core/theme/app_colors.dart';

class HelperDescription extends StatelessWidget {
  String label;
  String text;
  HelperDescription({required this.label, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: context.responsive(mobile: 30, desktop: 60),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding,
        vertical: context.responsive(mobile: 18, desktop: 40),
      ),
      decoration: BoxDecoration(
        color: AppColors.tabColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ResponsiveLayout(
            // Desktop: heading LEFT, description RIGHT (Row)
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: _SectionHeading(label: label)),
                const SizedBox(width: 40),
                Expanded(flex: 1, child: _SectionDescription(text: text)),
              ],
            ),
            // Mobile: stacked (Column)
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionHeading(label: label),
                const SizedBox(height: 16),
                _SectionDescription(text: text),
              ],
            ),
          ),
          SizedBox(height: context.responsive(mobile: 24.0, desktop: 40.0)),
        ],
      ),
    );
  }
} // ─── Helpers ─────────────────────────────────────────────────

class _SectionHeading extends StatelessWidget {
  String label;
  _SectionHeading({required this.label});
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: context.responsive(mobile: 22.0, tablet: 28.0, desktop: 36.0),
        fontWeight: FontWeight.bold,
        height: 1.2,
      ),
    );
  }
}

class _SectionDescription extends StatelessWidget {
  String text;
  _SectionDescription({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.responsive(mobile: 13.0, desktop: 15.0),
        color: Colors.grey.shade500,
        height: 1.6,
      ),
    );
  }
}
