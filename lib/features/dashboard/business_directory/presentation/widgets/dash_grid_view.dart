import 'package:divyam_flutter/core/enums/dasboard_options.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/dashbord_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardGridView extends StatelessWidget {
  const DashBoardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20.0.w,
          mainAxisSpacing: 18.0.h,
          childAspectRatio: 1,
        ),
        itemCount: DashBoardOptions.values.length,
        itemBuilder: (context, index) {
          return DashBoardOptionCard(
            assetName: DashBoardOptions.values[index].assetName,
            text: DashBoardOptions.values[index].title,
          );
        },
      ),
    );
  }
}
