import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'circular_dark_shimmer_model.dart';
export 'circular_dark_shimmer_model.dart';

class CircularDarkShimmerWidget extends StatefulWidget {
  const CircularDarkShimmerWidget({
    super.key,
    this.width,
  });

  final double? width;

  @override
  State<CircularDarkShimmerWidget> createState() =>
      _CircularDarkShimmerWidgetState();
}

class _CircularDarkShimmerWidgetState extends State<CircularDarkShimmerWidget>
    with TickerProviderStateMixin {
  late CircularDarkShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CircularDarkShimmerModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: Color(0xFFF2F4F7),
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.width,
      decoration: BoxDecoration(
        color: Color(0xFFE5E9EF),
        shape: BoxShape.circle,
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
