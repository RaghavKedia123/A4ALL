import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/market_card.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:divyam_flutter/ui/moleclues/custom_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: "FAVOURITES",
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            CustomTabWidget(
              tabWidth: double.infinity,
              onValueChange: (v) {},
              options: const {"BUSINESS", "OFFERS", "EVENTS", "ANN's"},
              optionWidth: 65.w,
              borderRadius: 10.r,
            ),
            CustomSpacers.height20,
            MarketCard(onTap: () {})
          ],
        ),
      ),
    );
  }
}
