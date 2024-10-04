import 'package:divyam_flutter/features/dashboard/offers/presentation/widgets/create_new_offer_step_four.dart';
import 'package:divyam_flutter/features/dashboard/offers/presentation/widgets/create_new_offer_step_one.dart';
import 'package:divyam_flutter/features/dashboard/offers/presentation/widgets/create_offer_step_two.dart';
import 'package:divyam_flutter/features/dashboard/offers/presentation/widgets/offer_preview_widget.dart';
import 'package:divyam_flutter/ui/moleclues/custom_scaffold.dart';
import 'package:flutter/material.dart';

class CreateOfferFormScreen extends StatefulWidget {
  const CreateOfferFormScreen({super.key});

  @override
  State<CreateOfferFormScreen> createState() => _CreateOfferFormScreenState();
}

class _CreateOfferFormScreenState extends State<CreateOfferFormScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Create New Offer'.toUpperCase(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CreateNewOfferStepOne(
            onBackPressed: onPrevious,
            onNextPressed: () {
              onNext();
            },
          ),
          CreateOfferStepTwo(
            onBackPressed: onPrevious,
            onNextPressed: () {
              onNext();
            },
          ),
          CreateNewOfferStepThree(
            onBackPressed: onPrevious,
            onNextPressed: () {
              onNext();
            },
          ),
          CreateOfferStepFour(
            onBackPressed: onPrevious,
            onSubmit: () {
              // onNext();
            },
          ),
        ],
      ),
    );
  }

  void onNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void onPrevious() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
