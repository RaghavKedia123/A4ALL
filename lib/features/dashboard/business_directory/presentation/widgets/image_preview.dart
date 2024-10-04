import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/ui/moleclues/rounded_image.dart';
import 'package:flutter/material.dart';

class ImagePreviewWidget extends StatelessWidget {
  final String? url;
  const ImagePreviewWidget(
      {super.key,
      this.url =
          'https://c8.alamy.com/comp/DERFBR/colourful-indian-shop-in-puttaparthi-andhra-pradesh-india-DERFBR.jpg'});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedImage.network(
          height: 280,
          width: double.maxFinite,
          imagePath: url!,
        ),
        CustomSpacers.height10,
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Space between columns
            mainAxisSpacing: 10.0, // Space between rows
            childAspectRatio:
                1.0, // Aspect ratio of each grid item (width / height)
          ),
          children: [
            RoundedImage.network(
              height: 150,
              width: 150,
              imagePath: url!,
            ),
            RoundedImage.network(
              height: 150,
              width: 150,
              imagePath: url!,
            ),
          ],
        ),
      ],
    );
  }
}
