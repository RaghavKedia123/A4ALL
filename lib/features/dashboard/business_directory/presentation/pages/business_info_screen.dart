import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/enums/business_form_type.dart';
import 'package:divyam_flutter/core/enums/business_status.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/business_status.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/image_preview.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/suspended_box.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:divyam_flutter/ui/moleclues/custom_floating_action_btn.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:divyam_flutter/ui/moleclues/lable_value_display.dart';
import 'package:divyam_flutter/ui/moleclues/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessInfoScreen extends StatelessWidget {
  const BusinessInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => CustomNavigator.pushTo(
          context,
          AppRouter.addNewBusiness,
          arguments: BusinessFormType.edit,
        ),
        label: 'Edit Business',
      ),
      appBarTitle: 'My Business'.toUpperCase(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSpacers.height20,
            SuspendedBox(
              message:
                  'This business listing has been suspended because of reported violation of privacy',
              onDetailTap: () => CustomNavigator.pushTo(
                  context, AppRouter.issuesResolutionScreen),
            ),
            CustomSpacers.height20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dhruv Super Bazar',
                      style: AppTextThemes.theme(context).displayLarge,
                    ),
                    CustomSpacers.height10,
                    const BusinessStatusWidget(
                      status: BusinessStatusType.suspended,
                    ),
                    CustomSpacers.height10,
                    const LabelValueWidget(
                        label: 'Mobile', value: '9877698097'),
                    CustomSpacers.height10,
                    const LabelValueWidget(
                        label: 'WhatsApp', value: '9877698097'),
                    CustomSpacers.height10,
                  ],
                ),
                const ProfilePicture.network(
                  size: 100,
                  path:
                      'https://s3-alpha-sig.figma.com/img/0bc0/5f4a/e68e2e426208bb1791acf3d097634295?Expires=1724025600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JMmya-TIEc14RMU1264cjkfYD0ZQj9LrdR74WHh9ZUct9fFAcoa-tXAqvESEGUwkaDrKzs7iMNqhf~rFoh4O3~FEE5tRKN9aZ9xDgmW7fxZts~6G1KZGeIYfftklSl3Itk75WYFVZmPsWPWndwNyWKaR1gYy3~KpJ~RLaHFAomB9vtxiZzm1FSerXI7iWFXHIaAzkW8VK6RYMOw6zjBs4dTKzPQWtGiNoXe1BWEibupYBuU3gOjmSUCl7AodNRsa77VyvvEy~34NDWRav5O2aaW46znQ2RxNqXrOdBXbGWb9~r2J7k~dRFhB0JFlQkbK4wzG5N2ad~TCQnZwL5sOSg__',
                ),
              ],
            ),
            for (var item in sampleData) ...[
              item,
              CustomSpacers.height10,
            ],
            CustomSpacers.height20,
            const ImagePreviewWidget(),
            CustomSpacers.height20,
            Row(
              children: [
                _buildIconText(icon: Icons.star, text: '4.5', context: context),
                CustomSpacers.width10,
                _buildIconText(icon: Icons.share, text: '45', context: context),
              ],
            ),
            CustomSpacers.height10,
            const LabelValueWidget(label: 'Created on', value: '10/10/2022'),
            CustomSpacers.height56,
          ],
        ),
      ),
    );
  }

  Widget _buildIconText(
      {required String text,
      required IconData icon,
      required BuildContext context}) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorPalette.textDark,
          size: 13,
        ),
        CustomSpacers.width10,
        Text(
          text,
          style: AppTextThemes.theme(context).bodyMedium,
        ),
      ],
    );
  }
}

List<LabelValueWidget> sampleData = const [
  LabelValueWidget(label: 'Website', value: 'www.example.com'),
  LabelValueWidget(label: 'Contact Person', value: 'John Doe'),
  LabelValueWidget(label: 'State', value: 'California'),
  LabelValueWidget(label: 'District', value: 'Los Angeles'),
  LabelValueWidget(label: 'Reg. Address', value: '123 Main St, LA'),
  LabelValueWidget(label: 'PIN', value: '90001'),
  LabelValueWidget(label: 'Timing', value: '9 AM - 5 PM'),
  LabelValueWidget(label: 'Category Level 1', value: 'Services'),
  LabelValueWidget(label: 'Category Level 2', value: 'Technology'),
  LabelValueWidget(label: 'Category Level 3', value: 'Software'),
  LabelValueWidget(
      label: 'Services/Products',
      value: '\nShare Trading\nInvestment\nInsurance'),
];
