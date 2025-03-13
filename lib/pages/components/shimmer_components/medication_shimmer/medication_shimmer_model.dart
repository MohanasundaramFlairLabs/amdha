import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/shimmer_components/shimmer_component/shimmer_component_widget.dart';
import 'medication_shimmer_widget.dart' show MedicationShimmerWidget;
import 'package:flutter/material.dart';

class MedicationShimmerModel extends FlutterFlowModel<MedicationShimmerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ShimmerComponent component.
  late ShimmerComponentModel shimmerComponentModel1;
  // Model for ShimmerComponent component.
  late ShimmerComponentModel shimmerComponentModel2;
  // Model for ShimmerComponent component.
  late ShimmerComponentModel shimmerComponentModel3;
  // Model for ShimmerComponent component.
  late ShimmerComponentModel shimmerComponentModel4;
  // Model for ShimmerComponent component.
  late ShimmerComponentModel shimmerComponentModel5;

  @override
  void initState(BuildContext context) {
    shimmerComponentModel1 =
        createModel(context, () => ShimmerComponentModel());
    shimmerComponentModel2 =
        createModel(context, () => ShimmerComponentModel());
    shimmerComponentModel3 =
        createModel(context, () => ShimmerComponentModel());
    shimmerComponentModel4 =
        createModel(context, () => ShimmerComponentModel());
    shimmerComponentModel5 =
        createModel(context, () => ShimmerComponentModel());
  }

  @override
  void dispose() {
    shimmerComponentModel1.dispose();
    shimmerComponentModel2.dispose();
    shimmerComponentModel3.dispose();
    shimmerComponentModel4.dispose();
    shimmerComponentModel5.dispose();
  }
}
