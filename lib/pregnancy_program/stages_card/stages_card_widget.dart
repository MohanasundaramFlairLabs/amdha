import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'stages_card_model.dart';
export 'stages_card_model.dart';

class StagesCardWidget extends StatefulWidget {
  const StagesCardWidget({
    super.key,
    this.program,
  });

  final ProgramsStruct? program;

  @override
  State<StagesCardWidget> createState() => _StagesCardWidgetState();
}

class _StagesCardWidgetState extends State<StagesCardWidget> {
  late StagesCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StagesCardModel());

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
      decoration: BoxDecoration(
        color: Color(0xFFEF668A),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: CircularPercentIndicator(
                      percent: () {
                        if (widget.program!.userStageDetails.week < 4) {
                          return 0.1;
                        } else if ((widget.program!.userStageDetails.week >
                                3) &&
                            (widget.program!.userStageDetails.week < 8)) {
                          return 0.2;
                        } else if ((widget.program!.userStageDetails.week >
                                7) &&
                            (widget.program!.userStageDetails.week < 12)) {
                          return 0.3;
                        } else if ((widget.program!.userStageDetails.week >
                                11) &&
                            (widget.program!.userStageDetails.week < 15)) {
                          return 0.4;
                        } else if ((widget.program!.userStageDetails.week >
                                14) &&
                            (widget.program!.userStageDetails.week < 19)) {
                          return 0.5;
                        } else if ((widget.program!.userStageDetails.week >
                                18) &&
                            (widget.program!.userStageDetails.week < 24)) {
                          return 0.6;
                        } else if ((widget.program!.userStageDetails.week >
                                23) &&
                            (widget.program!.userStageDetails.week < 28)) {
                          return 0.7;
                        } else if ((widget.program!.userStageDetails.week >
                                27) &&
                            (widget.program!.userStageDetails.week < 34)) {
                          return 0.8;
                        } else if ((widget.program!.userStageDetails.week >
                                33) &&
                            (widget.program!.userStageDetails.week < 37)) {
                          return 0.9;
                        } else if ((widget.program!.userStageDetails.week >
                                36) &&
                            (widget.program!.userStageDetails.week < 41)) {
                          return 0.99;
                        } else {
                          return 0.0;
                        }
                      }(),
                      radius: MediaQuery.sizeOf(context).width * 0.15,
                      lineWidth: 10.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: FlutterFlowTheme.of(context).secondary,
                      backgroundColor: Color(0x47FFFFFF),
                      startAngle: 0.0,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.program!.userStageDetails.week < 4)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/week1.png',
                              width: MediaQuery.sizeOf(context).width * 0.23,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if ((widget.program!.userStageDetails.week > 3) &&
                          (widget.program!.userStageDetails.week < 8))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/week8.png',
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if ((widget.program!.userStageDetails.week > 7) &&
                          (widget.program!.userStageDetails.week < 12))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/week8.png',
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if ((widget.program!.userStageDetails.week > 11) &&
                          (widget.program!.userStageDetails.week < 15))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/week12.png',
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if ((widget.program!.userStageDetails.week > 14) &&
                          (widget.program!.userStageDetails.week < 19))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/week15.png',
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if ((widget.program!.userStageDetails.week > 18) &&
                          (widget.program!.userStageDetails.week < 24))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/week19.png',
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if ((widget.program!.userStageDetails.week > 23) &&
                          (widget.program!.userStageDetails.week < 28))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/week24.png',
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if ((widget.program!.userStageDetails.week > 27) &&
                          (widget.program!.userStageDetails.week < 34))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/week28.png',
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if ((widget.program!.userStageDetails.week > 33) &&
                          (widget.program!.userStageDetails.week < 37))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/week34.png',
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      if ((widget.program!.userStageDetails.week > 36) &&
                          (widget.program!.userStageDetails.week < 41))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/week37.png',
                              width: MediaQuery.sizeOf(context).width * 0.18,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your ${widget.program?.userStageDetails.trimester} trimester',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Text(
                        'Week  ${widget.program?.userStageDetails.week.toString()}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.program?.userStageDetails.fetusStatus,
                          '-',
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text:
                            '${(40 - widget.program!.userStageDetails.week).toString()}  weeks left',
                        options: FFButtonOptions(
                          height: 35.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Color(0xFFEF668A),
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(width: 20.0)),
        ),
      ),
    );
  }
}
