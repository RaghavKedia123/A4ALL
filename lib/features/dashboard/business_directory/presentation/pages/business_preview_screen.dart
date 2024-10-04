import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/market_card.dart';
import 'package:divyam_flutter/ui/moleclues/custom_button.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessPreviewScreen extends StatelessWidget {
  const BusinessPreviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Business Preview'.toUpperCase(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSpacers.height20,
              Text(
                'Preview',
                style: AppTextThemes.theme(context).displayMedium,
              ),
              CustomSpacers.height20,
              MarketCard(onTap: () {}),
              CustomSpacers.height40,
              CustomButton(onPressed: () {}, btnText: 'Confirm'),
            ],
          ),
        ),
      ),
    );
  }
}
