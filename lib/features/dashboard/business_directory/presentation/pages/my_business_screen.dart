import 'package:divyam_flutter/core/enums/business_form_type.dart';
import 'package:divyam_flutter/core/enums/business_status.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/business_card.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:divyam_flutter/ui/moleclues/custom_floating_action_btn.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBusinessScreen extends StatelessWidget {
  const MyBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'My Business',
      enableBottomSheet: false,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => CustomNavigator.pushTo(
          context,
          AppRouter.addNewBusiness,
          arguments: BusinessFormType.add,
        ),
        label: 'Add New Business',
        icon: Icons.add,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CustomSpacers.height26,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BusinessCard(
                  onTap: () => CustomNavigator.pushTo(
                    context,
                    AppRouter.businessInfoScreen,
                  ),
                  status: BusinessStatusType.live,
                ),
                BusinessCard(
                  status: BusinessStatusType.suspended,
                  onTap: () => CustomNavigator.pushTo(
                    context,
                    AppRouter.businessDetailScreen,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
