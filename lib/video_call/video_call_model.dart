import '/components/video_call_summary_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'video_call_widget.dart' show VideoCallWidget;
import 'package:flutter/material.dart';

class VideoCallModel extends FlutterFlowModel<VideoCallWidget> {
  ///  Local state fields for this page.

  bool hideAnimation = false;

  bool isPageSummary = false;

  bool callWaiting = false;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Model for VideoCallSummary component.
  late VideoCallSummaryModel videoCallSummaryModel;

  @override
  void initState(BuildContext context) {
    videoCallSummaryModel = createModel(context, () => VideoCallSummaryModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    videoCallSummaryModel.dispose();
  }
}
