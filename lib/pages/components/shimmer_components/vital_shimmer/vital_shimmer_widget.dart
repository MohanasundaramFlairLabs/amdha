import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/shimmer_components/shimmer_component/shimmer_component_widget.dart';
import 'package:flutter/material.dart';
import 'vital_shimmer_model.dart';
export 'vital_shimmer_model.dart';

class VitalShimmerWidget extends StatefulWidget {
  const VitalShimmerWidget({super.key});

  @override
  State<VitalShimmerWidget> createState() => _VitalShimmerWidgetState();
}

class _VitalShimmerWidgetState extends State<VitalShimmerWidget> {
  late VitalShimmerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VitalShimmerModel());

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
            height: 80.0,
          ),
        ),
        wrapWithModel(
          model: _model.shimmerComponentModel2,
          updateCallback: () => safeSetState(() {}),
          child: ShimmerComponentWidget(
            height: 80.0,
          ),
        ),
        wrapWithModel(
          model: _model.shimmerComponentModel3,
          updateCallback: () => safeSetState(() {}),
          child: ShimmerComponentWidget(
            height: 80.0,
          ),
        ),
        wrapWithModel(
          model: _model.shimmerComponentModel4,
          updateCallback: () => safeSetState(() {}),
          child: ShimmerComponentWidget(
            height: 80.0,
          ),
        ),
        wrapWithModel(
          model: _model.shimmerComponentModel5,
          updateCallback: () => safeSetState(() {}),
          child: ShimmerComponentWidget(
            height: 80.0,
          ),
        ),
      ].divide(SizedBox(height: 15.0)),
    );
  }
}
