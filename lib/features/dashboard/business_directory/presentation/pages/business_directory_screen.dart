import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/dash_grid_view.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/market_card.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:divyam_flutter/ui/moleclues/custom_drop_down.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessDirectoryScreen extends StatefulWidget {
  const BusinessDirectoryScreen({super.key});

  @override
  State<BusinessDirectoryScreen> createState() =>
      _BusinessDirectoryScreenState();
}

class _BusinessDirectoryScreenState extends State<BusinessDirectoryScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBottomSheet: true,
      appBarTitle: 'Business Directory'.toUpperCase(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const DashBoardGridView(),
            CustomSpacers.height26,
            Row(
              children: [
                CustomDropDown(
                  height: 30,
                  width: 158,
                  hintText: 'Select Category',
                  options: const ["Category 1", "Category 2"],
                  controller: TextEditingController(),
                ),
              ],
            ),
            CustomSpacers.height26,
            MarketCard(
              onTap: () => CustomNavigator.pushTo(
                context,
                AppRouter.businessDetailScreen,
              ),
            ),
            CustomSpacers.height56,
            MarketCard(
              onTap: () => CustomNavigator.pushTo(
                context,
                AppRouter.businessDetailScreen,
              ),
            ),
            CustomSpacers.height56,
          ],
        ),
      ),
    );
  }
}
