import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'symptom_tracker_widget.dart' show SymptomTrackerWidget;
import 'package:flutter/material.dart';

class SymptomTrackerModel extends FlutterFlowModel<SymptomTrackerWidget> {
  ///  Local state fields for this page.

  List<SymptomsListStruct> symptomList = [];
  void addToSymptomList(SymptomsListStruct item) => symptomList.add(item);
  void removeFromSymptomList(SymptomsListStruct item) =>
      symptomList.remove(item);
  void removeAtIndexFromSymptomList(int index) => symptomList.removeAt(index);
  void insertAtIndexInSymptomList(int index, SymptomsListStruct item) =>
      symptomList.insert(index, item);
  void updateSymptomListAtIndex(
          int index, Function(SymptomsListStruct) updateFn) =>
      symptomList[index] = updateFn(symptomList[index]);

  List<SymptomsListStruct> selectedSymptoms = [];
  void addToSelectedSymptoms(SymptomsListStruct item) =>
      selectedSymptoms.add(item);
  void removeFromSelectedSymptoms(SymptomsListStruct item) =>
      selectedSymptoms.remove(item);
  void removeAtIndexFromSelectedSymptoms(int index) =>
      selectedSymptoms.removeAt(index);
  void insertAtIndexInSelectedSymptoms(int index, SymptomsListStruct item) =>
      selectedSymptoms.insert(index, item);
  void updateSelectedSymptomsAtIndex(
          int index, Function(SymptomsListStruct) updateFn) =>
      selectedSymptoms[index] = updateFn(selectedSymptoms[index]);

  List<SymptomsListStruct> selectedWithDetails = [];
  void addToSelectedWithDetails(SymptomsListStruct item) =>
      selectedWithDetails.add(item);
  void removeFromSelectedWithDetails(SymptomsListStruct item) =>
      selectedWithDetails.remove(item);
  void removeAtIndexFromSelectedWithDetails(int index) =>
      selectedWithDetails.removeAt(index);
  void insertAtIndexInSelectedWithDetails(int index, SymptomsListStruct item) =>
      selectedWithDetails.insert(index, item);
  void updateSelectedWithDetailsAtIndex(
          int index, Function(SymptomsListStruct) updateFn) =>
      selectedWithDetails[index] = updateFn(selectedWithDetails[index]);

  List<SymptomsListStruct> searchList = [];
  void addToSearchList(SymptomsListStruct item) => searchList.add(item);
  void removeFromSearchList(SymptomsListStruct item) => searchList.remove(item);
  void removeAtIndexFromSearchList(int index) => searchList.removeAt(index);
  void insertAtIndexInSearchList(int index, SymptomsListStruct item) =>
      searchList.insert(index, item);
  void updateSearchListAtIndex(
          int index, Function(SymptomsListStruct) updateFn) =>
      searchList[index] = updateFn(searchList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (SymptomTracker)] action in SymptomTracker widget.
  ApiCallResponse? apiResultugy;
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // Stores action output result for [Backend Call - API (SymptomSearch)] action in Name widget.
  ApiCallResponse? searchResult;
  // Stores action output result for [Backend Call - API (SubmitSymptom)] action in Button widget.
  ApiCallResponse? apiResult5ky;
  // Stores action output result for [Backend Call - API (Submittask)] action in Button widget.
  ApiCallResponse? apiResult7jz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
