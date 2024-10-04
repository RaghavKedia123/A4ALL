import 'package:divyam_flutter/core/constants/figma_constants.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/profile_picture_selector.dart';
import 'package:divyam_flutter/ui/moleclues/custom_button.dart';
import 'package:divyam_flutter/ui/moleclues/custom_drop_down.dart';
import 'package:divyam_flutter/ui/moleclues/custom_radio_list.dart';
import 'package:divyam_flutter/ui/moleclues/custom_text_field.dart';
import 'package:divyam_flutter/ui/moleclues/go_back_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateOfferStepTwo extends StatefulWidget {
  final VoidCallback onBackPressed, onNextPressed;
  const CreateOfferStepTwo(
      {super.key, required this.onBackPressed, required this.onNextPressed});

  @override
  State<CreateOfferStepTwo> createState() => _CreateOfferStepTwoState();
}

class _CreateOfferStepTwoState extends State<CreateOfferStepTwo> {
  late TextEditingController _categoryTC,
      _productNameTC,
      _originalPriceTC,
      _offerPriceTC;

  @override
  void initState() {
    _categoryTC = TextEditingController();

    _productNameTC = TextEditingController();

    _originalPriceTC = TextEditingController();

    _offerPriceTC = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: FigmaValueConstants.defaultPaddingH.w),
      child: Column(
        children: [
          CustomSpacers.height40,
          ProfilePicViewerOrSelectorWidget(
            onChanged: (file) {},
            label: 'Ideal resolution for image is 700x700 px',
            changeImageText: 'Change image (ideal resolution 700x700 px)',
          ),
          CustomSpacers.height20,
          CustomDropDown(
            options: const ['Category 1', 'Category 2'],
            controller: _categoryTC,
            hintText: 'Product category',
          ),
          CustomSpacers.height20,
          CustomRadioList(
            options: const {'Product 1', 'Product 2', 'Product 3', 'Product 4'},
            onChanged: (v) {},
          ),
          CustomSpacers.height20,
          CustomTextField(
            hintText: 'Product name',
            controller: _productNameTC,
          ),
          CustomSpacers.height20,
          CustomTextField(
            hintText: 'Original price',
            controller: _originalPriceTC,
          ),
          CustomSpacers.height20,
          CustomTextField(
            hintText: 'Offer price',
            controller: _offerPriceTC,
          ),
          CustomSpacers.height40,
          CustomButton(
            onPressed: widget.onNextPressed,
            btnText: 'Next',
          ),
          CustomSpacers.height20,
          GoBackButton(onTap: widget.onBackPressed),
          CustomSpacers.height120,
        ],
      ),
    );
  }
}
