import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LazyImage extends StatefulWidget {
  final String assetPath;
  final BoxFit fit;
  final double? width;
  final double? height;

  const LazyImage({
    super.key,
    required this.assetPath,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  @override
  State<LazyImage> createState() => _LazyImageState();
}

class _LazyImageState extends State<LazyImage> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.assetPath),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: _isVisible
            ? Image.asset(
                widget.assetPath,
                fit: widget.fit,
                width: widget.width,
                height: widget.height,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded || frame != null) {
                    return child;
                  }
                  // Fade in when loaded
                  return AnimatedOpacity(
                    opacity: frame != null ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                    child: child,
                  );
                },
              )
            : Container(
                color: Colors.grey.shade100,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
      ),
    );
  }
}