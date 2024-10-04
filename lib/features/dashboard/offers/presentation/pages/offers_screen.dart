import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/offer_card.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:divyam_flutter/ui/moleclues/custom_drop_down.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:divyam_flutter/ui/moleclues/dash_board_action_btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      floatingActionButton: DashBoardActionButtons(
        onAddPressed: () =>
            CustomNavigator.pushTo(context, AppRouter.myOffersScreen),
        onMlmPressed: () {},
      ),
      enableBottomSheet: true,
      appBarTitle: 'Offers'.toUpperCase(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CustomSpacers.height20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDropDown(
                  width: MediaQuery.of(context).size.width * 0.39,
                  height: 35,
                  options: const ["Filter 1", "Filter 2"],
                  hintText: 'Filter',
                  controller: TextEditingController(),
                ),
                CustomSpacers.width10,
                CustomDropDown(
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.39,
                  options: const ["Location 1", "Location 2"],
                  hintText: 'Location',
                  controller: TextEditingController(),
                ),
                CustomSpacers.height20,
              ],
            ),
            CustomSpacers.height20,
            OfferCard(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
