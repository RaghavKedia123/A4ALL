import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/offers/presentation/widgets/offer_social_icons.dart';
import 'package:divyam_flutter/ui/moleclues/nueromorphic_container.dart';
import 'package:divyam_flutter/ui/moleclues/profile_picture.dart';
import 'package:divyam_flutter/ui/moleclues/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class OfferPreviewCard extends StatelessWidget {
  const OfferPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return NeuroMorphicContainer(
      padding: const EdgeInsets.all(16),
      borderRadius: 10,
      child: Column(
        children: [
          Row(
            children: [
              const ProfilePicture.network(
                path:
                    'https://c8.alamy.com/comp/DERFBR/colourful-indian-shop-in-puttaparthi-andhra-pradesh-india-DERFBR.jpg',
                size: 36,
              ),
              CustomSpacers.width10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dhruv Super Market',
                    style: AppTextThemes.theme(context).displayMedium,
                  ),
                  Text(
                    'Daily Needs / Grocery',
                    style: AppTextThemes.theme(context).bodyLarge,
                  ),
                ],
              ),
              const Spacer(),
              NeuroMorphicContainer(
                shape: BoxShape.circle,
                padding: const EdgeInsets.all(2),
                height: 30,
                width: 30,
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                      color: ColorPalette.textDark,
                    ),
                    padding: EdgeInsets
                        .zero, // Ensure no extra padding around the icon
                  ),
                ),
              )
            ],
          ),
          CustomSpacers.height20,
          const RoundedImage.network(
            // height: 680,
            width: double.maxFinite,
            imagePath:
                'https://s3-alpha-sig.figma.com/img/bcfc/51b6/1945c529c29bf644101cb16b48d893e0?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nZ3LFpgg34LIkAh5poZ3Te0Xlt3PKYjFiz5ni4Z-dtDwKy9lf~qmIghjt~9vMeblokmyJ-0gfirWPs9ea~UXyhbkfpRwULXuf7ca~wuPJXvUFoc8-yArjiBQ7P4UNBQ7TKL0D5C0HXxa1MCOvqa0RDu0pZpA5JTBUYm6O9W6sAv3bbprhJFpnyiExTn0WPgt96lpGSu2qWoDEtJvVNQN4OWtH0f1qUr9lTwrTnlv-lifqmhMyGohYf7jo4Mu0xcjStkYCGhdSd8MbuEHsnikq48OzOCLZfjRhZYpt0iuYv2mCB1sBZy0Om6cCPnLmZPtOjuWACo-Dst51F7cGaJt3w__',
          ),
          CustomSpacers.height20,
          const OffersSocialIcons(),
        ],
      ),
    );
  }
}
