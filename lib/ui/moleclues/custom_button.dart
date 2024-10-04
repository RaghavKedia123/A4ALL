import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/constants/figma_constants.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/ui/atoms/bouncing_widget.dart';
import 'package:divyam_flutter/ui/atoms/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final double? borderRadius;
  final double? height;
  final double? width;
  final bool? isLoading;
  final VoidCallback onPressed;
  final Color? backgroundColor, textColor;

  const CustomButton({
    super.key,
    this.textColor = ColorPalette.scaffoldBackgroundColor,
    required this.onPressed,
    this.backgroundColor = ColorPalette.primaryColor,
    required this.btnText,
    this.isLoading = false,
    this.height = FigmaValueConstants.btnHeight,
    this.width = FigmaValueConstants.btnWidth,
    this.borderRadius = FigmaValueConstants.btnBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      duration: const Duration(milliseconds: 180),
      scaleFactor: 1.2,
      onPressed: () {
        onPressed();
        print('btn pressed');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: height!.h,
        width: width!.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(8, 8),
              color: ColorPalette.shadowOuterDark,
              blurRadius: 7,
              spreadRadius: 0,
            ),
            BoxShadow(
              offset: Offset(-8, -8),
              color: ColorPalette.shadowOuterLight,
              blurRadius: 7,
              spreadRadius: 0,
            ),
          ],
          border:
              Border.all(color: ColorPalette.scaffoldBackgroundColor, width: 4),
          borderRadius: BorderRadius.circular(borderRadius!),
          color: backgroundColor,
        ),
        child: isLoading!
            ? const Loading(
                color: ColorPalette.scaffoldBackgroundColor,
              )
            : Text(
                textAlign: TextAlign.center,
                btnText,
                style: AppTextThemes.theme(context).headlineLarge?.copyWith(
                      color: textColor,
                    ),
              ),
      ),
    );
  }
}
