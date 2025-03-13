import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/doctor_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'book_consultation_component_widget.dart'
    show BookConsultationComponentWidget;
import 'package:flutter/material.dart';

class BookConsultationComponentModel
    extends FlutterFlowModel<BookConsultationComponentWidget> {
  ///  Local state fields for this component.

  SlotModelStruct? slotmodel;
  void updateSlotmodelStruct(Function(SlotModelStruct) updateFn) {
    updateFn(slotmodel ??= SlotModelStruct());
  }

  SlotsStruct? selectedSlot;
  void updateSelectedSlotStruct(Function(SlotsStruct) updateFn) {
    updateFn(selectedSlot ??= SlotsStruct());
  }

  bool reasonFilled = false;

  bool isSlotFetched = false;

  List<String> datesAvailable = [];
  void addToDatesAvailable(String item) => datesAvailable.add(item);
  void removeFromDatesAvailable(String item) => datesAvailable.remove(item);
  void removeAtIndexFromDatesAvailable(int index) =>
      datesAvailable.removeAt(index);
  void insertAtIndexInDatesAvailable(int index, String item) =>
      datesAvailable.insert(index, item);
  void updateDatesAvailableAtIndex(int index, Function(String) updateFn) =>
      datesAvailable[index] = updateFn(datesAvailable[index]);

  bool isApiSuccess = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetAvailableDates)] action in BookConsultationComponent widget.
  ApiCallResponse? apiResultuo2;
  // Stores action output result for [Backend Call - API (GetAvailability)] action in BookConsultationComponent widget.
  ApiCallResponse? apiResulte0g;
  // Model for DoctorCard component.
  late DoctorCardModel doctorCardModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (GetAvailability)] action in CalanderWidget widget.
  ApiCallResponse? slotResponse;
  // State field(s) for Reason widget.
  FocusNode? reasonFocusNode;
  TextEditingController? reasonTextController;
  String? Function(BuildContext, String?)? reasonTextControllerValidator;

  @override
  void initState(BuildContext context) {
    doctorCardModel = createModel(context, () => DoctorCardModel());
  }

  @override
  void dispose() {
    doctorCardModel.dispose();
    reasonFocusNode?.dispose();
    reasonTextController?.dispose();
  }
}
