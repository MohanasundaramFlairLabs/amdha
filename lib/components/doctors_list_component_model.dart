import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import 'doctors_list_component_widget.dart' show DoctorsListComponentWidget;
import 'package:flutter/material.dart';

class DoctorsListComponentModel
    extends FlutterFlowModel<DoctorsListComponentWidget> {
  ///  Local state fields for this component.

  bool myDoctorToggle = false;

  bool otherDoctorToggle = false;

  bool isLoaded = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetDoctorList)] action in DoctorsListComponent widget.
  ApiCallResponse? apiResult3b2;
  // Model for NoDataComponent component.
  late NoDataComponentModel noDataComponentModel;

  @override
  void initState(BuildContext context) {
    noDataComponentModel = createModel(context, () => NoDataComponentModel());
  }

  @override
  void dispose() {
    noDataComponentModel.dispose();
  }
}
