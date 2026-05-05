import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  static const _stats = [
    ('50+', 'Year Of Experience'),
    ('200+', 'Field In Progress'),
    ('120,000+', 'Farmer Around World'),
    ('\$15 Billion', 'Agricultural Product'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding,
        vertical: context.responsive(mobile: 24.0, desktop: 40.0),
      ),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: context.isMobile
          ? GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 20,
              childAspectRatio: 2.2,
              children: _stats
                  .map((s) => _StatItem(value: s.$1, label: s.$2))
                  .toList(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _stats
                  .map((s) => _StatItem(value: s.$1, label: s.$2))
                  .toList(),
            ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.manrope(
            fontSize: context.responsive(
              mobile: 22.0,
              tablet: 24.0,
              desktop: 32.0,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: context.responsive(
              mobile: 11.0,
              tablet: 12.0,
              desktop: 14.0,
            ),
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}