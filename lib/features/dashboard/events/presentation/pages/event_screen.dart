import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/events/presentation/widgets/event_card.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:divyam_flutter/ui/moleclues/dash_board_action_btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../ui/moleclues/custom_drop_down.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      floatingActionButton: DashBoardActionButtons(
        onAddPressed: () =>
            CustomNavigator.pushTo(context, AppRouter.myEventScreen),
        onMlmPressed: () {},
      ),
      enableBottomSheet: true,
      appBarTitle: 'Events'.toUpperCase(),
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
              ],
            ),
            CustomSpacers.height20,
            EventCard(
              onTap: () =>
                  CustomNavigator.pushTo(context, AppRouter.eventDetailScreen),
            ),
            CustomSpacers.height120,
          ],
        ),
      ),
    );
  }
}
