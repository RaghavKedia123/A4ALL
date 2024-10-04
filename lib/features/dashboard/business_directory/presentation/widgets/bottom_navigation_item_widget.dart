import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/ui/atoms/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationItem extends StatelessWidget {
  final String assetName, text;
  final VoidCallback onTap;
  const BottomNavigationItem(
      {super.key,
      required this.assetName,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    const offset = Offset(4, 4);
    return BouncingWidget(
      onPressed: onTap,
      child: Container(
        height: 46.h,
        width: 66.w,
        decoration: BoxDecoration(
          color: ColorPalette.primaryColor,
          boxShadow: [
            const BoxShadow(
              offset: offset,
              color: ColorPalette.bottomNavigatorDarkShadow,
              blurRadius: 8,
              spreadRadius: 0,
            ),
            BoxShadow(
              offset: -offset,
              color: ColorPalette.bottomNavigatorLightShadow,
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetName,
              height: 20.h,
              width: 20.h,
            ),
            CustomSpacers.height4,
            Text(
              text,
              style: TextStyle(
                color: ColorPalette.scaffoldBackgroundColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
