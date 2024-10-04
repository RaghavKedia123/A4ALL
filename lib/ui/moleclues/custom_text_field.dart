import 'package:divyam_flutter/core/constants/color_palette.dart';
import 'package:divyam_flutter/core/themes/text_themes/text_themes.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? maxLength;
  final bool? readOnly;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.labelText,
    this.readOnly = false,
    this.maxLines = 1,
    this.onTap,
    this.maxLength,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: widget.validator,
        builder: (FormFieldState<String> state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (widget.labelText != null) // Check if labelText is provided
                Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Text(
                    widget.labelText!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorPalette.textDark,
                    ),
                  ),
                ),
              Neumorphic(
                style: NeumorphicStyle(
                  depth: -3, // Create a recessed effect with a negative depth
                  intensity: 1, // Adjust the intensity of the shadow
                  surfaceIntensity: 0.4,
                  lightSource: LightSource
                      .topLeft, // Light source for the top-left shadow
                  shadowDarkColor:
                      Colors.black, // Darker shadow at the top-left
                  boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(10.sp)),
                  color:
                      ColorPalette.scaffoldBackgroundColor, // Background color
                  shadowLightColorEmboss: Colors.white,
                ),
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    alignment: Alignment.center,
                    child: TextFormField(
                      readOnly: widget.readOnly ?? false,
                      maxLength: widget.maxLength,
                      maxLines: widget.maxLines,
                      controller: widget.controller,
                      obscureText: widget.obscureText,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      onFieldSubmitted: widget.onSubmitted,
                      onChanged: (e) => state.didChange(e),
                      style: AppTextThemes.theme(context).titleLarge,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: ColorPalette.textPlaceholder,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        prefixIcon: widget.prefixIcon,
                        suffixIcon: widget.suffixIcon,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              if (state.hasError)
                Text(
                  state.errorText ?? '',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
                ),
            ],
          );
        });
  }
}
