import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'doctor_profile_component_widget.dart' show DoctorProfileComponentWidget;
import 'package:flutter/material.dart';

class DoctorProfileComponentModel
    extends FlutterFlowModel<DoctorProfileComponentWidget> {
  ///  Local state fields for this component.

  CaseSheetModelStruct? consultationHistory;
  void updateConsultationHistoryStruct(
      Function(CaseSheetModelStruct) updateFn) {
    updateFn(consultationHistory ??= CaseSheetModelStruct());
  }

  bool isloaded = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetConsultationHistory)] action in DoctorProfileComponent widget.
  ApiCallResponse? apiResultxm8;
  // Stores action output result for [Backend Call - API (GetQuotas)] action in Button widget.
  ApiCallResponse? quotaResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
