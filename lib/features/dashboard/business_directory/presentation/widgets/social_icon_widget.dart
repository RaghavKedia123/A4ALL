import 'package:divyam_flutter/core/enums/social_options.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/ui/moleclues/nueromorphic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: SocialOptions.values
          .map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NeuroMorphicContainer(
                    padding: const EdgeInsets.all(2),
                    height: 30,
                    width: 30,
                    shape: BoxShape.circle,
                    child: SvgPicture.asset(
                      e.assetName,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  CustomSpacers.height10,
                  Text(
                    e.name,
                    style: AppTextThemes.theme(context).bodySmall,
                  ),
                ],
              ))
          .toList(),
    );
  }
}
