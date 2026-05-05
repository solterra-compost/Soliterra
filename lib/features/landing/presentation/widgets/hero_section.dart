import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive_extension.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding, // ← 16 / 32 / 64
        vertical: 32,
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
                  style: TextStyle(
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
            style: TextStyle(
              fontSize: context.responsive(
                mobile: 28.0, // small screen
                tablet: 38.0, // tablet
                desktop: 52.0, // desktop
              ),
              fontWeight: FontWeight.bold,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 24),
    
          // CTA button
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward, size: 16),
            label: const Text('Get Started'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: context.responsive(mobile: 20.0, desktop: 28.0),
                vertical: context.responsive(mobile: 12.0, desktop: 16.0),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
