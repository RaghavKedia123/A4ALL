import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/enums/offer_status.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/offers/presentation/widgets/offer_social_icons.dart';
import 'package:divyam_flutter/ui/moleclues/nueromorphic_container.dart';
import 'package:divyam_flutter/ui/moleclues/rounded_image.dart';
import 'package:flutter/material.dart';

class MyOfferCard extends StatelessWidget {
  final OfferStatusType status;
  const MyOfferCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return NeuroMorphicContainer(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildImage(),
          CustomSpacers.width10,
          _buildText(context),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: BoxDecoration(
              color: status.color,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              status.name,
              style: AppTextThemes.theme(context).bodySmall?.copyWith(
                    color: ColorPalette.scaffoldBackgroundColor,
                  ),
            ),
          ),
          CustomSpacers.height10,
          Text(
            'Offer description sdhjdh jdoijsdoi',
            overflow: TextOverflow.ellipsis,
            style: AppTextThemes.theme(context).displayMedium,
          ),
          CustomSpacers.height10,
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            'We are offering 50% off on various brands.',
            style: AppTextThemes.theme(context).bodyMedium,
          ),
          Text(
            'Ghawalkar Stores',
            overflow: TextOverflow.ellipsis,
            style: AppTextThemes.theme(context).displaySmall,
          ),
          CustomSpacers.height10,
          const OffersSocialIcons(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return const RoundedImage.network(
      height: 120,
      width: 120,
      imagePath:
          'https://s3-alpha-sig.figma.com/img/d91b/1542/80a4375edbd1406bde1f350f471f349e?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ljUUvChMAntZYsIOezjWUxQ5tpO2Cg5nkwbHdtdD6JPSZDzx6ZRg1~QcU4PYPWCkZIEnA5D-1HHW0tVzRXozYrjZwII~HPfEXHiR2u5fb4llunlqVbQJ6FFVMfrrOiP8H7wJBM8vogE9ano1FfGT~31tfTT3X4QU0zPpfn1ifz3Ndky~yNU-y2vaZzut-kNsUk2vHSjHkIGXk3sgmp6Miy3xVyNcT~KtKCY6h3Rx1am65~p9vZjtP~AgPWYaRR64A341SsKBe2EjIaHwXZUm5HHRvLABPYIKt5XZydU-BVLIeGpIEnXVpt--YjCHtSBlAw2viyEgQSpmTqNUGLsLSA__',
    );
  }
}
