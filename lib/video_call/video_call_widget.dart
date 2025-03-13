import '';
import '/backend/schema/structs/index.dart';
import '/components/video_call_summary_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'video_call_model.dart';
export 'video_call_model.dart';

class VideoCallWidget extends StatefulWidget {
  const VideoCallWidget({
    super.key,
    this.videoLink,
    this.connectionsModel,
    this.waitTime,
  });

  final String? videoLink;
  final ConnectionsModelStruct? connectionsModel;
  final String? waitTime;

  static String routeName = 'VideoCall';
  static String routePath = '/videoCall';

  @override
  State<VideoCallWidget> createState() => _VideoCallWidgetState();
}

class _VideoCallWidgetState extends State<VideoCallWidget> {
  late VideoCallModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoCallModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: SafeArea(
          top: true,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (!_model.isPageSummary)
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.95,
                    child: custom_widgets.AmdhaCommunicationWidget(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.95,
                      serviceUrl: widget.videoLink!,
                      onConnected: () async {
                        logFirebaseEvent(
                            'VIDEO_CALL_Container_f7w9dgby_CALLBACK');
                        _model.callWaiting = true;
                        safeSetState(() {});
                        _model.instantTimer = InstantTimer.periodic(
                          duration: Duration(milliseconds: 1000),
                          callback: (timer) async {
                            if (_model.callWaiting) {
                              if (functions.isWithinMinutes(
                                  functions.convertStringToDate(
                                      widget.connectionsModel!.startTime),
                                  '0',
                                  widget.waitTime!)) {
                                _model.instantTimer?.cancel();
                                context.safePop();
                              }
                            } else {
                              _model.instantTimer?.cancel();
                            }
                          },
                          startImmediately: true,
                        );
                      },
                      onLoaded: () async {},
                      onParticipantAdded: (data) async {
                        logFirebaseEvent(
                            'VIDEO_CALL_Container_f7w9dgby_CALLBACK');
                        _model.callWaiting = false;
                        safeSetState(() {});
                      },
                      onParticipantDisconnected: (data) async {
                        logFirebaseEvent(
                            'VIDEO_CALL_Container_f7w9dgby_CALLBACK');
                        _model.isPageSummary = true;
                        safeSetState(() {});
                      },
                      onDisconnected: () async {
                        logFirebaseEvent(
                            'VIDEO_CALL_Container_f7w9dgby_CALLBACK');
                        _model.isPageSummary = true;
                        safeSetState(() {});
                      },
                    ),
                  ),
                if (_model.isPageSummary)
                  wrapWithModel(
                    model: _model.videoCallSummaryModel,
                    updateCallback: () => safeSetState(() {}),
                    child: VideoCallSummaryWidget(
                      consultationId: widget.connectionsModel?.consultationId,
                      backCallback: () async {
                        logFirebaseEvent(
                            'VIDEO_CALL_Container_3kgg82u7_CALLBACK');

                        context
                            .goNamed(UpcomingConsultationPageWidget.routeName);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
