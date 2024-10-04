import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/ui/atoms/bouncing_widget.dart';
import 'package:divyam_flutter/ui/moleclues/nueromorphic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DashBoardOptionCard extends StatelessWidget {
  final String assetName, text;
  const DashBoardOptionCard(
      {super.key, required this.assetName, required this.text});

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onPressed: () {},
      child: NeuroMorphicContainer(
        height: 65.h,
        width: 65.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              assetName, // Replace with the path to your GIF asset
              height: 40.h,
              width: 40.w,
              gaplessPlayback: true, // Add this to enable GIF playback
            ),
            CustomSpacers.height4,
            Text(
              text,
              style: AppTextThemes.theme(context).titleSmall,
              softWrap: true,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
