import '';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'consultation_card_component_model.dart';
export 'consultation_card_component_model.dart';

class ConsultationCardComponentWidget extends StatefulWidget {
  const ConsultationCardComponentWidget({
    super.key,
    required this.model,
    this.action,
    this.startConsultation,
    this.graceTime,
    this.waitTime,
  });

  final ConnectionsModelStruct? model;
  final Future Function()? action;
  final Future Function()? startConsultation;
  final String? graceTime;
  final String? waitTime;

  @override
  State<ConsultationCardComponentWidget> createState() =>
      _ConsultationCardComponentWidgetState();
}

class _ConsultationCardComponentWidgetState
    extends State<ConsultationCardComponentWidget> {
  late ConsultationCardComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsultationCardComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONSULTATION_CARD_COMPONENT_Consultation');
      _model.timerController.onStartTimer();
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
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 14.0, 16.0, 14.0),
        child: Container(
          width: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondary,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: Color(0xFFCBCDD4),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(21.0),
                              child: Image.network(
                                functions.stringToImage(widget
                                    .model?.doctorDetails.profileImageUri),
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.model?.doctorDetails.firstName,
                                'Name',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nevermind',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nevermind'),
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.model?.doctorDetails.qualification,
                                'Degree',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nevermind',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nevermind'),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      if (false)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Container(
                                  width: 80.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Free',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Nevermind',
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Nevermind'),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'No Charges',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: Color(0xFF5D6A85),
                                      fontSize: 8.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                    ].divide(SizedBox(width: 10.0)),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      FFAppState().theme.backgroudPrimaryColor,
                      Color(0x1516A9E8),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.update_sharp,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 16.0,
                            ),
                            if ((functions.timeToGo(
                                        functions.convertStringToDate(
                                            widget.model!.startTime),
                                        functions.convertStringToDate(
                                            widget.model!.endTime)) ==
                                    'live') ||
                                ((valueOrDefault<String>(
                                          functions.timeToGo(
                                              functions.convertStringToDate(
                                                  widget.model!.startTime),
                                              functions.convertStringToDate(
                                                  widget.model!.endTime)),
                                          'time',
                                        ) ==
                                        'completed') &&
                                    (widget.model?.status == 'Scheduled')))
                              Text(
                                valueOrDefault<String>(
                                  (valueOrDefault<String>(
                                                functions.timeToGo(
                                                    functions
                                                        .convertStringToDate(
                                                            widget.model!
                                                                .startTime),
                                                    functions
                                                        .convertStringToDate(
                                                            widget.model!
                                                                .endTime)),
                                                'time',
                                              ) ==
                                              'completed') &&
                                          (widget.model?.status == 'Scheduled')
                                      ? 'Missed'
                                      : 'live',
                                  '-',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            if ((functions.timeToGo(
                                        functions.convertStringToDate(
                                            widget.model!.startTime),
                                        functions.convertStringToDate(
                                            widget.model!.endTime)) !=
                                    'live') &&
                                !((valueOrDefault<String>(
                                          functions.timeToGo(
                                              functions.convertStringToDate(
                                                  widget.model!.startTime),
                                              functions.convertStringToDate(
                                                  widget.model!.endTime)),
                                          'time',
                                        ) ==
                                        'completed') &&
                                    (widget.model?.status == 'Scheduled')))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!_model.isLive)
                                    FlutterFlowTimer(
                                      initialTime: functions.getTimerValue(
                                          functions.convertStringToDate(
                                              widget.model!.startTime)),
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(value,
                                              milliSecond: false),
                                      controller: _model.timerController,
                                      updateStateInterval:
                                          Duration(milliseconds: 1000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.timerMilliseconds = value;
                                        _model.timerValue = displayTime;
                                        if (shouldUpdate) safeSetState(() {});
                                      },
                                      onEnded: () async {
                                        logFirebaseEvent(
                                            'CONSULTATION_CARD_COMPONENT_Timer_050vw9');
                                        _model.timerController.onStopTimer();
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));
                                        _model.isLive = true;
                                        safeSetState(() {});
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily),
                                          ),
                                    ),
                                  Text(
                                    _model.isLive ? 'live' : 'to go',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ].divide(SizedBox(width: 5.0)),
                              ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Date :  ${dateTimeFormat(
                              "dd MMMM yyyy h:mm a",
                              functions.convertStringToDate(
                                  widget.model!.startTime),
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: ((valueOrDefault<String>(
                                          functions.timeToGo(
                                              functions.convertStringToDate(
                                                  widget.model!.startTime),
                                              functions.convertStringToDate(
                                                  widget.model!.endTime)),
                                          'time',
                                        ) ==
                                        'completed') &&
                                    (widget.model?.status == 'Scheduled')
                                ? false
                                : (valueOrDefault<String>(
                                      functions.timeToGo(
                                          functions.convertStringToDate(
                                              widget.model!.startTime),
                                          functions.convertStringToDate(
                                              widget.model!.endTime)),
                                      'time',
                                    ) !=
                                    'live'))
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'CONSULTATION_CARD_COMPONENT_JOIN_NOW_BTN');
                                await widget.startConsultation?.call();
                              },
                        text: 'Join now',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Nevermind',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Nevermind'),
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                          disabledColor: Color(0xFFD9D9D9),
                          disabledTextColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      ),
                    ),
                    if ((valueOrDefault<String>(
                                  functions.timeToGo(
                                      functions.convertStringToDate(
                                          widget.model!.startTime),
                                      functions.convertStringToDate(
                                          widget.model!.endTime)),
                                  'time',
                                ) ==
                                'completed') &&
                            (widget.model?.status == 'Scheduled')
                        ? true
                        : functions.isWithinMinutes(
                            functions
                                .convertStringToDate(widget.model!.startTime),
                            widget.graceTime!,
                            widget.waitTime!))
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primaryText,
                        borderRadius: 4.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).secondary,
                        icon: Icon(
                          FFIcons.ksolarMenuDotsBold,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'CONSULTATION_CARD_COMPONENT_solarMenuDot');
                          await widget.action?.call();
                        },
                      ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
