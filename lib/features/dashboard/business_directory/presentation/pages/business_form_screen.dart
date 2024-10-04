import 'dart:async';

import 'package:divyam_flutter/core/constants/figma_constants.dart';
import 'package:divyam_flutter/core/enums/business_form_type.dart';
import 'package:divyam_flutter/core/utils/custom_spacers.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/cubits/state_selector_cubit/state_selector_cubit.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/business_form_step_one.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/widgets/business_form_step_two.dart';
import 'package:divyam_flutter/injection_container/injection_container.dart';
import 'package:divyam_flutter/router/app_routes.dart';
import 'package:divyam_flutter/router/custom_navigator.dart';
import 'package:divyam_flutter/ui/moleclues/custom_button.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:divyam_flutter/ui/moleclues/full_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessFormScreen extends StatefulWidget {
  final BusinessFormType businessFormType;
  const BusinessFormScreen({super.key, required this.businessFormType});

  @override
  State<BusinessFormScreen> createState() => _BusinessFormScreenState();
}

class _BusinessFormScreenState extends State<BusinessFormScreen> {
  late StreamController<int> _pageController;
  late StateSelectorCubit _editBusinessCubit;
  @override
  void initState() {
    _pageController = StreamController<int>.broadcast();
    _editBusinessCubit = sl<StateSelectorCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: widget.businessFormType.appBarTitle,
      body: BlocBuilder<StateSelectorCubit, StateSelectorState>(
        bloc: _editBusinessCubit,
        builder: (context, state) {
          return FullScreenProgressIndicator(
            isLoading: state is StatesLoadingState,
            child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: FigmaValueConstants.defaultPaddingH.w),
                child: _buildBody()),
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    return widget.businessFormType.isAdd
        ? _buildNewBusinessForm()
        : _buildExistingBusinessForm();
  }

  Widget _buildExistingBusinessForm() {
    return StreamBuilder<int>(
      stream: _pageController.stream,
      initialData: 0,
      builder: (context, snapshot) {
        return Column(
          children: [
            CustomSpacers.height20,
            snapshot.data == 0
                ? BusinessFormStepOne(
                    cubit: _editBusinessCubit,
                  )
                : const BusinessFormStepTwo(),
            CustomButton(
                onPressed: () {
                  if (snapshot.data == 0) {
                    _pageController.sink.add(1);
                  } else {
                    _navigate();
                  }
                },
                btnText: snapshot.data == 0 ? 'Next' : 'Update'),
            CustomSpacers.height20,
            Visibility(
              visible: snapshot.data == 1,
              child: CustomButton(
                  onPressed: () {
                    _pageController.sink.add(0);
                  },
                  btnText: 'Previous'),
            ),
            CustomSpacers.height120,
          ],
        );
      },
    );
  }

  Widget _buildNewBusinessForm() {
    return Column(
      children: [
        CustomSpacers.height20,
        BusinessFormStepOne(
          cubit: _editBusinessCubit,
        ),
        CustomSpacers.height20,
        const BusinessFormStepTwo(),
        CustomSpacers.height20,
        CustomButton(onPressed: () => _navigate(), btnText: 'Submit'),
        CustomSpacers.height120,
      ],
    );
  }

  void _navigate() {
    CustomNavigator.pushTo(context, AppRouter.businessPreviewScreen);
  }
}
