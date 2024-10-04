import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/enums/image_picking_options.dart';
import 'package:divyam_flutter/core/helpers/image_picker_helper.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ScaffoldHelper {
  static void showSuccessSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorPalette.green,
      ),
    );
  }

  static void showFailureSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorPalette.red,
      ),
    );
  }

  static void infoSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: ColorPalette.primaryDarkColor,
      ),
    );
  }

  static Future<XFile?> pickImage(BuildContext context) async {
    ImagePickingOptions? selectedOption;

    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Image Source :',
                  style: Theme.of(context).textTheme.titleLarge),
              CustomSpacers.height20,
              for (var option in ImagePickingOptions.values) ...[
                GestureDetector(
                  onTap: () {
                    selectedOption = option;
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        option.icon,
                        color: ColorPalette.primaryColor,
                      ),
                      CustomSpacers.width12,
                      Text(
                        option.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                CustomSpacers.height20,
              ]
            ],
          ),
        );
      },
    );

    if (selectedOption != null) {
      if (selectedOption!.isCamera) {
        return await ImagePickerHelper.pickImageFromCamera();
      } else {
        return await ImagePickerHelper.pickImageFromGallery();
      }
    }

    return null;
  }
}
