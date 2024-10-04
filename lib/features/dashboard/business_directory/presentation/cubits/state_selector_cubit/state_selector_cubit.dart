import 'package:bloc/bloc.dart';
import 'package:divyam_flutter/core/usecase/use_case.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/data/model/state_model.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/domain/usecases/get_states_use_case.dart';
import 'package:equatable/equatable.dart';

part 'state_selector_state.dart';

class StateSelectorCubit extends Cubit<StateSelectorState> {
  final GetStatesUseCase _getStatesUseCase;
  StateSelectorCubit({
    required GetStatesUseCase getStatesUseCase,
  })  : _getStatesUseCase = getStatesUseCase,
        super(StatesIntialState());

  District? selectedDistrict;
  List<String> filteredTalukas = [];
  StateModel? selectedState;
  Taluka? selectedTaluka;

  StateModel? _stateModel;

  List<StateModel> allStates = [];

  Future<void> getStates() async {
    emit(StatesLoadingState());
    final res = await _getStatesUseCase.call(NoParams());

    res.fold((l) {
      emit(StatesFailureState(message: l.message ?? 'Something went wrong!'));
    }, (r) {
      allStates = r.data ?? [];
      emit(EditBusinessSuccess(states: r.data ?? []));
    });
  }

  Future<void> filterStates(StateModel state) async {
    emit(StatesIntialState());
    selectedState = state;
    _stateModel = selectedState;
    selectedDistrict = null;
    selectedTaluka = null;

    List<District> districts = [];

    for (var i = 0; i < _stateModel!.districts.length; i++) {
      if (_stateModel!.districts[i].isMetro == '0') {
        districts.add(_stateModel!.districts[i]);
      }
    }
    selectedState = selectedState?.copyWith(
        districts: districts.isEmpty ? null : districts);

    emit(FilterStateSuccessState(state: state));
  }

  Future<void> filterDistricts(bool? value) async {
    emit(StatesIntialState());
    if (selectedState != null) {
      List<District>? districts = [];
      if (value == true) {
        for (var i = 0; i < _stateModel!.districts.length; i++) {
          if (_stateModel!.districts[i].isMetro == '1') {
            districts.add(_stateModel!.districts[i]);
          }
        }
        selectedState = selectedState?.copyWith(districts: districts);
      } else {
        for (var i = 0; i < _stateModel!.districts.length; i++) {
          if (_stateModel!.districts[i].isMetro == '0') {
            districts.add(_stateModel!.districts[i]);
          }
        }
        selectedState = selectedState?.copyWith(
            districts: districts.isEmpty ? null : districts);
      }

      emit(FilterStateSuccessState(state: selectedState!));
    }
  }
  // Future<

  Future<void> selectDistrict(District district) async {
    emit(StatesIntialState());

    selectedDistrict = district;
    emit(FilterDistrictSuccessState());
  }

  Future<void> selectTaluka(Taluka taluka) async {
    emit(StatesIntialState());
    selectedTaluka = taluka;
    emit(FilterTalukaSuccessState());
  }
}
