import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'goal_card_model.dart';
export 'goal_card_model.dart';

class GoalCardWidget extends StatefulWidget {
  const GoalCardWidget({
    super.key,
    this.vital,
    String? goal,
  }) : this.goal = goal ?? '0';

  final VitalsStruct? vital;
  final String goal;

  @override
  State<GoalCardWidget> createState() => _GoalCardWidgetState();
}

class _GoalCardWidgetState extends State<GoalCardWidget> {
  late GoalCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalCardModel());

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
        color: valueOrDefault<Color>(
          functions.getCardValue(widget.vital?.type)?.color,
          Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                        child: Text(
                          valueOrDefault<String>(
                            functions.getCardValue(widget.vital?.type)?.label,
                            'title',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Container(
                                width: 16.0,
                                height: 16.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    functions
                                        .getCardValue(widget.vital?.type)
                                        ?.color,
                                    Color(0x00000000),
                                  ),
                                  borderRadius: BorderRadius.circular(2.5),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      functions
                                          .getCardValue(widget.vital?.type)
                                          ?.iconColor,
                                      Color(0x00000000),
                                    ),
                                    width: 1.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (widget.vital?.type == 'BloodGlucose')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kbloodGlucose,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'BloodVolume')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kgroup125Copy,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'BMI')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kbmi,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'TotalBodyFat')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kbodyFat,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type ==
                                        'BodyTemperature')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kbodyTemperature,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'BodyWater')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kbodyWater,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'CardiacOutput')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kcardiacOutput,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'Height')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kheight,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type ==
                                        'HipCircumference')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.khipCircumference,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type ==
                                        'RespirationRate')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            FFIcons.krespiration,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 8.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'Sleep')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.ksleep,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'SpO2')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kspo2,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'StressIndex')
                                      Expanded(
                                        child: Icon(
                                          FFIcons.kangry,
                                          color: valueOrDefault<Color>(
                                            functions
                                                .getCardValue(
                                                    widget.vital?.type)
                                                ?.iconColor,
                                            Color(0x00000000),
                                          ),
                                          size: 10.0,
                                        ),
                                      ),
                                    if (widget.vital?.type == 'TotalBodyWater')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.ktotalBodyWater,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'VO2Max')
                                      Expanded(
                                        child: Icon(
                                          FFIcons.kvo2Max,
                                          color: valueOrDefault<Color>(
                                            functions
                                                .getCardValue(
                                                    widget.vital?.type)
                                                ?.iconColor,
                                            Color(0x00000000),
                                          ),
                                          size: 10.0,
                                        ),
                                      ),
                                    if (widget.vital?.type ==
                                        'MeanArterialPressure')
                                      Expanded(
                                        child: Icon(
                                          FFIcons.kvector,
                                          color: valueOrDefault<Color>(
                                            functions
                                                .getCardValue(
                                                    widget.vital?.type)
                                                ?.iconColor,
                                            Color(0x00000000),
                                          ),
                                          size: 10.0,
                                        ),
                                      ),
                                    if (widget.vital?.type ==
                                        'WaistToHipRatio')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kwaistToHip,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type ==
                                        'WaistCircumference')
                                      Expanded(
                                        child: Icon(
                                          FFIcons.kwaist,
                                          color: valueOrDefault<Color>(
                                            functions
                                                .getCardValue(
                                                    widget.vital?.type)
                                                ?.iconColor,
                                            Color(0x00000000),
                                          ),
                                          size: 10.0,
                                        ),
                                      ),
                                    if (widget.vital?.type == 'Weight')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kweight,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'HeartRate')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kbpSystolic,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'BloodPressure')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kbpDiastolic,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'WaterIntake')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.local_drink_outlined,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'StepCount')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.snowshoeing_sharp,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'HrvSdnn')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kloveHowl,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'HrvRmssd')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.knotesMedical,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'HrvPnn50')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.ksyringe,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if ((widget.vital?.type ==
                                            'FastingBloodGlucose') ||
                                        (widget.vital?.type ==
                                            'RandomBloodGlucose') ||
                                        (widget.vital?.type ==
                                            'AfterBreakfastBloodGlucose') ||
                                        (widget.vital?.type ==
                                            'BeforeLunchBloodGlucose') ||
                                        (widget.vital?.type ==
                                            'BeforeDinnerBloodGlucose') ||
                                        (widget.vital?.type ==
                                            'AfterLunchBloodGlucose') ||
                                        (widget.vital?.type ==
                                            'AfterDinnerBloodGlucose') ||
                                        (widget.vital?.type == 'HbA1c'))
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kbloodGlucose,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 10.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'BabyKickCount')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kbabykick,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 8.0,
                                          ),
                                        ),
                                      ),
                                    if (widget.vital?.type == 'CaloriesBurned')
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.local_fire_department_sharp,
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .getCardValue(
                                                      widget.vital?.type)
                                                  ?.iconColor,
                                              Color(0x00000000),
                                            ),
                                            size: 8.0,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.vital?.value,
                                '-',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          Text(
                            widget.vital?.unit != null &&
                                    widget.vital?.unit != ''
                                ? widget.vital!.unit
                                : (""),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Target Set ${widget.goal}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        TextSpan(
                          text: ' ${valueOrDefault<String>(
                            functions.getCardValue(widget.vital?.type)?.unit,
                            'unit',
                          )}',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 10.0,
                          ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_forward,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
