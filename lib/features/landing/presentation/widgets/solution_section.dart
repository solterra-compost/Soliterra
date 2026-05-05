import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solterra/core/const/app_strings.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/responsive/responsive_layout.dart';
import 'package:solterra/widgets/helper_description.dart';

class SolutionsSection extends StatelessWidget {
  const SolutionsSection({super.key});

  static final _cards = [
    (
      number: '03',
      title: 'Technology Irrigation',
      image: AppStrings.imgThumbnel,
    ),
    (number: '02', title: 'Organic Fertilizer', image: AppStrings.imgThumbnel),
    (
      number: '03',
      title: 'Technology Irrigation',
      image: AppStrings.imgThumbnel,
    ),
    (
      number: '04',
      title: 'Agricultural Monitoring',
      image: AppStrings.imgThumbnel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding,
        vertical: context.responsive(mobile: 32.0, desktop: 60.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─ Header row ─────────────────────────────────────
          HelperDescription(),

          // ─ Cards grid ─────────────────────────────────────
          ResponsiveLayout(
            // Desktop: staggered 4-column grid
            desktop: _StaggeredGrid(cards: _cards),
            // Mobile: vertical scroll list
            mobile: Column(
              children: _cards
                  .map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _SolutionCard(
                        number: c.number,
                        title: c.title,
                        image: c.image,
                        tall: false,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Staggered Grid (desktop) ────────────────────────────────
class _StaggeredGrid extends StatelessWidget {
  final List<({String number, String title, String image})> cards;
  const _StaggeredGrid({required this.cards});

  @override
  Widget build(BuildContext context) {
    // Replicates the design's stagger effect:
    // card 0 & 2 are tall (left/right)
    // card 1 & 3 are shorter, offset downward
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _SolutionCard(
            number: cards[0].number,
            title: cards[0].title,
            image: cards[0].image,
            tall: true,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 60), // ← creates the stagger
            child: _SolutionCard(
              number: cards[1].number,
              title: cards[1].title,
              image: cards[1].image,
              tall: true,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _SolutionCard(
            number: cards[2].number,
            title: cards[2].title,
            image: cards[2].image,
            tall: true,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 60), // ← mirrors stagger
            child: _SolutionCard(
              number: cards[3].number,
              title: cards[3].title,
              image: cards[3].image,
              tall: true,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Solution Card ───────────────────────────────────────────
class _SolutionCard extends StatelessWidget {
  final String number;
  final String title;
  final String image;
  final bool tall;
  const _SolutionCard({
    required this.number,
    required this.title,
    required this.image,
    required this.tall,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: double.infinity,
            height: tall ? 300 : 200,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              number,
              style: GoogleFonts.manrope(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(width: 8),

            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                textAlign: TextAlign.start,
                style: GoogleFonts.manrope(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
