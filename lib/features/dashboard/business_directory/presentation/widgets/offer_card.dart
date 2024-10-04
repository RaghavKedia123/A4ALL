import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/constants/image_constants.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/social_icon_widget.dart';
import 'package:divyam_flutter/ui/moleclues/nueromorphic_container.dart';
import 'package:divyam_flutter/ui/moleclues/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OfferCard extends StatelessWidget {
  final VoidCallback onTap;
  const OfferCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: NeuroMorphicContainer(
        padding: const EdgeInsets.all(16),
        borderRadius: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            CustomSpacers.height10,
            _buildSeeMoreText(context),
            CustomSpacers.height10,
            const RoundedImage.network(
              height: 295,
              width: double.maxFinite,
              imagePath:
                  'https://c8.alamy.com/comp/DERFBR/colourful-indian-shop-in-puttaparthi-andhra-pradesh-india-DERFBR.jpg',
            ),
            CustomSpacers.height16,
            const SocialIconWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildSeeMoreText(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Text(
            overflow: TextOverflow.ellipsis,
            'hahsdofhsudhfuod dfhosdhfoisdoifnsoihfosdn foihsidhfoihsdkj',
            style: AppTextThemes.theme(context).bodyLarge,
          ),
        ),
        const Spacer(),
        Text(
          'See more',
          style: AppTextThemes.theme(context).bodyLarge?.copyWith(
                color: ColorPalette.primaryColor,
              ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 36.h,
          width: 36.h,
          child: CircleAvatar(
            child: Image.network(
                'https://c8.alamy.com/comp/DERFBR/colourful-indian-shop-in-puttaparthi-andhra-pradesh-india-DERFBR.jpg'),
          ),
        ),
        CustomSpacers.width10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dhruv Super Market',
              style: AppTextThemes.theme(context).displayMedium,
            ),
            Text(
              'Daily Needs / Grocery',
              style: AppTextThemes.theme(context).bodyLarge,
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset(
          AppIcons.moreRounded,
        ),
        CustomSpacers.width10,
        NeuroMorphicContainer(
          padding: const EdgeInsets.all(2),
          height: 30,
          width: 30,
          shape: BoxShape.circle,
          child: SvgPicture.asset(
            AppIcons.call,
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}
