import 'dart:async';

import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/extentions/date_time_extension.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/core/utils/date_timer_picker_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class SelectTimeWidget extends StatefulWidget {
  final String? openingTime, closingTime;
  const SelectTimeWidget({super.key, this.openingTime, this.closingTime});

  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  String? _openingTime, _closingTime;

  @override
  void initState() {
    _closingTime = widget.closingTime;
    _openingTime = widget.openingTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTimeBox(_openingTime, true),
        _buildTimeBox(_closingTime, false),
      ],
    );
  }

  Widget _buildTimeBox(String? time, bool isOpeningTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            textAlign: TextAlign.center,
            time ?? getString(isOpenning: isOpeningTime),
            style: AppTextThemes.theme(context).titleMedium,
          ),
        ),
        CustomSpacers.height10,
        TextButton(
          onPressed: () => _pickTime(isOpeningTime),
          child: Text(
            'Select Time',
            style: AppTextThemes.theme(context).displayMedium?.copyWith(
                  color: ColorPalette.primaryColor,
                ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickTime(bool isOpeningTime) async {
    final time = await DateTimePickerUtil.pickTime(context: context);
    if (time != null) {
      if (isOpeningTime) {
        setState(() {
          _openingTime = time.formatToAmPm();
        });
      } else {
        setState(() {
          _closingTime = time.formatToAmPm();
        });
      }
    }
  }

  String getString({required bool isOpenning}) {
    if (isOpenning) {
      return "Opening Time (optional)";
    } else {
      return "Closing Time (optional)";
    }
  }
}
