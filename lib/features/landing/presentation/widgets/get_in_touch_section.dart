import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/theme/app_colors.dart';

class GetInTouchSection extends StatelessWidget {
  const GetInTouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xfff5f5f3),
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding,
        vertical: context.responsive(mobile: 40, tablet: 60, desktop: 70),
      ),
      child: Column(
        children: [
          context.isMobile
              ? const _MobileTopSection()
              : context.isTablet
              ? const _TabletTopSection()
              : const _DesktopTopSection(),

          SizedBox(
            height: context.responsive(mobile: 32, tablet: 40, desktop: 50),
          ),

          Divider(color: Colors.black54, thickness: .8),

          SizedBox(height: context.responsive(mobile: 20, desktop: 26)),

          context.isMobile
              ? const _MobileBottomSection()
              : context.isTablet
              ? const _TabletBottomSection()
              : const _DesktopBottomSection(),
        ],
      ),
    );
  }
}

class _DesktopTopSection extends StatelessWidget {
  const _DesktopTopSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(flex: 4, child: _LeftNewsletterArea()),
        SizedBox(width: 70),
        Expanded(flex: 2, child: _AddressArea()),
        SizedBox(width: 50),
        Expanded(flex: 2, child: _ContactArea()),
      ],
    );
  }
}

class _TabletTopSection extends StatelessWidget {
  const _TabletTopSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _LeftNewsletterArea(),

        const SizedBox(height: 42),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _AddressArea()),
            SizedBox(width: 40),
            Expanded(child: _ContactArea()),
          ],
        ),
      ],
    );
  }
}

class _TabletBottomSection extends StatelessWidget {
  const _TabletBottomSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BodyText("© Copyright 2025, All Rights Reserved"),

        Wrap(
          spacing: 22,
          runSpacing: 10,
          children: const [
            _BodyText("FAQ"),
            _BodyText("Term of Service"),
            _BodyText("Privacy Policy"),
          ],
        ),
      ],
    );
  }
}

class _MobileTopSection extends StatelessWidget {
  const _MobileTopSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _LeftNewsletterArea(),
        const SizedBox(height: 30),
        const _AddressArea(),
        const SizedBox(height: 24),
        const _ContactArea(),
      ],
    );
  }
}

class _LeftNewsletterArea extends StatelessWidget {
  const _LeftNewsletterArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Get In Touch!",
          style: GoogleFonts.manrope(
            fontSize: context.responsive(mobile: 34, tablet: 50, desktop: 62),
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "have questions or need assistance?\nWe’re here to help!",
          style: GoogleFonts.manrope(
            fontSize: context.responsive(mobile: 15, desktop: 17),
            height: 1.5,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: context.responsive(mobile: 24, desktop: 40)),
        SizedBox(
          width: context.responsive(
            mobile: double.infinity,
            tablet: 500,
            desktop: 520,
          ),
          child: const _SubscribeField(),
        ),
      ],
    );
  }
}

class _SubscribeField extends StatelessWidget {
  const _SubscribeField();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: const Color(0xffebebea),
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              "Enter your email",
              style: GoogleFonts.manrope(fontSize: 16, color: Colors.black54),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Text(
              "Subscribe",
              style: GoogleFonts.manrope(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddressArea extends StatelessWidget {
  const _AddressArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabelText("ADDRESS"),
        const SizedBox(height: 18),
        _BodyText("1901 Thornridge Cir.\nShiloh, Hawaii 81063"),
        const SizedBox(height: 50),
        const _SocialIconsRow(),
      ],
    );
  }
}

class _ContactArea extends StatelessWidget {
  const _ContactArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabelText("PHONE"),
        const SizedBox(height: 18),
        _BodyText("[303] 873-2983"),
        const SizedBox(height: 36),
        _LabelText("EMAIL"),
        const SizedBox(height: 18),
        _BodyText("hallo.cultivo@gmail.com"),
      ],
    );
  }
}

class _SocialIconsRow extends StatelessWidget {
  const _SocialIconsRow();

  @override
  Widget build(BuildContext context) {
    Widget social(IconData icon) {
      return Flexible(
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black26),
          ),
          child: Icon(icon, size: 18),
        ),
      );
    }

    return Row(
      children: [
        social(Bootstrap.facebook),
        const SizedBox(width: 10),
        social(Bootstrap.twitter_x),
        const SizedBox(width: 10),
        social(Bootstrap.instagram),
        const SizedBox(width: 10),
        social(Bootstrap.linkedin),
      ],
    );
  }
}

class _DesktopBottomSection extends StatelessWidget {
  const _DesktopBottomSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _BodyText("© Copyright 2025, All Rights Reserved"),
        const Spacer(),
        _BodyText("FAQ"),
        const SizedBox(width: 28),
        _BodyText("Term of Service"),
        const SizedBox(width: 28),
        _BodyText("Privacy Policy"),
      ],
    );
  }
}

class _MobileBottomSection extends StatelessWidget {
  const _MobileBottomSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BodyText("© Copyright 2025, All Rights Reserved"),
        const SizedBox(height: 18),
        Wrap(
          spacing: 20,
          children: [
            _BodyText("FAQ"),
            _BodyText("Term of Service"),
            _BodyText("Privacy Policy"),
          ],
        ),
      ],
    );
  }
}

class _LabelText extends StatelessWidget {
  final String text;
  const _LabelText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.manrope(
        fontSize: 15,
        color: const Color(0xff6c778c),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;
  const _BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.manrope(
        fontSize: 13,
        color: AppColors.black,
        height: 1.4,
      ),
    );
  }
}
