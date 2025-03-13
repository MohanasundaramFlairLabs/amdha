import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/micro_components/add_vitals_action_sheet/add_vitals_action_sheet_widget.dart';
import '/pages/components/micro_components/vitals_component/diabetes_component/diabetes_component_widget.dart';
import '/pages/components/micro_components/vitals_component/vitals_card/vitals_card_widget.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/pages/components/shimmer_components/vital_shimmer/vital_shimmer_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vital_home_component_model.dart';
export 'vital_home_component_model.dart';

class VitalHomeComponentWidget extends StatefulWidget {
  const VitalHomeComponentWidget({
    super.key,
    required this.callback,
    required this.editCallback,
    bool? isScanResult,
    bool? isPP,
  })  : this.isScanResult = isScanResult ?? false,
        this.isPP = isPP ?? false;

  final Future Function(bool? isScanVital, bool? iSAddVital)? callback;
  final Future Function(VitalsStruct? vitalToEdit)? editCallback;
  final bool isScanResult;
  final bool isPP;

  @override
  State<VitalHomeComponentWidget> createState() =>
      _VitalHomeComponentWidgetState();
}

class _VitalHomeComponentWidgetState extends State<VitalHomeComponentWidget> {
  late VitalHomeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VitalHomeComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VITAL_HOME_COMPONENT_VitalHomeComponent_');
      await Future.wait([
        Future(() async {
          _model.vitalResponse3 = await VitalsCall.call(
            baseurl: FFAppState().baseUrl,
            userId: FFAppState().userId,
          );

          if ((_model.vitalResponse3?.succeeded ?? true)) {
            _model.isLoaded = true;
            safeSetState(() {});
          }
        }),
        Future(() async {
          if (FFAppState().settings.healthDevice.sync) {
            if (!widget.isScanResult) {
              _model.permissionStatus = await actions.getVitalsPermission();
              FFAppState().healthToggle = _model.permissionStatus!;
              safeSetState(() {});
              if (isAndroid) {
                await actions.getHealthDeviceVitals();
              }
            }
          }
        }),
      ]);
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

    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: widget.isScanResult
              ? (MediaQuery.sizeOf(context).height)
              : (MediaQuery.sizeOf(context).height -
                  FFAppState().statusBarHeight -
                  (0.08 * MediaQuery.sizeOf(context).height)),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 56.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  widget.isScanResult ? 'Results' : 'Vitals',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                            if (FFAppState().healthToggle &&
                                !widget.isScanResult &&
                                FFAppState().settings.healthDevice.sync)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'VITAL_HOME_COMPONENT_Container_su2necjw_');
                                  if (!_model.isFetchingHealthData) {
                                    _model.isFetchingHealthData = true;
                                    safeSetState(() {});
                                    _model.vitalSuccess =
                                        await actions.getHealthDeviceVitals();
                                    if (_model.vitalSuccess!) {
                                      _model.isFetchingHealthData = false;
                                      safeSetState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Permission successfully granted to AMDHA for health apps. Tap \'View my health apps\' to manage settings.',
                                            style: TextStyle(
                                              color: Color(0xFF242E49),
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 1000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                        ),
                                      );
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        HomePageWidget.routeName,
                                        queryParameters: {
                                          'index': serializeParam(
                                            4,
                                            ParamType.int,
                                          ),
                                          'doScan': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                          'isFromNotification': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                          'taskId': serializeParam(
                                            '',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      _model.isFetchingHealthData = false;
                                      safeSetState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'No data to update',
                                            style: TextStyle(
                                              color: Color(0xFF242E49),
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 1000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Data fetching in progress',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 1000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.sync,
                                          color: Color(0xFF008080),
                                          size: 20.0,
                                        ),
                                        Text(
                                          'Sync',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Color(0xFF008080),
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0.0,
                        thickness: 0.25,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      if (_model.isLoaded)
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 10.0, 30.0, 10.0),
                              child: Wrap(
                                spacing: 15.0,
                                runSpacing: 10.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'VITAL_HOME_COMPONENT_Container_rfuj8bxv_');
                                      _model.selectedCategory = 'Physiological';
                                      safeSetState(() {});
                                      _model.selectedInfoIndex = null;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _model.selectedCategory ==
                                                'Physiological'
                                            ? valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .backgroudPrimaryColor,
                                                Color(0x283894B5),
                                              )
                                            : Color(0xFFE8E8E8),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        border: Border.all(
                                          color: _model.selectedCategory ==
                                                  'Physiological'
                                              ? valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .primaryColor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .secondary,
                                          width: _model.selectedCategory ==
                                                  'Physiological'
                                              ? 1.0
                                              : 0.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Physiological',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color:
                                                        _model.selectedCategory ==
                                                                'Physiological'
                                                            ? valueOrDefault<
                                                                Color>(
                                                                FFAppState()
                                                                    .theme
                                                                    .primaryColor,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              )
                                                            : Color(0x80242E49),
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
                                            Icon(
                                              FFIcons.kphysiological,
                                              color: _model.selectedCategory ==
                                                      'Physiological'
                                                  ? valueOrDefault<Color>(
                                                      FFAppState()
                                                          .theme
                                                          .primaryColor,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    )
                                                  : Color(0x80242E49),
                                              size: 20.0,
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'VITAL_HOME_COMPONENT_Container_unjtq0md_');
                                      _model.selectedCategory =
                                          'Key Body Vitals';
                                      safeSetState(() {});
                                      _model.selectedInfoIndex = null;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: _model.selectedCategory ==
                                                'Key Body Vitals'
                                            ? valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .backgroudPrimaryColor,
                                                Color(0x283894B5),
                                              )
                                            : Color(0xFFE8E8E8),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        border: Border.all(
                                          color: _model.selectedCategory ==
                                                  'Key Body Vitals'
                                              ? valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .primaryColor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .secondary,
                                          width: _model.selectedCategory ==
                                                  'Key Body Vitals'
                                              ? 1.0
                                              : 0.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 15.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Key Body Vitals',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color:
                                                        _model.selectedCategory ==
                                                                'Key Body Vitals'
                                                            ? valueOrDefault<
                                                                Color>(
                                                                FFAppState()
                                                                    .theme
                                                                    .primaryColor,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              )
                                                            : Color(0x80242E49),
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
                                            Icon(
                                              FFIcons.kkbv,
                                              color: _model.selectedCategory ==
                                                      'Key Body Vitals'
                                                  ? valueOrDefault<Color>(
                                                      FFAppState()
                                                          .theme
                                                          .primaryColor,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    )
                                                  : Color(0x80242E49),
                                              size: 20.0,
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (widget.isPP)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VITAL_HOME_COMPONENT_Container_ma7fg80z_');
                                        _model.selectedCategory =
                                            'Fetal Health';
                                        safeSetState(() {});
                                        _model.selectedInfoIndex = null;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: _model.selectedCategory ==
                                                  'Fetal Health'
                                              ? valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .backgroudPrimaryColor,
                                                  Color(0x283894B5),
                                                )
                                              : Color(0xFFE8E8E8),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          border: Border.all(
                                            color: _model.selectedCategory ==
                                                    'Fetal Health'
                                                ? valueOrDefault<Color>(
                                                    FFAppState()
                                                        .theme
                                                        .primaryColor,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  )
                                                : FlutterFlowTheme.of(context)
                                                    .secondary,
                                            width: _model.selectedCategory ==
                                                    'Fetal Health'
                                                ? 1.0
                                                : 0.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Fetal Health',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: _model
                                                                      .selectedCategory ==
                                                                  'Fetal Health'
                                                              ? valueOrDefault<
                                                                  Color>(
                                                                  FFAppState()
                                                                      .theme
                                                                      .primaryColor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                )
                                                              : Color(
                                                                  0x80242E49),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Icon(
                                                FFIcons.kfetalhealth,
                                                color:
                                                    _model.selectedCategory ==
                                                            'Fetal Health'
                                                        ? valueOrDefault<Color>(
                                                            FFAppState()
                                                                .theme
                                                                .primaryColor,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          )
                                                        : Color(0x80242E49),
                                                size: 20.0,
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (isWeb || isAndroid)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VITAL_HOME_COMPONENT_Container_23ozt08c_');
                                        _model.selectedCategory =
                                            'Heart Health';
                                        safeSetState(() {});
                                        _model.selectedInfoIndex = null;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: _model.selectedCategory ==
                                                  'Heart Health'
                                              ? valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .backgroudPrimaryColor,
                                                  Color(0x283894B5),
                                                )
                                              : Color(0xFFE8E8E8),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          border: Border.all(
                                            color: _model.selectedCategory ==
                                                    'Heart Health'
                                                ? valueOrDefault<Color>(
                                                    FFAppState()
                                                        .theme
                                                        .primaryColor,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  )
                                                : FlutterFlowTheme.of(context)
                                                    .secondary,
                                            width: _model.selectedCategory ==
                                                    'Heart Health'
                                                ? 1.0
                                                : 0.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Heart Health',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: _model
                                                                      .selectedCategory ==
                                                                  'Heart Health'
                                                              ? valueOrDefault<
                                                                  Color>(
                                                                  FFAppState()
                                                                      .theme
                                                                      .primaryColor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                )
                                                              : Color(
                                                                  0x80242E49),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Icon(
                                                FFIcons.khh,
                                                color:
                                                    _model.selectedCategory ==
                                                            'Heart Health'
                                                        ? valueOrDefault<Color>(
                                                            FFAppState()
                                                                .theme
                                                                .primaryColor,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          )
                                                        : Color(0x80242E49),
                                                size: 20.0,
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (widget.isScanResult == false)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VITAL_HOME_COMPONENT_Container_zpl8dwyg_');
                                        _model.selectedCategory =
                                            'Blood Glucose';
                                        safeSetState(() {});
                                        _model.selectedInfoIndex = null;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: _model.selectedCategory ==
                                                  'Blood Glucose'
                                              ? valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .backgroudPrimaryColor,
                                                  Color(0x283894B5),
                                                )
                                              : Color(0xFFE8E8E8),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          border: Border.all(
                                            color: _model.selectedCategory ==
                                                    'Blood Glucose'
                                                ? valueOrDefault<Color>(
                                                    FFAppState()
                                                        .theme
                                                        .primaryColor,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  )
                                                : FlutterFlowTheme.of(context)
                                                    .secondary,
                                            width: _model.selectedCategory ==
                                                    'Blood Glucose'
                                                ? 1.0
                                                : 0.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Blood Glucose',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: _model
                                                                      .selectedCategory ==
                                                                  'Blood Glucose'
                                                              ? valueOrDefault<
                                                                  Color>(
                                                                  FFAppState()
                                                                      .theme
                                                                      .primaryColor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                )
                                                              : Color(
                                                                  0x80242E49),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Icon(
                                                FFIcons.kbg,
                                                color:
                                                    _model.selectedCategory ==
                                                            'Blood Glucose'
                                                        ? valueOrDefault<Color>(
                                                            FFAppState()
                                                                .theme
                                                                .primaryColor,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          )
                                                        : Color(0x80242E49),
                                                size: 20.0,
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (isWeb || isAndroid)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VITAL_HOME_COMPONENT_Container_jpcany8x_');
                                        _model.selectedCategory = 'Stress';
                                        safeSetState(() {});
                                        _model.selectedInfoIndex = null;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: _model.selectedCategory ==
                                                  'Stress'
                                              ? valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .backgroudPrimaryColor,
                                                  Color(0x283894B5),
                                                )
                                              : Color(0xFFE8E8E8),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          border: Border.all(
                                            color: _model.selectedCategory ==
                                                    'Stress'
                                                ? valueOrDefault<Color>(
                                                    FFAppState()
                                                        .theme
                                                        .primaryColor,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  )
                                                : FlutterFlowTheme.of(context)
                                                    .secondary,
                                            width: _model.selectedCategory ==
                                                    'Stress'
                                                ? 1.0
                                                : 0.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Stress',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: _model
                                                                      .selectedCategory ==
                                                                  'Stress'
                                                              ? valueOrDefault<
                                                                  Color>(
                                                                  FFAppState()
                                                                      .theme
                                                                      .primaryColor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                )
                                                              : Color(
                                                                  0x80242E49),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Icon(
                                                FFIcons.kstress,
                                                color:
                                                    _model.selectedCategory ==
                                                            'Stress'
                                                        ? valueOrDefault<Color>(
                                                            FFAppState()
                                                                .theme
                                                                .primaryColor,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          )
                                                        : Color(0x80242E49),
                                                size: 20.0,
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'VITAL_HOME_COMPONENT_Container_ddquj60q_');
                                      _model.selectedCategory = 'Diabetes Risk';
                                      safeSetState(() {});
                                      _model.selectedInfoIndex = null;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: _model.selectedCategory ==
                                                'Diabetes Risk'
                                            ? valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .backgroudPrimaryColor,
                                                Color(0x283894B5),
                                              )
                                            : Color(0xFFE8E8E8),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        border: Border.all(
                                          color: _model.selectedCategory ==
                                                  'Diabetes Risk'
                                              ? valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .primaryColor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                )
                                              : FlutterFlowTheme.of(context)
                                                  .secondary,
                                          width: _model.selectedCategory ==
                                                  'Diabetes Risk'
                                              ? 1.0
                                              : 0.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Diabetes Risk',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color:
                                                        _model.selectedCategory ==
                                                                'Diabetes Risk'
                                                            ? valueOrDefault<
                                                                Color>(
                                                                FFAppState()
                                                                    .theme
                                                                    .primaryColor,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              )
                                                            : Color(0x80242E49),
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
                                            Icon(
                                              FFIcons.kspeed,
                                              color: _model.selectedCategory ==
                                                      'Diabetes Risk'
                                                  ? valueOrDefault<Color>(
                                                      FFAppState()
                                                          .theme
                                                          .primaryColor,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    )
                                                  : Color(0x80242E49),
                                              size: 20.0,
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      Divider(
                        height: 0.0,
                        thickness: 0.25,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      if (_model.isLoaded)
                        Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.selectedCategory ==
                                      'Diabetes Risk')
                                    Builder(
                                      builder: (context) {
                                        final diabetes = functions
                                            .checkVitalInCategory(
                                                _model.selectedCategory,
                                                VitalsModelStruct.maybeFromMap(
                                                        (_model.vitalResponse3
                                                                ?.jsonBody ??
                                                            ''))!
                                                    .vitals
                                                    .toList())
                                            .toList();
                                        if (diabetes.isEmpty) {
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.6,
                                            child: NoDataComponentWidget(
                                              name: 'Activities',
                                            ),
                                          );
                                        }

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              diabetes.length, (diabetesIndex) {
                                            final diabetesItem =
                                                diabetes[diabetesIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 20.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.95,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: DiabetesComponentWidget(
                                                  key: Key(
                                                      'Keyr0e_${diabetesIndex}_of_${diabetes.length}'),
                                                  vital: diabetesItem,
                                                  isFromResult:
                                                      widget.isScanResult,
                                                  historyCallback: () async {
                                                    logFirebaseEvent(
                                                        'VITAL_HOME_COMPONENT_Container_r0ejagpp_');
                                                    if (!widget.isScanResult) {
                                                      context.pushNamed(
                                                          DiabetesHistoryWidget
                                                              .routeName);
                                                    }
                                                  },
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  if (_model.selectedCategory !=
                                      'Diabetes Risk')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final vital = functions
                                              .checkVitalInCategory(
                                                  _model.selectedCategory,
                                                  VitalsModelStruct.maybeFromMap(
                                                          (_model.vitalResponse3
                                                                  ?.jsonBody ??
                                                              ''))!
                                                      .vitals
                                                      .toList())
                                              .toList();
                                          if (vital.isEmpty) {
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.6,
                                              child: NoDataComponentWidget(
                                                name: 'Activities',
                                              ),
                                            );
                                          }

                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(
                                                    vital.length, (vitalIndex) {
                                              final vitalItem =
                                                  vital[vitalIndex];
                                              return Visibility(
                                                visible: () {
                                                  if (isiOS) {
                                                    return functions
                                                        .shouldDisplayVital(
                                                            vitalItem.label,
                                                            widget
                                                                .isScanResult);
                                                  } else if (widget
                                                      .isScanResult) {
                                                    return (vitalItem
                                                            .entryType ==
                                                        'Scan');
                                                  } else {
                                                    return true;
                                                  }
                                                }(),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'VITAL_HOME_COMPONENT_Container_qadzhjbz_');
                                                    _model.selectedInfoIndex =
                                                        null;
                                                    safeSetState(() {});
                                                    if (!widget.isScanResult) {
                                                      if ((FFAppState()
                                                                  .quotas
                                                                  .quotas
                                                                  .addVitals >
                                                              0) ||
                                                          FFAppState()
                                                              .isFreeScanAvailable) {
                                                        FFAppState()
                                                            .clearFetchVitlHistoryQueryCache();

                                                        context.pushNamed(
                                                          SetgoalWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'vitalName':
                                                                serializeParam(
                                                              vitalItem.type,
                                                              ParamType.String,
                                                            ),
                                                            'isFromGoal':
                                                                serializeParam(
                                                              false,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        await action_blocks
                                                            .doSubscription(
                                                                context);
                                                      }
                                                    }
                                                  },
                                                  child: VitalsCardWidget(
                                                    key: Key(
                                                        'Keyqad_${vitalIndex}_of_${vital.length}'),
                                                    vital: vitalItem,
                                                    enableInfo: _model
                                                            .selectedInfoIndex
                                                            .toString() ==
                                                        vitalIndex.toString(),
                                                    disableIcon: _model
                                                            .selectedCategory ==
                                                        'Blood Glucose',
                                                    isPP: widget.isPP,
                                                    selectedInfoIndex:
                                                        () async {
                                                      logFirebaseEvent(
                                                          'VITAL_HOME_COMPONENT_Container_qadzhjbz_');
                                                      if (vitalIndex ==
                                                          _model
                                                              .selectedInfoIndex) {
                                                        _model.selectedInfoIndex =
                                                            null;
                                                        safeSetState(() {});
                                                      } else {
                                                        _model.selectedInfoIndex =
                                                            vitalIndex;
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                  ),
                                                ),
                                              );
                                            })
                                                .divide(
                                                  SizedBox(height: 10.0),
                                                  filterFn: (vitalIndex) {
                                                    final vitalItem =
                                                        vital[vitalIndex];
                                                    return () {
                                                      if (isiOS) {
                                                        return functions
                                                            .shouldDisplayVital(
                                                                vitalItem.label,
                                                                widget
                                                                    .isScanResult);
                                                      } else if (widget
                                                          .isScanResult) {
                                                        return (vitalItem
                                                                .entryType ==
                                                            'Scan');
                                                      } else {
                                                        return true;
                                                      }
                                                    }();
                                                  },
                                                )
                                                .addToStart(
                                                    SizedBox(height: 16.0))
                                                .addToEnd(
                                                    SizedBox(height: 20.0)),
                                          );
                                        },
                                      ),
                                    ),
                                  if ((functions
                                          .checkVitalInCategory(
                                              _model.selectedCategory,
                                              VitalsModelStruct.maybeFromMap(
                                                      (_model.vitalResponse3
                                                              ?.jsonBody ??
                                                          ''))!
                                                  .vitals
                                                  .toList())
                                          .isNotEmpty) ||
                                      ((_model.selectedCategory ==
                                              'Diabetes Risk') &&
                                          (functions
                                              .checkVitalInCategory(
                                                  _model.selectedCategory,
                                                  VitalsModelStruct.maybeFromMap(
                                                          (_model.vitalResponse3
                                                                  ?.jsonBody ??
                                                              ''))!
                                                      .vitals
                                                      .toList())
                                              .isNotEmpty)))
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.95,
                                            decoration: BoxDecoration(
                                              color: FFAppState()
                                                  .theme
                                                  .backgroudPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 10.0, 10.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.info_outline,
                                                        color: FFAppState()
                                                            .theme
                                                            .primaryColor,
                                                        size: 20.0,
                                                      ),
                                                      Text(
                                                        'Disclaimer: ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            _model.selectedCategory ==
                                                                    'Diabetes Risk'
                                                                ? 'The assessment provided here is indicative and may not accurately reflect your individual risk. It is not a substitute for professional medical advice, diagnosis, or treatment. Always consult with a qualified healthcare professional for a more personalized evaluation or any health concerns.'
                                                                : 'AMDHA is not a substitute for the clinical judgment of a health care professional. Screening in AMDHA is intended to improve your awareness of general wellness.  Screening does not diagnose, treat, mitigate or prevent any disease, symptom, disorder or abnormal physical state. Consult with a health care professional or emergency services if you believe you may have a medical issue or before making any medical decisions.',
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                  lineHeight:
                                                                      1.3,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (!_model.isLoaded)
                        Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.vitalShimmerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: VitalShimmerWidget(),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            height: 80.0,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.isScanResult)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'VITAL_HOME_COMPONENT_GO_TO_HOME_BTN_ON_T');

                            context.goNamed(
                              HomePageWidget.routeName,
                              queryParameters: {
                                'index': serializeParam(
                                  0,
                                  ParamType.int,
                                ),
                                'doScan': serializeParam(
                                  false,
                                  ParamType.bool,
                                ),
                                'isFromNotification': serializeParam(
                                  false,
                                  ParamType.bool,
                                ),
                                'taskId': serializeParam(
                                  '',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Go to home',
                          options: FFButtonOptions(
                            height: 51.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 40.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: valueOrDefault<Color>(
                              FFAppState().theme.primaryColor,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(120.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (!widget.isScanResult)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 20.0, 20.0),
                        child: FlutterFlowIconButton(
                          borderColor: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          borderRadius: 28.0,
                          borderWidth: 1.0,
                          buttonSize: 56.0,
                          fillColor: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          icon: Icon(
                            Icons.add_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 32.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'VITAL_HOME_COMPONENT_add_rounded_ICN_ON_');
                            _model.isAddVital = false;
                            _model.isScanVital = false;
                            safeSetState(() {});
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: AddVitalsActionSheetWidget(
                                    title1: 'Add Vitals',
                                    title2: 'Scan Vitals',
                                    callbackActionTwo: () async {
                                      _model.isScanVital = true;
                                      _model.isAddVital = false;
                                      safeSetState(() {});
                                    },
                                    callbackActionOne: () async {
                                      _model.isAddVital = true;
                                      _model.isScanVital = false;
                                      safeSetState(() {});
                                    },
                                    isHideNavBar: (isHideNavBar) async {},
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            if (_model.isScanVital) {
                              if ((FFAppState().quotas.quotas.careplixScan >
                                      0) ||
                                  FFAppState().isFreeScanAvailable) {
                                await widget.callback?.call(
                                  _model.isScanVital,
                                  _model.isAddVital,
                                );
                                _model.isScanVital = false;
                                _model.isAddVital = false;
                                safeSetState(() {});
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text(
                                          'You have exhausted the allocated scans.'),
                                      content: Text(
                                          'Please purchase more scans to continue using the scan feature.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                await action_blocks.doSubscription(context);
                              }
                            } else {
                              if (_model.isAddVital) {
                                if (FFAppState().quotas.quotas.addVitals > 0) {
                                  await widget.callback?.call(
                                    _model.isScanVital,
                                    _model.isAddVital,
                                  );
                                  _model.isScanVital = false;
                                  _model.isAddVital = false;
                                  safeSetState(() {});
                                } else {
                                  await action_blocks.doSubscription(context);
                                }
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
