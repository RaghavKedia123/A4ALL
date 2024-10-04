import 'dart:io';

import 'package:divyam_flutter/core/helpers/scaffold_helpers.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/ui/moleclues/neuromorphic_button.dart';
import 'package:divyam_flutter/ui/moleclues/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class AttachOrReviewShopPicWidget extends StatefulWidget {
  final Function(File? file)? onFileSelected;
  final String? secondaryImageLabel, primaryImageLabel;
  final bool? onlyPickSecondaryImages;
  final int? maxSecondaryImages;
  const AttachOrReviewShopPicWidget({
    super.key,
    this.onFileSelected,
    this.primaryImageLabel,
    this.secondaryImageLabel,
    this.maxSecondaryImages = 2,
    this.onlyPickSecondaryImages = false,
  });

  @override
  State<AttachOrReviewShopPicWidget> createState() =>
      _AttachOrReviewShopPicWidgetState();
}

class _AttachOrReviewShopPicWidgetState
    extends State<AttachOrReviewShopPicWidget> {
  XFile? primaryImg;

  late List<XFile> secondaryImages;

  String text = 'Add image';

  @override
  void initState() {
    super.initState();
    secondaryImages = [];

    text = widget.maxSecondaryImages == 1
        ? widget.secondaryImageLabel ?? 'Add image'
        : '${widget.secondaryImageLabel} (max: ${widget.maxSecondaryImages})';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSpacers.height20,
        if (widget.onlyPickSecondaryImages == false) primaryImage(),
        secondaryImages.isNotEmpty
            ? _buildSecondayImage(widget.maxSecondaryImages!, secondaryImages)
            : _buildImageSelector(
                label: '${widget.secondaryImageLabel}',
                onTap: () => _pickSecondaryImage(),
                axis: Axis.horizontal),
      ],
    );
  }

  Widget primaryImage() {
    return primaryImg != null
        ? _buildPrimaryImage(primaryImg!.path, () => _pickPrimaryImage())
        : _buildImageSelector(
            label: 'Add primary image',
            onTap: () => _pickPrimaryImage(),
            axis: Axis.horizontal);
  }

  Future<void> _pickPrimaryImage() async {
    XFile? file = await ScaffoldHelper.pickImage(context);
    if (file != null) {
      primaryImg = file;
      setState(() {});
    }
  }

  Future<void> _pickSecondaryImage() async {
    if (secondaryImages.length < widget.maxSecondaryImages!) {
      XFile? file = await ScaffoldHelper.pickImage(context);
      if (file != null) {
        secondaryImages.add(file);
      }
      setState(() {});
    }
  }

  Widget _buildSecondayImage(int maxImages, List<XFile>? secondaryImages) {
    return Column(
      children: [
        GridView.builder(
          itemCount: (secondaryImages?.length ?? 0) + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 1,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index < (secondaryImages?.length ?? 0)) {
              return RoundedImage.file(
                imagePath: secondaryImages![index].path,
                height: 130,
                width: 130,
              );
            } else {
              return _buildImageSelector(
                  label: 'Change Image)',
                  onTap: () => _pickSecondaryImage(),
                  axis: Axis.vertical);
            }
          },
        ),
        CustomSpacers.height12,
      ],
    );
  }

  Widget _buildPrimaryImage(String url, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (primaryImg != null)
          RoundedImage.file(
            imagePath: url,
            height: 130,
            width: 130,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (primaryImg != null) ...[
              Row(
                children: [
                  SizedBox(
                    child: Text(
                      'Change primary\nimage',
                      textAlign: TextAlign.center,
                      style: AppTextThemes.theme(context).titleLarge,
                    ),
                  ),
                ],
              ),
              CustomSpacers.height12,
            ],
            NeuromorphicButton(
              btnText: 'Select image',
              onPressed: () => onTap(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageSelector(
      {required String label,
      required VoidCallback onTap,
      required Axis axis}) {
    if (axis == Axis.horizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              label,
              style: AppTextThemes.theme(context).titleLarge,
            ),
          ),
          CustomSpacers.width10,
          CustomSpacers.height12,
          NeuromorphicButton(
            btnText: 'Select image',
            onPressed: () => onTap(),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              textAlign: TextAlign.center,
              label,
              style: AppTextThemes.theme(context).titleLarge,
            ),
          ),
          CustomSpacers.height12,
          NeuromorphicButton(
            btnText: 'Select image',
            onPressed: () => onTap(),
          ),
        ],
      );
    }
  }
}
