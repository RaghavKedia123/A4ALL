import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/ui/moleclues/nueromorphic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class CustomCheckBoxTile extends StatefulWidget {
  final String option;
  final Function(bool?) onChanged;
  const CustomCheckBoxTile(
      {super.key, required this.onChanged, required this.option});

  @override
  State<CustomCheckBoxTile> createState() => _CustomCheckBoxTileState();
}

class _CustomCheckBoxTileState extends State<CustomCheckBoxTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;

          widget.onChanged(isSelected);
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NeuroMorphicContainer(
            height: 20,
            width: 20,
            borderRadius: 5,
            color: isSelected
                ? ColorPalette.primaryColor
                : ColorPalette.scaffoldBackgroundColor,
          ),
          CustomSpacers.width10,
          Expanded(
            child: Text(
              widget.option,
              style: AppTextThemes.theme(context).titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
