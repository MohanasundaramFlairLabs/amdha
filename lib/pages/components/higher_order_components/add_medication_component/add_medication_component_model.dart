import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/form_components/frequency_component/frequency_component_widget.dart';
import '/pages/components/micro_components/medication_components/drop_down_field/drop_down_field_widget.dart';
import '/pages/components/micro_components/medication_components/single_form/single_form_widget.dart';
import '/pages/components/micro_components/medication_components/single_form_dropdown/single_form_dropdown_widget.dart';
import 'add_medication_component_widget.dart' show AddMedicationComponentWidget;
import 'package:flutter/material.dart';

class AddMedicationComponentModel
    extends FlutterFlowModel<AddMedicationComponentWidget> {
  ///  Local state fields for this component.

  List<ResultsStruct> results = [];
  void addToResults(ResultsStruct item) => results.add(item);
  void removeFromResults(ResultsStruct item) => results.remove(item);
  void removeAtIndexFromResults(int index) => results.removeAt(index);
  void insertAtIndexInResults(int index, ResultsStruct item) =>
      results.insert(index, item);
  void updateResultsAtIndex(int index, Function(ResultsStruct) updateFn) =>
      results[index] = updateFn(results[index]);

  bool isReminderSelected = false;

  FrequencyDateStruct? frequency;
  void updateFrequencyStruct(Function(FrequencyDateStruct) updateFn) {
    updateFn(frequency ??= FrequencyDateStruct());
  }

  String? search;

  String? dosage;

  String? unit;

  int period = 0;

  DateTime? endDate;

  bool isMedSet = false;

  bool isDosage = false;

  DateTime? startDate;

  bool showSuggestionList = false;

  bool isDosageCorrect = false;

  bool isMedicationCorrect = false;

  List<String> loadMoreResults = [];
  void addToLoadMoreResults(String item) => loadMoreResults.add(item);
  void removeFromLoadMoreResults(String item) => loadMoreResults.remove(item);
  void removeAtIndexFromLoadMoreResults(int index) =>
      loadMoreResults.removeAt(index);
  void insertAtIndexInLoadMoreResults(int index, String item) =>
      loadMoreResults.insert(index, item);
  void updateLoadMoreResultsAtIndex(int index, Function(String) updateFn) =>
      loadMoreResults[index] = updateFn(loadMoreResults[index]);

  int pageNumber = 1;

  bool isSosSelected = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for medicationName widget.
  final medicationNameKey = GlobalKey();
  FocusNode? medicationNameFocusNode;
  TextEditingController? medicationNameTextController;
  String? medicationNameSelectedOption;
  String? Function(BuildContext, String?)?
      medicationNameTextControllerValidator;
  // Stores action output result for [Backend Call - API (searchMedication)] action in medicationName widget.
  ApiCallResponse? apiResultpmg;
  // Stores action output result for [Backend Call - API (searchMedication)] action in Text widget.
  ApiCallResponse? apiResultb67;
  // Model for Dosage.
  late SingleFormDropdownModel dosageModel;
  // State field(s) for Critical widget.
  bool? criticalValue;
  // Model for FrequencyComponent component.
  late FrequencyComponentModel frequencyComponentModel;
  DateTime? datePicked1;
  // Model for HowOften.
  late DropDownFieldModel howOftenModel;
  DateTime? datePicked2;
  // Model for Period.
  late SingleFormModel periodModel;
  DateTime? datePicked3;
  // Model for Instructions.
  late DropDownFieldModel instructionsModel;
  // State field(s) for AdditionalNote widget.
  FocusNode? additionalNoteFocusNode;
  TextEditingController? additionalNoteTextController;
  String? Function(BuildContext, String?)?
      additionalNoteTextControllerValidator;
  // Stores action output result for [Backend Call - API (updateMedication)] action in Button widget.
  ApiCallResponse? apiResultd58;
  // Stores action output result for [Backend Call - API (addMedication)] action in Button widget.
  ApiCallResponse? apiResult2bl;

  @override
  void initState(BuildContext context) {
    dosageModel = createModel(context, () => SingleFormDropdownModel());
    frequencyComponentModel =
        createModel(context, () => FrequencyComponentModel());
    howOftenModel = createModel(context, () => DropDownFieldModel());
    periodModel = createModel(context, () => SingleFormModel());
    instructionsModel = createModel(context, () => DropDownFieldModel());
  }

  @override
  void dispose() {
    medicationNameFocusNode?.dispose();

    dosageModel.dispose();
    frequencyComponentModel.dispose();
    howOftenModel.dispose();
    periodModel.dispose();
    instructionsModel.dispose();
    additionalNoteFocusNode?.dispose();
    additionalNoteTextController?.dispose();
  }
}
