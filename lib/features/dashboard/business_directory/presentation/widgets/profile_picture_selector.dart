import 'dart:io';

import 'package:divyam_flutter/core/helpers/scaffold_helpers.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/ui/moleclues/neuromorphic_button.dart';
import 'package:divyam_flutter/ui/moleclues/profile_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class ProfilePicViewerOrSelectorWidget extends StatefulWidget {
  final String? networkUrl;
  final Function(File?)? onChanged;
  final String label, changeImageText;
  const ProfilePicViewerOrSelectorWidget(
      {super.key,
      this.networkUrl,
      this.onChanged,
      required this.label,
      required this.changeImageText});

  @override
  State<ProfilePicViewerOrSelectorWidget> createState() =>
      _ProfilePicViewerOrSelectorWidgetState();
}

class _ProfilePicViewerOrSelectorWidgetState
    extends State<ProfilePicViewerOrSelectorWidget> {
  XFile? image;
  late String text;

  @override
  void initState() {
    text = widget.label;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (image != null)
          ProfilePicture.file(
            path: image!.path,
            size: 120,
          ),
        if (image == null && widget.networkUrl != null) ...[
          ProfilePicture.network(
            path: widget.networkUrl!,
            size: 120,
          ),
        ],
        Visibility(
          visible: image == null,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              text,
              style: AppTextThemes.theme(context).titleLarge,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NeuromorphicButton(
              btnText: 'Select image',
              onPressed: () {
                print('btn pressed');
                _pickImage();
              },
            ),
            CustomSpacers.height10,
            Visibility(
              visible: image != null,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  text,
                  style: AppTextThemes.theme(context).titleLarge,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    XFile? file = await ScaffoldHelper.pickImage(context);
    setState(
      () {
        if ((image == null && file != null) || file != null) {
          text = widget.changeImageText;
          image = file;
          widget.onChanged
              ?.call(image?.path != null ? File(image!.path) : null);
        }
      },
    );
  }
}
