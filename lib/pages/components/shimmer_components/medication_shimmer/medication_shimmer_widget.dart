import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/shimmer_components/shimmer_component/shimmer_component_widget.dart';
import 'package:flutter/material.dart';
import 'medication_shimmer_model.dart';
export 'medication_shimmer_model.dart';

class MedicationShimmerWidget extends StatefulWidget {
  const MedicationShimmerWidget({super.key});

  @override
  State<MedicationShimmerWidget> createState() =>
      _MedicationShimmerWidgetState();
}

class _MedicationShimmerWidgetState extends State<MedicationShimmerWidget> {
  late MedicationShimmerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicationShimmerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.shimmerComponentModel1,
          updateCallback: () => safeSetState(() {}),
          child: ShimmerComponentWidget(
            height: 84.0,
          ),
        ),
        wrapWithModel(
          model: _model.shimmerComponentModel2,
          updateCallback: () => safeSetState(() {}),
          child: ShimmerComponentWidget(
            height: 84.0,
          ),
        ),
        wrapWithModel(
          model: _model.shimmerComponentModel3,
          updateCallback: () => safeSetState(() {}),
          child: ShimmerComponentWidget(
            height: 84.0,
          ),
        ),
        wrapWithModel(
          model: _model.shimmerComponentModel4,
          updateCallback: () => safeSetState(() {}),
          child: ShimmerComponentWidget(
            height: 84.0,
          ),
        ),
        wrapWithModel(
          model: _model.shimmerComponentModel5,
          updateCallback: () => safeSetState(() {}),
          child: ShimmerComponentWidget(
            height: 84.0,
          ),
        ),
      ].divide(SizedBox(height: 10.0)),
    );
  }
}
