import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/shimmer_components/shimmer_component/shimmer_component_widget.dart';
import 'package:flutter/material.dart';
import 'education_shimmer_model.dart';
export 'education_shimmer_model.dart';

class EducationShimmerWidget extends StatefulWidget {
  const EducationShimmerWidget({super.key});

  @override
  State<EducationShimmerWidget> createState() => _EducationShimmerWidgetState();
}

class _EducationShimmerWidgetState extends State<EducationShimmerWidget> {
  late EducationShimmerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EducationShimmerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: wrapWithModel(
                  model: _model.shimmerComponentModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: ShimmerComponentWidget(
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                ),
              ),
              Flexible(
                child: wrapWithModel(
                  model: _model.shimmerComponentModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: ShimmerComponentWidget(
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                ),
              ),
            ]
                .divide(SizedBox(width: 15.0))
                .addToStart(SizedBox(width: 10.0))
                .addToEnd(SizedBox(width: 10.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: wrapWithModel(
                  model: _model.shimmerComponentModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: ShimmerComponentWidget(
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                ),
              ),
              Flexible(
                child: wrapWithModel(
                  model: _model.shimmerComponentModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: ShimmerComponentWidget(
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                ),
              ),
            ]
                .divide(SizedBox(width: 15.0))
                .addToStart(SizedBox(width: 10.0))
                .addToEnd(SizedBox(width: 10.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: wrapWithModel(
                  model: _model.shimmerComponentModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: ShimmerComponentWidget(
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                ),
              ),
              Flexible(
                child: wrapWithModel(
                  model: _model.shimmerComponentModel6,
                  updateCallback: () => safeSetState(() {}),
                  child: ShimmerComponentWidget(
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                ),
              ),
            ]
                .divide(SizedBox(width: 15.0))
                .addToStart(SizedBox(width: 10.0))
                .addToEnd(SizedBox(width: 10.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: wrapWithModel(
                  model: _model.shimmerComponentModel7,
                  updateCallback: () => safeSetState(() {}),
                  child: ShimmerComponentWidget(
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                ),
              ),
              Flexible(
                child: wrapWithModel(
                  model: _model.shimmerComponentModel8,
                  updateCallback: () => safeSetState(() {}),
                  child: ShimmerComponentWidget(
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                ),
              ),
            ]
                .divide(SizedBox(width: 15.0))
                .addToStart(SizedBox(width: 10.0))
                .addToEnd(SizedBox(width: 10.0)),
          ),
        ]
            .divide(SizedBox(height: 10.0))
            .addToStart(SizedBox(height: 10.0))
            .addToEnd(SizedBox(height: 10.0)),
      ),
    );
  }
}
