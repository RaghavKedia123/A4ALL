import 'package:divyam_flutter/core/constants/figma_constants.dart';
import 'package:divyam_flutter/core/enums/gst_calculator_type.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:divyam_flutter/ui/moleclues/custom_button.dart';
import 'package:divyam_flutter/ui/moleclues/custom_check_box_tile.dart';
import 'package:divyam_flutter/ui/moleclues/custom_text_field.dart';
import 'package:divyam_flutter/ui/moleclues/go_back_btn.dart';
import 'package:divyam_flutter/ui/moleclues/lable_value_display.dart';
import 'package:divyam_flutter/ui/moleclues/neuromorphic_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateOfferStepFour extends StatelessWidget {
  final VoidCallback onBackPressed, onSubmit;
  const CreateOfferStepFour(
      {super.key, required this.onBackPressed, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: FigmaValueConstants.defaultPaddingH.w),
      child: Column(
        children: [
          CustomSpacers.height20,
          CustomCheckBoxTile(onChanged: (v) {}, option: 'All Locations -'),
          CustomSpacers.height30,
          CustomTextField(
            hintText: 'Max Recharge Coins to be spent',
            controller: TextEditingController(),
          ),
          CustomSpacers.height30,
          Text(
            'Available Recharge Coins Balance',
            style: AppTextThemes.theme(context).headlineLarge,
          ),
          CustomSpacers.height20,
          Text('1000', style: AppTextThemes.theme(context).displayLarge),
          CustomSpacers.height30,
          GestureDetector(
            onTap: () => CustomNavigator.pushTo(
              context,
              AppRouter.diamondCoinScreen,
              arguments: GSTCalculatorType.purchaseCoins,
            ),
            child: const NeuroMorphicText(
              text: 'Get More Recharge Coins',
            ),
          ),
          CustomSpacers.height30,
          Text('(1 Recharge Coin = 1 Rupee)',
              style: AppTextThemes.theme(context).titleLarge),
          CustomSpacers.height30,
          Text(
            'Available Bonus Diamonds',
            style: AppTextThemes.theme(context).headlineLarge,
          ),
          CustomSpacers.height20,
          Text('1500', style: AppTextThemes.theme(context).displayLarge),
          CustomSpacers.height30,
          GestureDetector(
            onTap: () => CustomNavigator.pushTo(
              context,
              AppRouter.diamondCoinScreen,
              arguments: GSTCalculatorType.diamondsToCoins,
            ),
            child: const NeuroMorphicText(
              text: 'CONVERT Bonus Diamonds to Recharge Coins',
            ),
          ),
          CustomSpacers.height30,
          Text('(1 Bonus Diamond = 1 Recharge Coin)',
              style: AppTextThemes.theme(context).titleLarge),
          CustomSpacers.height24,
          const LabelValueWidget(
            label: 'Note',
            value:
                'if you want to fix different view for different locations, you can create multiple ad campaigns with same content.Go to My Offers screen to reuse existing ad content in new campaigns.',
          ),
          CustomSpacers.height30,
          CustomTextField(
            hintText: 'Referral ID / Mobile',
            controller: TextEditingController(),
          ),
          CustomSpacers.height30,
          CustomButton(
            onPressed: onSubmit,
            btnText: 'Submit',
          ),
          CustomSpacers.height20,
          GoBackButton(onTap: onBackPressed),
          CustomSpacers.height120,
        ],
      ),
    );
  }
}
