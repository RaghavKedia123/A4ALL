import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/constants/image_constants.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/bordered_text.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/image_preview.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/number_widget.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/offer_card.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/social_icon_widget.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BusinessDetailScreen extends StatefulWidget {
  const BusinessDetailScreen({super.key});

  @override
  State<BusinessDetailScreen> createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBottomSheet: true,
      appBarTitle: 'Business Details',
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSpacers.height10,
            Row(
              children: [
                Text(
                  'Dhruv Super Market',
                  style: AppTextThemes.theme(context).displayMedium,
                ),
                const Spacer(),
                SvgPicture.asset(
                  AppIcons.moreRounded,
                ),
              ],
            ),
            Text(
              'Grocery',
              style: AppTextThemes.theme(context).bodyLarge,
            ),
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
            const NumberWidget(number: '9877698097'),
            CustomSpacers.height6,
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.location,
                  color: ColorPalette.textDark,
                ),
                CustomSpacers.width10,
                Text(
                  'Main Market, SBI Main Branch',
                  style: AppTextThemes.theme(context).bodyLarge,
                ),
              ],
            ),
            Text(
              '09:30 AM - 08:00 PM',
              style: AppTextThemes.theme(context)
                  .bodyLarge
                  ?.copyWith(color: ColorPalette.green),
            ),
            CustomSpacers.height10,
            const ImagePreviewWidget(),
            CustomSpacers.height10,
            _buildIconTile(assetName: AppIcons.globe, title: 'dhruvmarket.com'),
            CustomSpacers.height6,
            _buildIconTile(
                assetName: AppIcons.message, title: 'dhruvmarket@gmail.com'),
            CustomSpacers.height6,
            _buildIconTile(
              assetName: AppIcons.whatsApp,
              title: '9876543210',
              color: ColorPalette.primaryColor,
            ),
            CustomSpacers.height10,
            const SocialIconWidget(),
            CustomSpacers.height10,
            const BorderedText(text: 'Offer available today'),
            CustomSpacers.height16,
            OfferCard(
              onTap: () =>
                  CustomNavigator.pushTo(context, AppRouter.myBusinessScreen),
            ),
            CustomSpacers.height56,
          ],
        ),
      ),
    );
  }

  Widget _buildIconTile(
      {required String assetName,
      required String title,
      Color? color = ColorPalette.textDark}) {
    return Row(
      children: [
        SvgPicture.asset(assetName),
        CustomSpacers.width10,
        Text(
          title,
          style: AppTextThemes.theme(context).bodyLarge?.copyWith(color: color),
        ),
      ],
    );
  }
}
