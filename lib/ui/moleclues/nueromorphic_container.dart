import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:flutter/material.dart';

class NeuroMorphicContainer extends StatelessWidget {
  final double? height, width, borderRadius;
  final BoxShape? shape;
  final Color? color;
  final EdgeInsets? padding;
  final Widget? child;
  const NeuroMorphicContainer({
    super.key,
    this.height,
    this.padding,
    this.shape,
    this.color = ColorPalette.scaffoldBackgroundColor,
    this.child,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding ?? EdgeInsets.zero,
      width: width,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        color: color ?? ColorPalette.scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 4),
            color: ColorPalette.shadowOuterDark,
            blurRadius: 4,
            spreadRadius: 0,
          ),
          BoxShadow(
            offset: Offset(-2, -4),
            color: ColorPalette.shadowOuterLight,
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
        borderRadius:
            shape == null ? BorderRadius.circular(borderRadius ?? 8) : null,
      ),
      child: child,
    );
  }
}
