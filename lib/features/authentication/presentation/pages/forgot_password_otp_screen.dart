import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/constants/image_constants.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/core/utils/get-final-string.dart';
import 'package:divyam_flutter/ui/moleclues/custom_button.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:divyam_flutter/ui/moleclues/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordOTPScreen extends StatefulWidget {
  const ForgotPasswordOTPScreen({super.key});

  @override
  State<ForgotPasswordOTPScreen> createState() =>
      _ForgotPasswordOTPScreenState();
}

class _ForgotPasswordOTPScreenState extends State<ForgotPasswordOTPScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: "Verify OTP",
      height: MediaQuery.of(context).size.height,
      enableMenu: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 20.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SELECT LANGUAGE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ColorPalette.primaryColor,
                              shadows: [
                                Shadow(
                                  offset: const Offset(
                                      1, 1), // position of the shadow
                                  blurRadius: 1.0, // blur effect
                                  color: Colors.black.withOpacity(
                                    0.15,
                                  ), // shadow color with 15% opacity
                                ),
                              ],
                            ),
                          ),
                          CustomSpacers.width6,
                          SvgPicture.asset(
                            AppIcons.language,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ],
                      ),
                    ),
                    CustomSpacers.height30,
                    Text(
                      "Enter OTP",
                      style: AppTextThemes.theme(context).titleLarge!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    CustomSpacers.height15,
                    Text(
                      getFinalLabel(
                        "Note: Enter the OTP sent to +91-7009391495",
                      ),
                      style: AppTextThemes.theme(context).bodyMedium!.copyWith(
                            color: ColorPalette.textDark,
                          ),
                    ),
                    CustomSpacers.height20,
                    CustomTextField(
                      controller: _textController,
                      keyboardType: TextInputType.phone,
                      hintText: "OTP",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your mobile number';
                        } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Please enter a valid mobile number';
                        }
                        return null;
                      },
                    ),
                    CustomSpacers.height20,
                    CustomButton(
                      btnText: "Verify OTP",
                      height: 50,
                      width: double.infinity,
                      onPressed: () {},
                    ),
                    CustomSpacers.height30,
                    GestureDetector(
                      child: Text(
                        "SIGN IN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorPalette.primaryColor,
                          shadows: [
                            Shadow(
                              offset: const Offset(
                                1,
                                1,
                              ), // position of the shadow
                              blurRadius: 1.0, // blur effect
                              color: Colors.black.withOpacity(
                                0.15,
                              ), // shadow color with 15% opacity
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
