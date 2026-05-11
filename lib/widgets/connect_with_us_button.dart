import 'package:flutter/material.dart';
import 'package:solterra/core/responsive/responsive_extension.dart';
import 'package:solterra/core/theme/app_colors.dart';

class ConnectWithUsButton extends StatelessWidget {
  Color? bgColor;
  Color? fgColor;
  String? label;
  Function() onTap;
  ConnectWithUsButton({
    this.bgColor,
    this.fgColor,
    this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.arrow_forward, size: 16),
      label: Text(label ?? 'Connect With Us'),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.black,
        foregroundColor: fgColor ?? AppColors.scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: context.responsive(mobile: 20.0, desktop: 28.0),
          vertical: context.responsive(mobile: 12.0, desktop: 16.0),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
      ),
    );
  }
}
