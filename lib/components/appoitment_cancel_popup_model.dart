import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'appoitment_cancel_popup_widget.dart' show AppoitmentCancelPopupWidget;
import 'package:flutter/material.dart';

class AppoitmentCancelPopupModel
    extends FlutterFlowModel<AppoitmentCancelPopupWidget> {
  ///  Local state fields for this component.

  List<String> reasonList = [];
  void addToReasonList(String item) => reasonList.add(item);
  void removeFromReasonList(String item) => reasonList.remove(item);
  void removeAtIndexFromReasonList(int index) => reasonList.removeAt(index);
  void insertAtIndexInReasonList(int index, String item) =>
      reasonList.insert(index, item);
  void updateReasonListAtIndex(int index, Function(String) updateFn) =>
      reasonList[index] = updateFn(reasonList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
