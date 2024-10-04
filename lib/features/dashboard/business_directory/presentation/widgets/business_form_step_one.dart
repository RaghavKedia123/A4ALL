import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/cubits/state_selector_cubit/state_selector_cubit.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/profile_picture_selector.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/select_time_widget.dart';
import 'package:divyam_flutter/ui/moleclues/custom_check_box_tile.dart';
import 'package:divyam_flutter/ui/moleclues/custom_drop_down.dart';
import 'package:divyam_flutter/ui/moleclues/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessFormStepOne extends StatefulWidget {
  final StateSelectorCubit cubit;
  const BusinessFormStepOne({super.key, required this.cubit});

  @override
  State<BusinessFormStepOne> createState() => _BusinessFormStepOneState();
}

class _BusinessFormStepOneState extends State<BusinessFormStepOne> {
  late TextEditingController _stateTC, _districtTC, _cityTC;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.cubit.getStates();
    });
    super.initState();
    _stateTC = TextEditingController();
    _districtTC = TextEditingController();
    _cityTC = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          hintText: 'Name of Business',
          controller: TextEditingController(),
        ),
        CustomSpacers.height20,
        ProfilePicViewerOrSelectorWidget(
          onChanged: (file) {},
          label: 'Upload logo image Ideal resolution 50 X 50 px',
          changeImageText: 'Change logo image',
        ),
        CustomSpacers.height20,
        CustomTextField(
          hintText: 'Mobile',
          controller: TextEditingController(),
        ),
        CustomSpacers.height20,
        CustomTextField(
          hintText: 'Email',
          controller: TextEditingController(),
        ),
        CustomSpacers.height20,
        CustomTextField(
          hintText: 'Contact person',
          controller: TextEditingController(),
        ),
        CustomSpacers.height20,
        CustomTextField(
          hintText: 'Website URL (optional)',
          controller: TextEditingController(),
        ),
        CustomSpacers.height20,
        CustomTextField(
          hintText: 'WhatsApp number (optional)',
          controller: TextEditingController(),
        ),
        CustomSpacers.height20,
        //nanu
        _buildStateDropDown(),
        CustomSpacers.height20,
        CustomTextField(
          maxLines: 5,
          hintText: 'Registered address',
          controller: TextEditingController(),
        ),
        CustomSpacers.height20,
        CustomTextField(
          hintText: 'Pincode',
          controller: TextEditingController(),
        ),
        CustomSpacers.height20,
        CustomTextField(
          hintText: 'Google Map link',
          controller: TextEditingController(),
        ),
        CustomSpacers.height20,
        const SelectTimeWidget(),
      ],
    );
  }

  Widget _buildStateDropDown() {
    return BlocBuilder<StateSelectorCubit, StateSelectorState>(
      bloc: widget.cubit,
      builder: (context, state) {
        debugPrint('state is ${widget.cubit.selectedState?.name}');
        debugPrint(
            'talukas is ${widget.cubit.selectedDistrict?.talukas.length}');
        return Column(
          children: [
            CustomDropDown(
              onChanged: (idx) {
                widget.cubit.filterStates(widget.cubit.allStates[idx!]);
              },
              hintText: 'State',
              options: widget.cubit.allStates.map((e) => e.name).toList(),
              controller: _stateTC,
            ),
            CustomSpacers.height20,
            CustomCheckBoxTile(
              option: 'Business is located in a metro city',
              onChanged: (v) {},
            ),
            CustomSpacers.height20,
            Visibility(
              visible: widget.cubit.selectedState?.districts != null &&
                  widget.cubit.selectedState!.districts.isNotEmpty,
              child: CustomDropDown(
                  onChanged: (idx) {
                    widget.cubit.selectDistrict(
                      widget.cubit.selectedState!.districts[idx!],
                    );
                  },
                  hintText: 'District / Metro city',
                  options: widget.cubit.selectedState?.districts
                          .map((e) => e.name)
                          .toList() ??
                      [],
                  controller: _cityTC),
            ),
            CustomSpacers.height20,
            Visibility(
              visible: widget.cubit.selectedDistrict != null &&
                  widget.cubit.selectedDistrict!.talukas.isNotEmpty,
              child: CustomDropDown(
                hintText: 'Taluka / Area',
                options: widget.cubit.selectedDistrict?.talukas
                        .map((e) => e.name)
                        .toList() ??
                    ['Taluka / Area'],
                controller: TextEditingController(),
              ),
            ),
          ],
        );
      },
    );
  }
}
