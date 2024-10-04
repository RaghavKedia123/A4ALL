import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/constants/figma_constants.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatefulWidget {
  final double? height, width, borderRadius;
  final List<String> options;
  final Function(int?)? onChanged;
  final String? groupValue;
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;

  const CustomDropDown({
    super.key,
    required this.options,
    required this.controller,
    this.groupValue,
    this.height = FigmaValueConstants.dropDownHeight,
    this.width,
    this.onChanged,
    // this.width = FigmaValueConstants.btnWidth,
    this.borderRadius = FigmaValueConstants.btnBorderRadius,
    this.hintText = '',
    this.validator,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? dropdownValue = '';

  @override
  void initState() {
    dropdownValue = widget.groupValue ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              height: widget.height!.h,
              width: widget.width?.w,
              decoration: BoxDecoration(
                color: ColorPalette.scaffoldBackgroundColor,
                boxShadow: FigmaValueConstants.boxShadow,
                borderRadius: BorderRadius.circular(10),
                border: state.hasError
                    ? Border.all(color: Colors.red)
                    : null, // Highlight border on error
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  isExpanded: true,
                  value: dropdownValue == null
                      ? null
                      : widget.options.isNotEmpty &&
                              widget.options.contains(dropdownValue)
                          ? widget.options.firstWhere((i) => i == dropdownValue)
                          : null,

                  hint: Text(
                    widget.hintText ?? "Select an option",
                    style: const TextStyle(
                        color: Colors.grey), // Style the hint text
                  ), // Display hint text
                  dropdownColor: ColorPalette.scaffoldBackgroundColor,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorPalette.textDark,
                  ),
                  iconSize: 24,
                  elevation: 8,
                  style: AppTextThemes.theme(context).titleLarge,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      final idx = widget.options.indexOf(newValue);
                      widget.onChanged?.call(idx);
                      widget.controller.text = newValue;
                      state.didChange(
                          newValue); // Notify FormField of the change
                    });
                  },
                  items: widget.options.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            if (state.hasError) ...[
              CustomSpacers.height8,
              Text(
                state.errorText ?? '',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
