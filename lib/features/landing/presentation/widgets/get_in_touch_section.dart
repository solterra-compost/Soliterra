import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/responsive/responsive_layout.dart';
import 'package:solterra/core/theme/app_colors.dart';
import 'package:solterra/widgets/connect_with_us_button.dart';
import 'package:solterra/widgets/social_launcher.dart';

class GetInTouchSection extends StatelessWidget {
  const GetInTouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xfff5f5f3),
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding,
        vertical: context.responsive(mobile: 48, tablet: 64, desktop: 80),
      ),
      child: Column(
        children: [
          ResponsiveLayout(
            mobile: const _MobileTopSection(),
            tablet: const _TabletTopSection(),
            desktop: const _DesktopTopSection(),
          ),

          SizedBox(
            height: context.responsive(mobile: 36, tablet: 44, desktop: 56),
          ),

          const Divider(color: Colors.black12, thickness: 1),

          SizedBox(
              height: context.responsive(mobile: 20, tablet: 22, desktop: 24)),

          ResponsiveLayout(
            mobile: const _MobileBottomSection(),
            tablet: const _TabletBottomSection(),
            desktop: const _DesktopBottomSection(),
          ),
        ],
      ),
    );
  }
}

// ── Layout shells ─────────────────────────────────────────────────────────────

class _DesktopTopSection extends StatelessWidget {
  const _DesktopTopSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(flex: 5, child: _LeftArea()),
        SizedBox(width: 80),
        Expanded(flex: 2, child: _AddressArea()),
        SizedBox(width: 56),
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
        const _LeftArea(),
        const SizedBox(height: 48),
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

class _MobileTopSection extends StatelessWidget {
  const _MobileTopSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LeftArea(),
        SizedBox(height: 36),
        _AddressArea(),
        SizedBox(height: 28),
        _ContactArea(),
      ],
    );
  }
}

// ── Left area ─────────────────────────────────────────────────────────────────

class _LeftArea extends StatelessWidget {
  const _LeftArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // — Eyebrow label —
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xff2d2d2b).withOpacity(0.07),
            borderRadius: BorderRadius.circular(99),
          ),
          child: Text(
            "CONTACT US",
            style: GoogleFonts.manrope(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
              color: const Color(0xff4a5568),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // — Heading —
        Text(
          "Get In Touch!",
          style: GoogleFonts.manrope(
            fontSize:
                context.responsive(mobile: 36, tablet: 48, desktop: 58),
            fontWeight: FontWeight.w800,
            color: AppColors.black,
            height: 1.1,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          "Have questions about our vermicompost products?\nWe'd love to hear from you.",
          style: GoogleFonts.manrope(
            fontSize: context.responsive(mobile: 14, desktop: 16),
            height: 1.65,
            color: Colors.black54,
          ),
        ),

        SizedBox(
            height: context.responsive(mobile: 28, desktop: 36)),

        // — Subscribe strip —
        SizedBox(
          width: context.responsive(
            mobile: double.infinity,
            tablet: 480,
            desktop: 500,
          ),
          child: const _SubscribeField(),
        ),

        SizedBox(
            height: context.responsive(mobile: 32, desktop: 44)),

        // — Divider between subscribe and form —
        SizedBox(
          width: context.responsive(
            mobile: double.infinity,
            tablet: 480,
            desktop: 500,
          ),
          child: Row(
            children: [
              const Expanded(child: Divider(color: Colors.black12)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "or send us a message",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Expanded(child: Divider(color: Colors.black12)),
            ],
          ),
        ),

        SizedBox(
            height: context.responsive(mobile: 28, desktop: 36)),

        // — Contact form —
        SizedBox(
          width: context.responsive(
            mobile: double.infinity,
            tablet: 480,
            desktop: 500,
          ),
          child: const _ContactForm(),
        ),
      ],
    );
  }
}

// ── Subscribe field ───────────────────────────────────────────────────────────

