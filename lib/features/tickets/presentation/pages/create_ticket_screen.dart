import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/attach_or_review_image_widget.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/profile_picture_selector.dart';
import 'package:divyam_flutter/ui/moleclues/custom_button.dart';
import 'package:divyam_flutter/ui/moleclues/custom_drop_down.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:divyam_flutter/ui/moleclues/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateTicketScreen extends StatefulWidget {
  const CreateTicketScreen({super.key});

  @override
  State<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends State<CreateTicketScreen> {
  final _formKey = GlobalKey<FormState>();
  final _departmentTc = TextEditingController();
  final _titletc = TextEditingController();
  final _descriptionTc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: "OPEN NEW TICKET",
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 20.h),
        child: Form(
          child: Column(
            children: [
              CustomDropDown(
                options: const [],
                controller: _departmentTc,
                hintText: "Select Department",
              ),
              CustomSpacers.height20,
              CustomTextField(
                hintText: "What's your issue about",
                controller: _titletc,
              ),
              CustomSpacers.height20,
              CustomTextField(
                hintText: "Details of your issue",
                controller: _descriptionTc,
              ),
              CustomSpacers.height20,
              const ProfilePicViewerOrSelectorWidget(
                label: "Attach Image",
                changeImageText: "Image changed",
              ),
              CustomSpacers.height16,
              CustomButton(onPressed: () {}, btnText: "Open Ticket")
            ],
          ),
        ),
      ),
    );
  }
}
