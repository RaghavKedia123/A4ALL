import 'package:divyam_flutter/core/enums/offer_status.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/offers/presentation/widgets/offer_card.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:divyam_flutter/ui/moleclues/custom_floating_action_btn.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:divyam_flutter/ui/moleclues/custom_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOffersScreen extends StatelessWidget {
  const MyOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'My Offers',
      floatingActionButton: CustomFloatingActionButton(
          onPressed: () =>
              CustomNavigator.pushTo(context, AppRouter.createOfferFormScreen),
          label: 'Create New Offer',
          icon: Icons.add),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CustomSpacers.height20,
            CustomTabWidget(
              tabWidth: 280,
              onValueChange: (val) {},
              options: const {'Active', 'Previous'},
              optionWidth: 129,
            ),
            CustomSpacers.height20,
            for (var offer in OfferStatusType.values) ...[
              MyOfferCard(status: offer),
              CustomSpacers.height20,
            ]
          ],
        ),
      ),
    );
  }
}