class _SubscribeField extends StatelessWidget {
  const _SubscribeField();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: const Color(0xffe8e8e6),
        borderRadius: BorderRadius.circular(99),
      ),
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              "Enter your email address",
              style: GoogleFonts.manrope(
                  fontSize: 14, color: Colors.black38),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              "Subscribe",
              style: GoogleFonts.manrope(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Contact form ──────────────────────────────────────────────────────────────

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _nameCtrl = TextEditingController();
  final _contactCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _contactCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_nameCtrl.text.trim().isEmpty ||
        _contactCtrl.text.trim().isEmpty ||
        _messageCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill in all fields.',
            style: GoogleFonts.manrope(),
          ),
          backgroundColor: AppColors.black,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }
    // TODO: wire to API
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Message sent! We'll get back to you soon. 🌱",
          style: GoogleFonts.manrope(),
        ),
        backgroundColor: AppColors.black,
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name + Contact row
        Row(
          children: [
            Expanded(
              child: _SolterraField(
                controller: _nameCtrl,
                label: "Full Name",
                hint: "Your name",
                prefixIcon: Icons.person_outline_rounded,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SolterraField(
                controller: _contactCtrl,
                label: "Phone / Email",
                hint: "+91 XXXXX XXXXX",
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Message field
        _SolterraField(
          controller: _messageCtrl,
          label: "Message for Us",
          hint:
              "Tell us about your soil, crop type, or bulk order needs — "
              "we'll recommend the right organic solution for you.",
          maxLines: 5,
        ),

        const SizedBox(height: 24),

        ConnectWithUsButton(
          label: "Send Message",
          onTap: _submit,
        ),
      ],
    );
  }
}

// ── Solterra-styled form field ────────────────────────────────────────────────

class _SolterraField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final int maxLines;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  const _SolterraField({
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  @override
  State<_SolterraField> createState() => _SolterraFieldState();
}

class _SolterraFieldState extends State<_SolterraField> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final isMultiline = widget.maxLines > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Animated label
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: GoogleFonts.manrope(
            fontSize: _focused ? 11.5 : 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.6,
            color: _focused
                ? AppColors.black
                : const Color(0xff6c778c),
          ),
          child: Text(widget.label.toUpperCase()),
        ),

        const SizedBox(height: 7),

        Focus(
          onFocusChange: (v) => setState(() => _focused = v),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: _focused
                  ? Colors.white
                  : const Color(0xffe8e8e6),
              borderRadius:
                  BorderRadius.circular(isMultiline ? 18 : 99),
              border: Border.all(
                color: _focused
                    ? AppColors.black.withOpacity(0.5)
                    : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: _focused
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : [],
            ),
            child: TextField(
              controller: widget.controller,
              maxLines: widget.maxLines,
              keyboardType: widget.keyboardType,
              style: GoogleFonts.manrope(
                fontSize: 14,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: GoogleFonts.manrope(
                  fontSize: 13,
                  color: Colors.black38,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: (!isMultiline && widget.prefixIcon != null)
                    ? Icon(widget.prefixIcon,
                        size: 18, color: Colors.black38)
                    : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: widget.prefixIcon != null && !isMultiline
                      ? 4
                      : 18,
                  vertical: isMultiline ? 16 : 0,
                ),
                isDense: !isMultiline,
                constraints: !isMultiline
                    ? const BoxConstraints(minHeight: 52)
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Address + Contact (unchanged logic, refined spacing) ─────────────────────

class _AddressArea extends StatelessWidget {
  const _AddressArea();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _LabelText("ADDRESS"),
        SizedBox(height: 16),
        _BodyText("Nashik"),
        SizedBox(height: 48),
        _SocialIconsRow(),
      ],
    );
  }
}

class _ContactArea extends StatelessWidget {
  const _ContactArea();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LabelText("PHONE"),
        SizedBox(height: 16),
        _BodyText("+91 7030813550"),
        SizedBox(height: 40),
        _LabelText("EMAIL"),
        SizedBox(height: 16),
        _BodyText("solterravermicompost@gmail.com"),
      ],
    );
  }
}

class _SocialIconsRow extends StatelessWidget {
  const _SocialIconsRow();

  @override
  Widget build(BuildContext context) {
    Widget icon(IconData data, VoidCallback onTap) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.black12),
          ),
          child: Icon(data, size: 17, color: AppColors.black),
        ),
      );
    }

    return Row(
      children: [
        icon(Bootstrap.facebook, SocialLauncher.facebook),
        const SizedBox(width: 10),
        icon(Bootstrap.twitter_x, SocialLauncher.twitter_x),
        const SizedBox(width: 10),
        icon(Bootstrap.instagram, SocialLauncher.instagram),
        const SizedBox(width: 10),
        icon(Bootstrap.linkedin, SocialLauncher.linkedin),
      ],
    );
  }
}

// ── Bottom sections ───────────────────────────────────────────────────────────

class _DesktopBottomSection extends StatelessWidget {
  const _DesktopBottomSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _BodyText("© Copyright 2025, All Rights Reserved"),
        Spacer(),
        _FooterLink("FAQ"),
        SizedBox(width: 28),
        _FooterLink("Terms of Service"),
        SizedBox(width: 28),
        _FooterLink("Privacy Policy"),
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
      children: const [
        _BodyText("© Copyright 2025, All Rights Reserved"),
        SizedBox(height: 10),
        Wrap(
          spacing: 22,
          runSpacing: 8,
          children: [
            _FooterLink("FAQ"),
            _FooterLink("Terms of Service"),
            _FooterLink("Privacy Policy"),
          ],
        ),
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
      children: const [
        _BodyText("© Copyright 2025, All Rights Reserved"),
        SizedBox(height: 14),
        Wrap(
          spacing: 20,
          runSpacing: 6,
          children: [
            _FooterLink("FAQ"),
            _FooterLink("Terms of Service"),
            _FooterLink("Privacy Policy"),
          ],
        ),
      ],
    );
  }
}

// ── Typography helpers ────────────────────────────────────────────────────────

class _LabelText extends StatelessWidget {
  final String text;
  const _LabelText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.manrope(
        fontSize: 11,
        color: const Color(0xff6c778c),
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
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
        fontSize: 13.5,
        color: AppColors.black,
        height: 1.5,
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.manrope(
        fontSize: 13,
        color: Colors.black54,
        decoration: TextDecoration.underline,
        decorationColor: Colors.black26,
      ),
    );
  }
}