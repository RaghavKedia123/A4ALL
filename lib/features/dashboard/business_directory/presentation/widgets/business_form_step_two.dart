import 'package:divyam_flutter/core/enums/business_form_check_box_options.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/attach_or_review_image_widget.dart';
import 'package:divyam_flutter/ui/moleclues/custom_check_box_tile.dart';
import 'package:divyam_flutter/ui/moleclues/custom_drop_down.dart';
import 'package:flutter/material.dart';

class BusinessFormStepTwo extends StatefulWidget {
  const BusinessFormStepTwo({super.key});

  @override
  State<BusinessFormStepTwo> createState() => _BusinessFormStepTwoState();
}

class _BusinessFormStepTwoState extends State<BusinessFormStepTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomDropDown(
            hintText: 'Category 1',
            options: const ["Category 1", "Category 2"],
            controller: TextEditingController()),
        CustomSpacers.height20,
        CustomDropDown(
            hintText: 'Category 2',
            options: const ["Category 1", "Category 2"],
            controller: TextEditingController()),
        CustomSpacers.height20,
        for (var option in BusinessFormCheckBoxOptions.values) ...[
          CustomCheckBoxTile(
            onChanged: (v) {},
            option: option.name,
          ),
          CustomSpacers.height20,
        ],
        const AttachOrReviewShopPicWidget(),
        CustomSpacers.height20,
      ],
    );
  }
}
