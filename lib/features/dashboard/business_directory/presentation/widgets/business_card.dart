import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/enums/business_status.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/business_status.dart';
import 'package:divyam_flutter/ui/moleclues/nueromorphic_container.dart';
import 'package:divyam_flutter/ui/moleclues/profile_picture.dart';
import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  final BusinessStatusType status;
  final VoidCallback onTap;
  const BusinessCard({super.key, required this.status, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: NeuroMorphicContainer(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * .41,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BusinessStatusWidget(
              status: status,
            ),
            CustomSpacers.height16,
            const ProfilePicture.network(
              path:
                  'https://s3-alpha-sig.figma.com/img/0bc0/5f4a/e68e2e426208bb1791acf3d097634295?Expires=1724025600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JMmya-TIEc14RMU1264cjkfYD0ZQj9LrdR74WHh9ZUct9fFAcoa-tXAqvESEGUwkaDrKzs7iMNqhf~rFoh4O3~FEE5tRKN9aZ9xDgmW7fxZts~6G1KZGeIYfftklSl3Itk75WYFVZmPsWPWndwNyWKaR1gYy3~KpJ~RLaHFAomB9vtxiZzm1FSerXI7iWFXHIaAzkW8VK6RYMOw6zjBs4dTKzPQWtGiNoXe1BWEibupYBuU3gOjmSUCl7AodNRsa77VyvvEy~34NDWRav5O2aaW46znQ2RxNqXrOdBXbGWb9~r2J7k~dRFhB0JFlQkbK4wzG5N2ad~TCQnZwL5sOSg__',
            ),
            CustomSpacers.height10,
            Text(
              'Dhruv Super Bazar',
              style: AppTextThemes.theme(context).displayLarge,
            ),
            CustomSpacers.height6,
            Text(
              'Khamgaon',
              style: AppTextThemes.theme(context).bodyMedium,
            ),
            CustomSpacers.height6,
            Text(
              '9877698097',
              style: AppTextThemes.theme(context).bodyMedium,
            ),
            CustomSpacers.height6,
            Row(
              children: [
                _buildIconText(icon: Icons.star, text: '4.5', context: context),
                CustomSpacers.width10,
                _buildIconText(
                    icon: Icons.share, text: '4.5', context: context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIconText(
      {required String text,
      required IconData icon,
      required BuildContext context}) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorPalette.textDark,
          size: 13,
        ),
        CustomSpacers.width10,
        Text(
          text,
          style: AppTextThemes.theme(context).bodyMedium,
        ),
      ],
    );
  }
}
