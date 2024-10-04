import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/constants/figma_constants.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/ui/moleclues/custom_button.dart';
import 'package:divyam_flutter/ui/moleclues/custom_check_box_tile.dart';
import 'package:divyam_flutter/ui/moleclues/custom_drop_down.dart';
import 'package:divyam_flutter/ui/moleclues/custom_text_field.dart';
import 'package:divyam_flutter/ui/moleclues/go_back_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewOfferStepOne extends StatefulWidget {
  final VoidCallback onBackPressed, onNextPressed;
  const CreateNewOfferStepOne(
      {super.key, required this.onBackPressed, required this.onNextPressed});

  @override
  State<CreateNewOfferStepOne> createState() => _CreateNewOfferStepOneState();
}

class _CreateNewOfferStepOneState extends State<CreateNewOfferStepOne> {
  late TextEditingController _busnessNameTC,
      _offerTypeTC,
      _buyAndSellOfferTC,
      _offerTitleTC,
      _offerdescriptionTC,
      _categoryTC,
      _fromAgeTC,
      _toAgeTC,
      _startDateTC,
      _endDateTC;

  @override
  void initState() {
    _busnessNameTC = TextEditingController();
    _offerTypeTC = TextEditingController();
    _buyAndSellOfferTC = TextEditingController();
    _offerTitleTC = TextEditingController();
    _offerdescriptionTC = TextEditingController();
    _categoryTC = TextEditingController();
    _fromAgeTC = TextEditingController();
    _toAgeTC = TextEditingController();
    _startDateTC = TextEditingController();
    _endDateTC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _busnessNameTC.dispose();
    _offerTypeTC.dispose();
    _buyAndSellOfferTC.dispose();
    _offerTitleTC.dispose();
    _offerdescriptionTC.dispose();
    _categoryTC.dispose();
    _fromAgeTC.dispose();
    _toAgeTC.dispose();
    _startDateTC.dispose();
    _endDateTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: FigmaValueConstants.defaultPaddingH.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSpacers.height20,
          CustomDropDown(
            options: const ['business 1', 'business 2'],
            controller: _busnessNameTC,
            hintText: 'Select Business Name',
          ),
          CustomSpacers.height20,
          CustomDropDown(
            options: const ['Offer 1', 'Offer 2'],
            controller: _offerTypeTC,
            hintText: 'Offer type (entry screen)',
          ),
          CustomSpacers.height20,
          CustomDropDown(
            options: const ['business 1', 'business 2'],
            controller: _buyAndSellOfferTC,
            hintText: 'Buy offer / Sell offer',
          ),
          CustomSpacers.height20,
          CustomTextField(
            hintText: 'Offer title',
            controller: _offerTitleTC,
          ),
          CustomSpacers.height20,
          CustomTextField(
            maxLines: 6,
            hintText: 'Offer description',
            controller: _offerdescriptionTC,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                '+ Add more language',
                style: AppTextThemes.theme(context)
                    .bodySmall
                    ?.copyWith(color: ColorPalette.primaryColor),
              ),
            ),
          ),
          CustomSpacers.height20,
          CustomDropDown(
            options: const ['Category 1', 'Category 2'],
            controller: _categoryTC,
            hintText: 'Product category',
          ),
          CustomSpacers.height20,
          CustomCheckBoxTile(
            onChanged: (v) {},
            option: 'Target all ages',
          ),
          CustomSpacers.height20,
          Row(
            children: [
              Expanded(
                child: CustomDropDown(
                  options: const ['1', '2'],
                  controller: _fromAgeTC,
                  hintText: 'From age',
                ),
              ),
              CustomSpacers.width20,
              Expanded(
                child: CustomDropDown(
                  options: const ['1', '2'],
                  controller: _toAgeTC,
                  hintText: 'To age',
                ),
              ),
            ],
          ),
          CustomSpacers.height20,
          CustomDropDown(
            options: const ['Male', 'Female', 'Transgender'],
            controller: _toAgeTC,
            hintText: 'Target sex',
          ),
          CustomSpacers.height20,
          CustomTextField(
              hintText: 'Start date (optional)', controller: _startDateTC),
          CustomSpacers.height20,
          CustomTextField(
              hintText: 'End date (optional)', controller: _endDateTC),
          CustomSpacers.height20,
          CustomButton(onPressed: widget.onNextPressed, btnText: 'Next'),
          CustomSpacers.height20,
          GoBackButton(onTap: widget.onBackPressed),
          CustomSpacers.height120,
        ],
      ),
    );
  }
}
