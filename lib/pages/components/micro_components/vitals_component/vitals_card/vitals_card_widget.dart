import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/vitals_component/diabetes_component/diabetes_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vitals_card_model.dart';
export 'vitals_card_model.dart';

class VitalsCardWidget extends StatefulWidget {
  const VitalsCardWidget({
    super.key,
    required this.vital,
    this.selectedInfoIndex,
    this.enableInfo,
    bool? disableIcon,
    this.isPP,
  }) : this.disableIcon = disableIcon ?? true;

  final VitalsStruct? vital;
  final Future Function()? selectedInfoIndex;
  final bool? enableInfo;
  final bool disableIcon;
  final bool? isPP;

  @override
  State<VitalsCardWidget> createState() => _VitalsCardWidgetState();
}

class _VitalsCardWidgetState extends State<VitalsCardWidget> {
  late VitalsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VitalsCardModel());

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

    return Stack(
      children: [
        if (widget.vital?.type != 'DiabetesRisk')
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: widget.vital?.type == 'BloodPressure' ? 200.0 : 80.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: Color(0xFFDFDFDF),
                width: 1.0,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().theme.backgroudPrimaryColor,
                                Color(0x283894B5),
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  FFAppState().theme.primaryColor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (widget.vital?.type == 'BloodGlucose')
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kbloodGlucose,
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 20.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                if (widget.vital?.type == 'CardiacOutput')
                                  Flexible(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 2.0, 0.0),
                                        child: Icon(
                                          FFIcons.kcardiacOutput,
                                          color: valueOrDefault<Color>(
                                            FFAppState().theme.primaryColor,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                if (widget.vital?.type == 'RespirationRate')
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 6.0, 0.0),
                                      child: Icon(
                                        FFIcons.krespiration,
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                if (widget.vital?.type == 'StressIndex')
                                  Expanded(
                                    child: Icon(
                                      FFIcons.kangry,
                                      color: valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      size: 14.0,
                                    ),
                                  ),
                                if (widget.vital?.type == 'TotalBodyWater')
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        FFIcons.ktotalBodyWater,
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                if (widget.vital?.type == 'VO2Max')
                                  Expanded(
                                    child: Icon(
                                      FFIcons.kvo2Max,
                                      color: valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      size: 14.0,
                                    ),
                                  ),
                                if (widget.vital?.type ==
                                    'MeanArterialPressure')
                                  Expanded(
                                    child: Icon(
                                      Icons.local_pharmacy_rounded,
                                      color: valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      size: 14.0,
                                    ),
                                  ),
                                if (widget.vital?.type == 'WaistToHipRatio')
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kwaistToHip,
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                if (widget.vital?.type == 'WaistCircumference')
                                  Expanded(
                                    child: Icon(
                                      FFIcons.kwaist,
                                      color: valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      size: 14.0,
                                    ),
                                  ),
                                if (widget.vital?.type == 'Weight')
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kweight,
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
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
                                        'AfterDinnerBloodGlucose') ||
                                    (widget.vital?.type ==
                                        'AfterLunchBloodGlucose') ||
                                    (widget.vital?.type == 'HbA1c'))
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kbloodGlucose,
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                if (widget.vital?.type == 'BabyKickCount')
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kbabykick,
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                if (widget.vital?.type == 'CaloriesBurned')
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.local_fire_department_sharp,
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    widget.vital?.label,
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: AlignedTooltip(
                              content: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: Text(
                                  functions.addNewLineIfNecessary(
                                      widget.vital!.description,
                                      MediaQuery.sizeOf(context).width),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Nevermind',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nevermind'),
                                      ),
                                ),
                              ),
                              offset: 4.0,
                              preferredDirection: AxisDirection.down,
                              borderRadius: BorderRadius.circular(8.0),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              elevation: 4.0,
                              tailBaseWidth: 20.0,
                              tailLength: 10.0,
                              waitDuration: Duration(milliseconds: 0),
                              showDuration: Duration(milliseconds: 0),
                              triggerMode: TooltipTriggerMode.tap,
                              child: Icon(
                                Icons.info_outline,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (widget.vital?.type == 'BloodPressure')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          height: 65.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: Color(0xFFDFDFDF),
                              width:
                                  functions.checkObjectHasValues(widget.vital!)
                                      ? 0.0
                                      : 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Systolic',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    widget.vital?.multiVitals
                                                        .where((e) =>
                                                            e.name == 'bp_sys')
                                                        .toList()
                                                        .firstOrNull
                                                        ?.value,
                                                    '00',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nevermind',
                                                        color: valueOrDefault<
                                                            Color>(
                                                          FFAppState()
                                                              .theme
                                                              .primaryColor,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Nevermind'),
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: widget.vital?.unit !=
                                                              null &&
                                                          widget.vital?.unit !=
                                                              ''
                                                      ? widget.vital!.unit
                                                      : (""),
                                                  style: TextStyle(
                                                    fontFamily: 'Nevermind',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 16.0,
                                                  ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                ),
                                if (widget.vital?.severity != null &&
                                    widget.vital?.severity != '')
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: () {
                                          if (valueOrDefault<String>(
                                                widget.vital?.multiVitals
                                                    .firstOrNull?.severity,
                                                '00',
                                              ) ==
                                              'High') {
                                            return Color(0xFFD83924);
                                          } else if (valueOrDefault<String>(
                                                widget.vital?.multiVitals
                                                    .firstOrNull?.severity,
                                                '00',
                                              ) ==
                                              'Normal') {
                                            return Color(0xFF5EBC44);
                                          } else {
                                            return Color(0xFFF7D529);
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(53.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          width: 0.0,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            widget.vital?.multiVitals
                                                .firstOrNull?.severity,
                                            '00',
                                          ),
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type == 'BloodPressure')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          height: 65.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: Color(0xFFDFDFDF),
                              width:
                                  functions.checkObjectHasValues(widget.vital!)
                                      ? 0.0
                                      : 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Diastolic',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      widget.vital?.multiVitals
                                                          .where((e) =>
                                                              e.name ==
                                                              'bp_dia')
                                                          .toList()
                                                          .firstOrNull
                                                          ?.value,
                                                      '00',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Nevermind',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            FFAppState()
                                                                .theme
                                                                .primaryColor,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Nevermind'),
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: widget.vital?.unit !=
                                                                null &&
                                                            widget.vital
                                                                    ?.unit !=
                                                                ''
                                                        ? widget.vital!.unit
                                                        : (""),
                                                    style: TextStyle(
                                                      fontFamily: 'Nevermind',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 16.0,
                                                    ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                ),
                                if (widget.vital?.severity != null &&
                                    widget.vital?.severity != '')
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: () {
                                          if (valueOrDefault<String>(
                                                widget.vital?.multiVitals
                                                    .lastOrNull?.severity,
                                                '00',
                                              ) ==
                                              'High') {
                                            return Color(0xFFD83924);
                                          } else if (valueOrDefault<String>(
                                                widget.vital?.multiVitals
                                                    .lastOrNull?.severity,
                                                '00',
                                              ) ==
                                              'Normal') {
                                            return Color(0xFF5EBC44);
                                          } else {
                                            return Color(0xFFF7D529);
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(53.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          width: 0.0,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            widget.vital?.multiVitals
                                                .lastOrNull?.severity,
                                            '00',
                                          ),
                                          minFontSize: 8.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (widget.vital?.type != 'BloodPressure')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        widget.vital?.value,
                                        '00',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nevermind',
                                            color: valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Nevermind'),
                                          ),
                                    ),
                                    TextSpan(
                                      text: widget.vital?.unit != null &&
                                              widget.vital?.unit != ''
                                          ? widget.vital!.unit
                                          : (""),
                                      style: TextStyle(
                                        fontFamily: 'Nevermind',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                            if (widget.vital?.severity != null &&
                                widget.vital?.severity != '')
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Container(
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (widget.vital?.severity == 'High') {
                                        return Color(0xFFD83924);
                                      } else if (widget.vital?.severity ==
                                          'Normal') {
                                        return Color(0xFF5EBC44);
                                      } else {
                                        return Color(0xFFF7D529);
                                      }
                                    }(),
                                    borderRadius: BorderRadius.circular(53.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      width: 0.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: AutoSizeText(
                                      widget.vital!.severity,
                                      minFontSize: 8.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        if (widget.vital?.type == 'DiabetesRisk')
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: wrapWithModel(
              model: _model.diabetesComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: DiabetesComponentWidget(
                historyCallback: () async {},
              ),
            ),
          ),
      ],
    );
  }
}
