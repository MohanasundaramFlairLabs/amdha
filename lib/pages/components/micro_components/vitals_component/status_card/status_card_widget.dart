import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'status_card_model.dart';
export 'status_card_model.dart';

class StatusCardWidget extends StatefulWidget {
  const StatusCardWidget({
    super.key,
    required this.vital,
  });

  final VitalsStruct? vital;

  @override
  State<StatusCardWidget> createState() => _StatusCardWidgetState();
}

class _StatusCardWidgetState extends State<StatusCardWidget> {
  late StatusCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusCardModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          functions.getCardValue(widget.vital?.type)?.color,
          Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      functions.getCardValue(widget.vital?.type)?.iconColor,
                      Color(0x00000000),
                    ),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget.vital?.type == 'BloodGlucose')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kbloodGlucose,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'BloodVolume')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kgroup125Copy,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'BMI')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kbmi,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'TotalBodyFat')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kbodyFat,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'BodyTemperature')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kbodyTemperature,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'BodyWater')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kbodyWater,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'CardiacOutput')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kcardiacOutput,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'Height')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kheight,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'HipCircumference')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.khipCircumference,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'RespirationRate')
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            FFIcons.krespiration,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                            size: 20.0,
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'Sleep')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.ksleep,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'SpO2')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kspo2,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'StressIndex')
                      Expanded(
                        child: Icon(
                          FFIcons.kangry,
                          color: valueOrDefault<Color>(
                            functions
                                .getCardValue(widget.vital?.type)
                                ?.iconColor,
                            Color(0x00000000),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'TotalBodyWater')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.ktotalBodyWater,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'VO2Max')
                      Expanded(
                        child: Icon(
                          FFIcons.kvo2Max,
                          color: valueOrDefault<Color>(
                            functions
                                .getCardValue(widget.vital?.type)
                                ?.iconColor,
                            Color(0x00000000),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'MeanArterialPressure')
                      Expanded(
                        child: Icon(
                          FFIcons.kvector,
                          color: valueOrDefault<Color>(
                            functions
                                .getCardValue(widget.vital?.type)
                                ?.iconColor,
                            Color(0x00000000),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'WaistToHipRatio')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kwaistToHip,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'WaistCircumference')
                      Expanded(
                        child: Icon(
                          FFIcons.kwaist,
                          color: valueOrDefault<Color>(
                            functions
                                .getCardValue(widget.vital?.type)
                                ?.iconColor,
                            Color(0x00000000),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'Weight')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kweight,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'BloodPressure')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kbpDiastolic,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'HeartRate')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kbpSystolic,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'WellbeingScore')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kuniversalAccess,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'HrvSdnn')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.kloveHowl,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'HrvRmssd')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.knotesMedical,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'HrvPnn50')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.ksyringe,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'StepCount')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.snowshoeing_sharp,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'WaterIntake')
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.local_drink_outlined,
                            color: valueOrDefault<Color>(
                              functions
                                  .getCardValue(widget.vital?.type)
                                  ?.iconColor,
                              Color(0x00000000),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      functions.getCardValue(widget.vital?.type)?.label,
                      'Value',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: Colors.black,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.vital?.value,
                          '00',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: Colors.black,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                        child: Text(
                          widget.vital?.unit != null &&
                                  widget.vital?.unit != ''
                              ? widget.vital!.unit
                              : (""),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: Colors.black,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
            ),
          ),
          if (widget.vital?.severity != null && widget.vital?.severity != '')
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: () {
                        if (widget.vital?.severity == 'Low') {
                          return Color(0xFFFEF6EA);
                        } else if (widget.vital?.severity == 'Normal') {
                          return Color(0xFFEFF8EC);
                        } else {
                          return Color(0xFFFBEBE9);
                        }
                      }(),
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: () {
                          if (widget.vital?.severity == 'Low') {
                            return Color(0xFFF7A730);
                          } else if (widget.vital?.severity == 'Normal') {
                            return Color(0xFF5EBC44);
                          } else if (widget.vital?.severity == 'Good') {
                            return Color(0xFF09BB16);
                          } else if (widget.vital?.severity == 'Elevated') {
                            return Color(0xFFD26262);
                          } else if (widget.vital?.severity == 'High') {
                            return Color(0xFFD83924);
                          } else if (widget.vital?.severity == 'High/High') {
                            return Color(0xFFD83924);
                          } else {
                            return Color(0xFF24BDD8);
                          }
                        }(),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                      child: AutoSizeText(
                        widget.vital!.severity,
                        minFontSize: 8.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: () {
                                if (widget.vital?.severity == 'Low') {
                                  return Color(0xFFF7A730);
                                } else if (widget.vital?.severity ==
                                    'Normal') {
                                  return Color(0xFF5EBC44);
                                } else if (widget.vital?.severity == 'Good') {
                                  return Color(0xFF09BB16);
                                } else if (widget.vital?.severity ==
                                    'Elevated') {
                                  return Color(0xFFD26262);
                                } else if (widget.vital?.severity == 'High') {
                                  return Color(0xFFD83924);
                                } else if (widget.vital?.severity ==
                                    'High/High') {
                                  return Color(0xFFD83924);
                                } else {
                                  return Color(0xFF24BDD8);
                                }
                              }(),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
