import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/constants/image_constants.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/bordered_text.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/social_icon_widget.dart';
import 'package:divyam_flutter/ui/moleclues/nueromorphic_container.dart';
import 'package:divyam_flutter/ui/moleclues/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MarketCard extends StatelessWidget {
  final VoidCallback onTap;
  const MarketCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: NeuroMorphicContainer(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextLeftView(context),
                // const Spacer(),
                const FittedBox(
                  fit: BoxFit.fitHeight,
                  child: RoundedImage.network(
                      height: 105,
                      width: 105,
                      imagePath:
                          'https://c8.alamy.com/comp/DERFBR/colourful-indian-shop-in-puttaparthi-andhra-pradesh-india-DERFBR.jpg'),
                ),
              ],
            ),
            CustomSpacers.height6,
            const SocialIconWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextLeftView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dhruv Super Market',
          style: AppTextThemes.theme(context).displayMedium,
        ),
        CustomSpacers.height6,
        Text(
          'Grocery',
          style: AppTextThemes.theme(context).bodyLarge,
        ),
        CustomSpacers.height10,
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.verified,
              height: 22.h,
              width: 22.h,
            ),
            CustomSpacers.width10,
            Text(
              'Verified',
              style: AppTextThemes.theme(context).titleSmall?.copyWith(
                    color: ColorPalette.primaryColor,
                  ),
            ),
          ],
        ),
        CustomSpacers.height6,
        const BorderedText(text: 'Offer available today'),
        CustomSpacers.height6,
        Text(
          'Main Market, SBI Main Branch',
          style: AppTextThemes.theme(context).bodyLarge,
        ),
      ],
    );
  }
}
