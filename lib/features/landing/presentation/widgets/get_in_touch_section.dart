import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/responsive/responsive_layout.dart';
import 'package:solterra/core/theme/app_colors.dart';
import 'package:solterra/features/landing/domain/entities/enquiry_entity.dart';
import 'package:solterra/features/landing/presentation/bloc/enquiry_event.dart';
import 'package:solterra/features/landing/presentation/bloc/enquiry_state.dart';
import 'package:solterra/features/landing/presentation/bloc/enquiry_submit_bloc.dart';
import 'package:solterra/widgets/connect_with_us_button.dart';
import 'package:solterra/widgets/social_launcher.dart';

class GetInTouchSection extends StatefulWidget {
  const GetInTouchSection({super.key});

  @override
  State<GetInTouchSection> createState() => _GetInTouchSectionState();
}

class _GetInTouchSectionState extends State<GetInTouchSection> {
  bool _showContactForm = false;

  void _toggleForm() => setState(() => _showContactForm = !_showContactForm);

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
            mobile: _MobileTopSection(
              showForm: _showContactForm,
              onToggle: _toggleForm,
            ),
            tablet: _TabletTopSection(
              showForm: _showContactForm,
              onToggle: _toggleForm,
            ),
            desktop: _DesktopTopSection(
              showForm: _showContactForm,
              onToggle: _toggleForm,
            ),
          ),
          SizedBox(
            height: context.responsive(mobile: 36, tablet: 44, desktop: 56),
          ),
          const Divider(color: Colors.black12, thickness: 1),
          SizedBox(
            height: context.responsive(mobile: 20, tablet: 22, desktop: 24),
          ),
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
  final bool showForm;
  final VoidCallback onToggle;

  const _DesktopTopSection({required this.showForm, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(flex: 5, child: _LeftArea()),
        const SizedBox(width: 80),
        Expanded(
          flex: 4,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 420),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (child, animation) {
              final offsetAnimation =
                  Tween<Offset>(
                    begin: const Offset(0.06, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutCubic,
                    ),
                  );
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                ),
              );
            },
            child: showForm
                ? _InlineContactForm(
                    key: const ValueKey('form'),
                    onBack: onToggle,
                  )
                : _InfoPanel(
                    key: const ValueKey('info'),
                    onContactTap: onToggle,
                  ),
          ),
        ),
      ],
    );
  }
}

class _TabletTopSection extends StatelessWidget {
  final bool showForm;
  final VoidCallback onToggle;

  const _TabletTopSection({required this.showForm, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _LeftArea(),
        const SizedBox(height: 48),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 420),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) {
            final offsetAnimation =
                Tween<Offset>(
                  begin: const Offset(0, 0.06),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                );
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: SlideTransition(position: offsetAnimation, child: child),
              ),
            );
          },
          child: showForm
              ? _InlineContactForm(
                  key: const ValueKey('form'),
                  onBack: onToggle,
                )
              : _InfoPanelTablet(
                  key: const ValueKey('info'),
                  onContactTap: onToggle,
                ),
        ),
      ],
    );
  }
}

class _MobileTopSection extends StatelessWidget {
  final bool showForm;
  final VoidCallback onToggle;

  const _MobileTopSection({required this.showForm, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _LeftArea(),
        const SizedBox(height: 36),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 420),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) {
            final offsetAnimation =
                Tween<Offset>(
                  begin: const Offset(0, 0.06),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                );
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: SlideTransition(position: offsetAnimation, child: child),
              ),
            );
          },
          child: showForm
              ? _InlineContactForm(
                  key: const ValueKey('form'),
                  onBack: onToggle,
                )
              : _InfoPanelMobile(
                  key: const ValueKey('info'),
                  onContactTap: onToggle,
                ),
        ),
      ],
    );
  }
}

// ── Left area ─────────────────────────────────────────────────────────────────

class _LeftArea extends StatelessWidget {
  const _LeftArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Text(
          "Get In Touch!",
          style: GoogleFonts.manrope(
            fontSize: context.responsive(mobile: 36, tablet: 48, desktop: 58),
            fontWeight: FontWeight.w800,
            color: AppColors.black,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Reach out for genuine worm fertilizer and soil guidance.\nWe deliver honest, 100% natural vermicompost for farms and home gardens.",
          style: GoogleFonts.manrope(
            fontSize: context.responsive(mobile: 14, desktop: 16),
            height: 1.65,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

// ── Info panels ───────────────────────────────────────────────────────────────

class _InfoPanel extends StatelessWidget {
  final VoidCallback onContactTap;
  const _InfoPanel({super.key, required this.onContactTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(flex: 1, child: _AddressArea(onContactTap: onContactTap)),
        const SizedBox(width: 40),
        const Flexible(flex: 1, child: _ContactArea()),
      ],
    );
  }
}

class _InfoPanelTablet extends StatelessWidget {
  final VoidCallback onContactTap;
  const _InfoPanelTablet({super.key, required this.onContactTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(flex: 1, child: _AddressArea(onContactTap: onContactTap)),
        const SizedBox(width: 32),
        const Flexible(flex: 1, child: _ContactArea()),
      ],
    );
  }
}

class _InfoPanelMobile extends StatelessWidget {
  final VoidCallback onContactTap;
  const _InfoPanelMobile({super.key, required this.onContactTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AddressArea(onContactTap: onContactTap),
        const SizedBox(height: 28),
        const _ContactArea(),
      ],
    );
  }
}

// ── Inline contact form — BLOC WIRED ─────────────────────────────────────────

class _InlineContactForm extends StatefulWidget {
  final VoidCallback onBack;
  const _InlineContactForm({super.key, required this.onBack});

