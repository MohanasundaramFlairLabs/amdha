import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/shimmer_components/vital_shimmer/vital_shimmer_widget.dart';
import 'vital_home_component_widget.dart' show VitalHomeComponentWidget;
import 'package:flutter/material.dart';

class VitalHomeComponentModel
    extends FlutterFlowModel<VitalHomeComponentWidget> {
  ///  Local state fields for this component.

  bool isScanVital = false;

  bool isAddVital = false;

  String selectedCategory = 'Physiological';

  int? selectedInfoIndex;

  bool isLoaded = false;

  bool isFetchingHealthData = false;

  bool dataFetching = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (vitals)] action in VitalHomeComponent widget.
  ApiCallResponse? vitalResponse3;
  // Stores action output result for [Custom Action - getVitalsPermission] action in VitalHomeComponent widget.
  bool? permissionStatus;
  // Stores action output result for [Custom Action - getHealthDeviceVitals] action in Container widget.
  bool? vitalSuccess;
  // Model for VitalShimmer component.
  late VitalShimmerModel vitalShimmerModel;

  @override
  void initState(BuildContext context) {
    vitalShimmerModel = createModel(context, () => VitalShimmerModel());
  }

  @override
  void dispose() {
    vitalShimmerModel.dispose();
  }
}
