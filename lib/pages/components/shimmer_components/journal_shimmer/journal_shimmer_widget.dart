import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/shimmer_components/shimmer_component/shimmer_component_widget.dart';
import 'package:flutter/material.dart';
import 'journal_shimmer_model.dart';
export 'journal_shimmer_model.dart';

class JournalShimmerWidget extends StatefulWidget {
  const JournalShimmerWidget({super.key});

  @override
  State<JournalShimmerWidget> createState() => _JournalShimmerWidgetState();
}

class _JournalShimmerWidgetState extends State<JournalShimmerWidget> {
  late JournalShimmerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalShimmerModel());

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
          wrapWithModel(
            model: _model.shimmerComponentModel1,
            updateCallback: () => safeSetState(() {}),
            child: ShimmerComponentWidget(
              height: 368.0,
            ),
          ),
          wrapWithModel(
            model: _model.shimmerComponentModel2,
            updateCallback: () => safeSetState(() {}),
            child: ShimmerComponentWidget(
              height: 368.0,
            ),
          ),
        ]
            .divide(SizedBox(height: 20.0))
            .addToStart(SizedBox(height: 20.0))
            .addToEnd(SizedBox(height: 20.0)),
      ),
    );
  }
}