  @override
  State<_InlineContactForm> createState() => _InlineContactFormState();
}

class _InlineContactFormState extends State<_InlineContactForm> {
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
    // Validate
    if (_nameCtrl.text.trim().isEmpty ||
        _contactCtrl.text.trim().isEmpty ||
        _messageCtrl.text.trim().isEmpty) {
      _showSnackbar('Please fill in all fields.');
      return;
    }

    // Dispatch event to bloc
    context.read<EnquiryBloc>().add(
      FormDetailRequested(
        enquiry: EnquiryEntity(
          name: _nameCtrl.text.trim(),
          phoneNo: _contactCtrl.text.trim(),
          description: _messageCtrl.text.trim(),
          // id: '3500',
          timeStamp: DateTime.now().toString(),
        ),
      ),
    );
  }

  void _showSnackbar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.manrope()),
        backgroundColor: isError ? Colors.red.shade700 : AppColors.black,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _clearForm() {
    _nameCtrl.clear();
    _contactCtrl.clear();
    _messageCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EnquiryBloc, EnquiryState>(
      listener: (context, state) {
        if (state is SubmitSuccessState) {
          _showSnackbar("Message sent! We'll get back to you soon. 🌱");
          _clearForm();
          widget.onBack();
        } else if (state is SubmitNetworkErrorState) {
          _showSnackbar(state.message, isError: true);
        } else if (state is SubmitErrorState) {
          _showSnackbar(state.message, isError: true);
        }
      },
      child: BlocBuilder<EnquiryBloc, EnquiryState>(
        builder: (context, state) {
          final isLoading = state is SubmitLoadingState;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              GestureDetector(
                onTap: isLoading ? null : widget.onBack,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.arrow_back_rounded,
                      size: 16,
                      color: Color(0xff6c778c),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Back to info",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: const Color(0xff6c778c),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Send us a message",
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "We typically respond within 24 hours.",
                style: GoogleFonts.manrope(
                  fontSize: 13,
                  color: Colors.black45,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: _SolterraField(
                      controller: _nameCtrl,
                      label: "Full Name",
                      hint: "Your name",
                      prefixIcon: Icons.person_outline_rounded,
                      enabled: !isLoading,
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
                      enabled: !isLoading,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              _SolterraField(
                controller: _messageCtrl,
                label: "Message for Us",
                hint:
                    "Tell us about your soil, crop type, or bulk order needs — "
                    "we'll recommend the right organic solution for you.",
                maxLines: 5,
                enabled: !isLoading,
              ),

              const SizedBox(height: 24),

              // Submit button with loading state
              isLoading
                  ? Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: const Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    )
                  : ConnectWithUsButton(label: "Send Message", onTap: _submit),
            ],
          );
        },
      ),
    );
  }
}

// ── Address area ──────────────────────────────────────────────────────────────

class _AddressArea extends StatelessWidget {
  final VoidCallback onContactTap;
  const _AddressArea({super.key, required this.onContactTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _LabelText("ADDRESS"),
        const SizedBox(height: 16),
        const _BodyText("Nashik, Maharashtra"),
        const SizedBox(height: 40),
        const _LabelText("WORKING HOURS"),
        const SizedBox(height: 16),
        const _BodyText("Mon - Sat, 9:00 AM - 6:00 PM"),
        const SizedBox(height: 48),
        const _SocialIconsRow(),
        const SizedBox(height: 24),
        _ContactUsButton(onTap: onContactTap),
      ],
    );
  }
}

// ── Contact Us CTA button ─────────────────────────────────────────────────────

class _ContactUsButton extends StatefulWidget {
  final VoidCallback onTap;
  const _ContactUsButton({required this.onTap});

  @override
  State<_ContactUsButton> createState() => _ContactUsButtonState();
}

class _ContactUsButtonState extends State<_ContactUsButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered ? const Color(0xff1a1a18) : AppColors.black,
            borderRadius: BorderRadius.circular(99),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Contact Us",
                style: GoogleFonts.manrope(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(width: 8),
              AnimatedSlide(
                offset: _hovered ? const Offset(0.15, 0) : Offset.zero,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Contact area ──────────────────────────────────────────────────────────────

class _ContactArea extends StatelessWidget {
  const _ContactArea({super.key});

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

// ── Social icons row ──────────────────────────────────────────────────────────

class _SocialIconsRow extends StatelessWidget {
  const _SocialIconsRow({super.key});

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

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        icon(Bootstrap.facebook, SocialLauncher.facebook),
        icon(Bootstrap.twitter_x, SocialLauncher.twitter_x),
        icon(Bootstrap.instagram, SocialLauncher.instagram),
        icon(Bootstrap.linkedin, SocialLauncher.linkedin),
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
  final bool enabled; // ← added

  const _SolterraField({
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.enabled = true,
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
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: GoogleFonts.manrope(
            fontSize: _focused ? 11.5 : 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.6,
            color: _focused ? AppColors.black : const Color(0xff6c778c),
          ),
          child: Text(widget.label.toUpperCase()),
        ),
        const SizedBox(height: 7),
        Focus(
          onFocusChange: (v) => setState(() => _focused = v),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: !widget.enabled
                  ? const Color(0xffd8d8d6) // dimmed when loading
                  : _focused
                  ? Colors.white
                  : const Color(0xffe8e8e6),
              borderRadius: BorderRadius.circular(isMultiline ? 18 : 99),
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
                      ),
                    ]
                  : [],
            ),
            child: TextField(
              controller: widget.controller,
              maxLines: widget.maxLines,
              keyboardType: widget.keyboardType,
              enabled: widget.enabled,
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
                    ? Icon(widget.prefixIcon, size: 18, color: Colors.black38)
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

// ── Bottom sections ───────────────────────────────────────────────────────────

class _DesktopBottomSection extends StatelessWidget {
  const _DesktopBottomSection();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
