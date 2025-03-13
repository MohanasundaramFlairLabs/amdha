import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/shimmer_components/shimmer_component/shimmer_component_widget.dart';
import 'journal_shimmer_widget.dart' show JournalShimmerWidget;
import 'package:flutter/material.dart';

class JournalShimmerModel extends FlutterFlowModel<JournalShimmerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ShimmerComponent component.
  late ShimmerComponentModel shimmerComponentModel1;
  // Model for ShimmerComponent component.
  late ShimmerComponentModel shimmerComponentModel2;

  @override
  void initState(BuildContext context) {
    shimmerComponentModel1 =
        createModel(context, () => ShimmerComponentModel());
    shimmerComponentModel2 =
        createModel(context, () => ShimmerComponentModel());
  }

  @override
  void dispose() {
    shimmerComponentModel1.dispose();
    shimmerComponentModel2.dispose();
  }
}
