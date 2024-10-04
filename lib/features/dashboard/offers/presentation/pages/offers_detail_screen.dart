import 'package:divyam_flutter/core/constants/figma_constants.dart';
import 'package:divyam_flutter/core/enums/business_status.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/business_status.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/suspended_box.dart';
import 'package:divyam_flutter/features/dashboard/offers/presentation/widgets/offer_social_icons.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:divyam_flutter/ui/moleclues/custom_floating_action_btn.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:divyam_flutter/ui/moleclues/lable_value_display.dart';
import 'package:divyam_flutter/ui/moleclues/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersDetailScreen extends StatelessWidget {
  const OffersDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'My Offers'.toUpperCase(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: FigmaValueConstants.defaultPaddingH.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSpacers.height20,
            SuspendedBox(
              message:
                  'This offer has been rejected because of reported violation of privacy',
              onDetailTap: () => CustomNavigator.pushTo(
                context,
                AppRouter.issuesResolutionScreen,
              ),
            ),
            CustomSpacers.height10,
            Text(
              'Dhruv Super Bazar',
              style: AppTextThemes.theme(context).displayLarge,
            ),
            CustomSpacers.height10,
            CustomSpacers.height10,
            const BusinessStatusWidget(
              status: BusinessStatusType.suspended,
            ),
            CustomSpacers.height10,
            const LabelValueWidget(label: 'Type', value: 'Dhruv Super Market'),
            CustomSpacers.height10,
            const LabelValueWidget(
                label: 'Title', value: '50% Off on Branded Items'),
            CustomSpacers.height10,
            const RoundedImage.network(
              height: 280,
              width: double.maxFinite,
              imagePath:
                  'https://s3-alpha-sig.figma.com/img/d91b/1542/80a4375edbd1406bde1f350f471f349e?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ljUUvChMAntZYsIOezjWUxQ5tpO2Cg5nkwbHdtdD6JPSZDzx6ZRg1~QcU4PYPWCkZIEnA5D-1HHW0tVzRXozYrjZwII~HPfEXHiR2u5fb4llunlqVbQJ6FFVMfrrOiP8H7wJBM8vogE9ano1FfGT~31tfTT3X4QU0zPpfn1ifz3Ndky~yNU-y2vaZzut-kNsUk2vHSjHkIGXk3sgmp6Miy3xVyNcT~KtKCY6h3Rx1am65~p9vZjtP~AgPWYaRR64A341SsKBe2EjIaHwXZUm5HHRvLABPYIKt5XZydU-BVLIeGpIEnXVpt--YjCHtSBlAw2viyEgQSpmTqNUGLsLSA__',
            ),
            CustomSpacers.height10,
            Text(
                'We are offering 50% off on a range of branded products! Hurry! Offer only for limited period.',
                style: AppTextThemes.theme(context).bodyLarge),
            const LabelValueWidget(label: 'Product category', value: 'Food'),
            CustomSpacers.height10,
            const LabelValueWidget(label: 'This offer is for', value: 'B2B'),
            CustomSpacers.height10,
            const LabelValueWidget(
                label: 'Target age', value: '30 to 50 years'),
            CustomSpacers.height10,
            const LabelValueWidget(label: 'Target location', value: 'Mixed'),
            CustomSpacers.height10,
            const LabelValueWidget(
                label: 'Start date', value: '29th May, 2022'),
            CustomSpacers.height10,
            const LabelValueWidget(label: 'End date', value: '29th May, 2022'),
            CustomSpacers.height10,
            const OffersSocialIcons(),
            CustomSpacers.height10,
            const LabelValueWidget(
                label: 'Created on', value: '29th May, 2022'),
            CustomSpacers.height10,
            const LabelValueWidget(label: 'Status', value: 'Rejected'),
            CustomSpacers.height10,
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFloatingActionButton(
                      onPressed: () {}, label: 'Reuse this offer'),
                  CustomSpacers.width10,
                  CustomFloatingActionButton(
                      onPressed: () {}, label: 'Edit this offer'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
