import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_tracker_page_model.dart';
export 'food_tracker_page_model.dart';

class FoodTrackerPageWidget extends StatefulWidget {
  const FoodTrackerPageWidget({super.key});

  static String routeName = 'FoodTrackerPage';
  static String routePath = '/foodTrackerPage';

  @override
  State<FoodTrackerPageWidget> createState() => _FoodTrackerPageWidgetState();
}

class _FoodTrackerPageWidgetState extends State<FoodTrackerPageWidget> {
  late FoodTrackerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodTrackerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FOOD_TRACKER_FoodTrackerPage_ON_INIT_STA');
      _model.meals = await HocGroup.getFoodTrackerCall.call(
        userId: FFAppState().authToken,
        baseurl: FFAppState().baseUrl,
        date: functions.convertDateTimetoDate(getCurrentTimestamp),
      );

      if ((_model.meals?.succeeded ?? true)) {
        FFAppState().mealList = FoodTrackerStruct.maybeFromMap(getJsonField(
          (_model.meals?.jsonBody ?? ''),
          r'''$.data[0]''',
        ))!;
        safeSetState(() {});
        _model.selectedIndex = 0;
        safeSetState(() {});
        _model.isDataLoaded = true;
        safeSetState(() {});
        if (FFAppState()
                    .mealList
                    .meals
                    .elementAtOrNull(_model.selectedIndex!)
                    ?.mealTime !=
                null &&
            FFAppState()
                    .mealList
                    .meals
                    .elementAtOrNull(_model.selectedIndex!)
                    ?.mealTime !=
                '') {
          _model.mealTime = functions.convertMillisecondsToDateTime(FFAppState()
              .mealList
              .meals
              .elementAtOrNull(_model.selectedIndex!)!
              .mealTime);
          safeSetState(() {});
        } else {
          _model.mealTime = getCurrentTimestamp;
          safeSetState(() {});
        }
      } else {
        _model.selectedIndex = 0;
        safeSetState(() {});
        _model.isDataLoaded = true;
        safeSetState(() {});
      }
    });

    _model.foodItemTextController ??= TextEditingController();
    _model.foodItemFocusNode ??= FocusNode();
    _model.foodItemFocusNode!.addListener(
      () async {
        logFirebaseEvent('FOOD_TRACKER_foodItem_ON_FOCUS_CHANGE');
        _model.isFoodAdded = _model.foodItemTextController.text != '';
        safeSetState(() {});
      },
    );
    _model.portionTextController ??= TextEditingController();
    _model.portionFocusNode ??= FocusNode();

    _model.portionSizeTextController ??= TextEditingController();
    _model.portionSizeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (_model.isDataLoaded) {
                return Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Daily Food Tracker',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: Color(0xFF242E49),
                                              fontSize: 20.0,
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
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'FOOD_TRACKER_Container_fb08odne_ON_TAP');

                                            context.pushNamed(
                                                MealHistoryPageWidget
                                                    .routeName);
                                          },
                                          child: Container(
                                            width: 36.0,
                                            height: 36.0,
                                            decoration: BoxDecoration(
                                              color: FFAppState()
                                                  .theme
                                                  .backgroudPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              FFIcons.kmealHistory,
                                              color: FFAppState()
                                                  .theme
                                                  .primaryColor,
                                              size: 20.0,
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
                                                'FOOD_TRACKER_Container_lsym33a5_ON_TAP');
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
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
                                                'isFromNotification':
                                                    serializeParam(
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
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Icon(
                                              Icons.close_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 20.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 2.0,
                            thickness: 0.5,
                            color: Color(0xFFDFDFDF),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Opacity(
                          opacity: 0.9,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Select your meal type',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFF242E49),
                                                          fontSize: 16.0,
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
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'FOOD_TRACKER_Text_x8io91gd_ON_TAP');
                                                  if ((FFAppState().mealList.meals.elementAtOrNull(0)!.items.length > 0) ||
                                                      (FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  1)!
                                                              .items
                                                              .length >
                                                          0) ||
                                                      (FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  2)!
                                                              .items
                                                              .length >
                                                          0) ||
                                                      (FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  3)!
                                                              .items
                                                              .length >
                                                          0)) {
                                                    context.pushNamed(
                                                        PreviewMealPageWidget
                                                            .routeName);
                                                  }
                                                },
                                                child: Text(
                                                  'Save meals',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: (FFAppState().mealList.meals.elementAtOrNull(0)!.items.length > 0) ||
                                                                    (FFAppState()
                                                                            .mealList
                                                                            .meals
                                                                            .elementAtOrNull(
                                                                                1)!
                                                                            .items
                                                                            .length >
                                                                        0) ||
                                                                    (FFAppState()
                                                                            .mealList
                                                                            .meals
                                                                            .elementAtOrNull(
                                                                                2)!
                                                                            .items
                                                                            .length >
                                                                        0) ||
                                                                    (FFAppState()
                                                                            .mealList
                                                                            .meals
                                                                            .elementAtOrNull(
                                                                                3)!
                                                                            .items
                                                                            .length >
                                                                        0)
                                                                ? valueOrDefault<
                                                                    Color>(
                                                                    FFAppState()
                                                                        .theme
                                                                        .primaryColor,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .success,
                                                                  )
                                                                : Color(
                                                                    0xFF949494),
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'FOOD_TRACKER_Container_6ewz6izr_ON_TAP');
                                                  _model.selectedIndex = 0;
                                                  _model.isEditMode = false;
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model
                                                        .foodItemTextController
                                                        ?.clear();
                                                    _model.portionTextController
                                                        ?.clear();
                                                    _model
                                                        .portionSizeTextController
                                                        ?.clear();
                                                  });
                                                  if (FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .selectedIndex!)
                                                              ?.mealTime !=
                                                          null &&
                                                      FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .selectedIndex!)
                                                              ?.mealTime !=
                                                          '') {
                                                    _model.mealTime = functions
                                                        .convertMillisecondsToDateTime(
                                                            FFAppState()
                                                                .mealList
                                                                .meals
                                                                .elementAtOrNull(
                                                                    _model
                                                                        .selectedIndex!)!
                                                                .mealTime);
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.mealTime =
                                                        getCurrentTimestamp;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                child: Container(
                                                  width: 80.0,
                                                  height: 72.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          _model.selectedIndex ==
                                                                  0
                                                              ? valueOrDefault<
                                                                  Color>(
                                                                  FFAppState()
                                                                      .theme
                                                                      .primaryColor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                )
                                                              : Color(
                                                                  0xFF242E49),
                                                      width:
                                                          _model.selectedIndex ==
                                                                  0
                                                              ? 1.0
                                                              : 0.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (FFAppState()
                                                                        .mealList
                                                                        .meals
                                                                        .elementAtOrNull(
                                                                            0)!
                                                                        .items
                                                                        .length >
                                                                    0) {
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/24-Breakfast.svg',
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.67,
                                                                              1.67,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().theme.primaryColor,
                                                                              FlutterFlowTheme.of(context).success,
                                                                            ),
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  return Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .kbreakfast,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          40.0,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Breakfast',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 3.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'FOOD_TRACKER_Container_9ni3pw3v_ON_TAP');
                                                  _model.selectedIndex = 1;
                                                  _model.isEditMode = false;
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model
                                                        .foodItemTextController
                                                        ?.clear();
                                                    _model.portionTextController
                                                        ?.clear();
                                                    _model
                                                        .portionSizeTextController
                                                        ?.clear();
                                                  });
                                                  if (FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .selectedIndex!)
                                                              ?.mealTime !=
                                                          null &&
                                                      FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .selectedIndex!)
                                                              ?.mealTime !=
                                                          '') {
                                                    _model.mealTime = functions
                                                        .convertMillisecondsToDateTime(
                                                            FFAppState()
                                                                .mealList
                                                                .meals
                                                                .elementAtOrNull(
                                                                    _model
                                                                        .selectedIndex!)!
                                                                .mealTime);
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.mealTime =
                                                        getCurrentTimestamp;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                child: Container(
                                                  width: 80.0,
                                                  height: 72.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          _model.selectedIndex ==
                                                                  1
                                                              ? valueOrDefault<
                                                                  Color>(
                                                                  FFAppState()
                                                                      .theme
                                                                      .primaryColor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                )
                                                              : Color(
                                                                  0xFF242E49),
                                                      width:
                                                          _model.selectedIndex ==
                                                                  1
                                                              ? 1.0
                                                              : 0.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (FFAppState()
                                                                        .mealList
                                                                        .meals
                                                                        .elementAtOrNull(
                                                                            1)!
                                                                        .items
                                                                        .length >
                                                                    0) {
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/fi_2515271.svg',
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.67,
                                                                              1.67,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().theme.primaryColor,
                                                                              FlutterFlowTheme.of(context).success,
                                                                            ),
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  return Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .klunch,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          40.0,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Lunch',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 3.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'FOOD_TRACKER_Container_a14symwm_ON_TAP');
                                                  _model.selectedIndex = 2;
                                                  _model.isEditMode = false;
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model
                                                        .foodItemTextController
                                                        ?.clear();
                                                    _model.portionTextController
                                                        ?.clear();
                                                    _model
                                                        .portionSizeTextController
                                                        ?.clear();
                                                  });
                                                  if (FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .selectedIndex!)
                                                              ?.mealTime !=
                                                          null &&
                                                      FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .selectedIndex!)
                                                              ?.mealTime !=
                                                          '') {
                                                    _model.mealTime = functions
                                                        .convertMillisecondsToDateTime(
                                                            FFAppState()
                                                                .mealList
                                                                .meals
                                                                .elementAtOrNull(
                                                                    _model
                                                                        .selectedIndex!)!
                                                                .mealTime);
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.mealTime =
                                                        getCurrentTimestamp;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                child: Container(
                                                  width: 80.0,
                                                  height: 72.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          _model.selectedIndex ==
                                                                  2
                                                              ? valueOrDefault<
                                                                  Color>(
                                                                  FFAppState()
                                                                      .theme
                                                                      .primaryColor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                )
                                                              : Color(
                                                                  0xFF242E49),
                                                      width:
                                                          _model.selectedIndex ==
                                                                  2
                                                              ? 1.0
                                                              : 0.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (FFAppState()
                                                                        .mealList
                                                                        .meals
                                                                        .elementAtOrNull(
                                                                            2)!
                                                                        .items
                                                                        .length >
                                                                    0) {
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/fi_1365540.svg',
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.67,
                                                                              1.67,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().theme.primaryColor,
                                                                              FlutterFlowTheme.of(context).success,
                                                                            ),
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  return Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .ksnacks,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          40.0,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Snacks',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 3.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'FOOD_TRACKER_Container_qmazgav9_ON_TAP');
                                                  _model.selectedIndex = 3;
                                                  _model.isEditMode = false;
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model
                                                        .foodItemTextController
                                                        ?.clear();
                                                    _model.portionTextController
                                                        ?.clear();
                                                    _model
                                                        .portionSizeTextController
                                                        ?.clear();
                                                  });
                                                  if (FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .selectedIndex!)
                                                              ?.mealTime !=
                                                          null &&
                                                      FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .selectedIndex!)
                                                              ?.mealTime !=
                                                          '') {
                                                    _model.mealTime = functions
                                                        .convertMillisecondsToDateTime(
                                                            FFAppState()
                                                                .mealList
                                                                .meals
                                                                .elementAtOrNull(
                                                                    _model
                                                                        .selectedIndex!)!
                                                                .mealTime);
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.mealTime =
                                                        getCurrentTimestamp;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                child: Container(
                                                  width: 80.0,
                                                  height: 72.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          _model.selectedIndex ==
                                                                  3
                                                              ? valueOrDefault<
                                                                  Color>(
                                                                  FFAppState()
                                                                      .theme
                                                                      .primaryColor,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                )
                                                              : Color(
                                                                  0xFF242E49),
                                                      width:
                                                          _model.selectedIndex ==
                                                                  3
                                                              ? 1.0
                                                              : 0.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (FFAppState()
                                                                        .mealList
                                                                        .meals
                                                                        .elementAtOrNull(
                                                                            3)!
                                                                        .items
                                                                        .length >
                                                                    0) {
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/fi_4781223.svg',
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.67,
                                                                              1.67,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                valueOrDefault<Color>(
                                                                              FFAppState().theme.primaryColor,
                                                                              FlutterFlowTheme.of(context).success,
                                                                            ),
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                } else {
                                                                  return Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .kdinner,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          40.0,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Dinner',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 3.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        'Meal time',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '*',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
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
                                                          'FOOD_TRACKER_Container_96typrw8_ON_TAP');

                                                      final _datePickedTime =
                                                          await showTimePicker(
                                                        context: context,
                                                        initialTime: TimeOfDay.fromDateTime((FFAppState()
                                                                        .mealList
                                                                        .meals
                                                                        .elementAtOrNull(_model
                                                                            .selectedIndex!)
                                                                        ?.mealTime !=
                                                                    null &&
                                                                FFAppState()
                                                                        .mealList
                                                                        .meals
                                                                        .elementAtOrNull(_model
                                                                            .selectedIndex!)
                                                                        ?.mealTime !=
                                                                    ''
                                                            ? functions.convertMillisecondsToDateTime(
                                                                FFAppState()
                                                                    .mealList
                                                                    .meals
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .selectedIndex!)!
                                                                    .mealTime)
                                                            : getCurrentTimestamp)),
                                                        builder:
                                                            (context, child) {
                                                          return wrapInMaterialTimePickerTheme(
                                                            context,
                                                            child!,
                                                            headerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            headerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            headerTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily,
                                                                      fontSize:
                                                                          32.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                    ),
                                                            pickerBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            pickerForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            selectedDateTimeBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            selectedDateTimeForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            actionButtonForegroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            iconSize: 24.0,
                                                          );
                                                        },
                                                      );
                                                      if (_datePickedTime !=
                                                          null) {
                                                        safeSetState(() {
                                                          _model.datePicked =
                                                              DateTime(
                                                            (FFAppState().mealList.meals.elementAtOrNull(_model.selectedIndex!)?.mealTime !=
                                                                            null &&
                                                                        FFAppState().mealList.meals.elementAtOrNull(_model.selectedIndex!)?.mealTime !=
                                                                            ''
                                                                    ? functions.convertMillisecondsToDateTime(FFAppState()
                                                                        .mealList
                                                                        .meals
                                                                        .elementAtOrNull(
                                                                            _model.selectedIndex!)!
                                                                        .mealTime)
                                                                    : getCurrentTimestamp)
                                                                .year,
                                                            (FFAppState().mealList.meals.elementAtOrNull(_model.selectedIndex!)?.mealTime !=
                                                                            null &&
                                                                        FFAppState().mealList.meals.elementAtOrNull(_model.selectedIndex!)?.mealTime !=
                                                                            ''
                                                                    ? functions.convertMillisecondsToDateTime(FFAppState()
                                                                        .mealList
                                                                        .meals
                                                                        .elementAtOrNull(
                                                                            _model.selectedIndex!)!
                                                                        .mealTime)
                                                                    : getCurrentTimestamp)
                                                                .month,
                                                            (FFAppState().mealList.meals.elementAtOrNull(_model.selectedIndex!)?.mealTime !=
                                                                            null &&
                                                                        FFAppState().mealList.meals.elementAtOrNull(_model.selectedIndex!)?.mealTime !=
                                                                            ''
                                                                    ? functions.convertMillisecondsToDateTime(FFAppState()
                                                                        .mealList
                                                                        .meals
                                                                        .elementAtOrNull(
                                                                            _model.selectedIndex!)!
                                                                        .mealTime)
                                                                    : getCurrentTimestamp)
                                                                .day,
                                                            _datePickedTime
                                                                .hour,
                                                            _datePickedTime
                                                                .minute,
                                                          );
                                                        });
                                                      } else if (_model
                                                              .datePicked !=
                                                          null) {
                                                        safeSetState(() {
                                                          _model
                                                              .datePicked = (FFAppState()
                                                                          .mealList
                                                                          .meals
                                                                          .elementAtOrNull(_model
                                                                              .selectedIndex!)
                                                                          ?.mealTime !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .mealList
                                                                          .meals
                                                                          .elementAtOrNull(_model
                                                                              .selectedIndex!)
                                                                          ?.mealTime !=
                                                                      ''
                                                              ? functions.convertMillisecondsToDateTime(
                                                                  FFAppState()
                                                                      .mealList
                                                                      .meals
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .selectedIndex!)!
                                                                      .mealTime)
                                                              : getCurrentTimestamp);
                                                        });
                                                      }
                                                      _model.mealTime = _model
                                                                  .datePicked !=
                                                              null
                                                          ? _model.datePicked
                                                          : (FFAppState()
                                                                          .mealList
                                                                          .meals
                                                                          .elementAtOrNull(_model
                                                                              .selectedIndex!)
                                                                          ?.mealTime !=
                                                                      null &&
                                                                  FFAppState()
                                                                          .mealList
                                                                          .meals
                                                                          .elementAtOrNull(_model
                                                                              .selectedIndex!)
                                                                          ?.mealTime !=
                                                                      ''
                                                              ? functions.convertMillisecondsToDateTime(
                                                                  FFAppState()
                                                                      .mealList
                                                                      .meals
                                                                      .elementAtOrNull(
                                                                          _model
                                                                              .selectedIndex!)!
                                                                      .mealTime)
                                                              : getCurrentTimestamp);
                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: 171.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x80000000),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              dateTimeFormat(
                                                                "hh : mm a",
                                                                _model.mealTime,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            Icon(
                                                              Icons.access_time,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 16.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    'Log both your food and drink',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
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
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFDFDFDF),
                                                        width: 0.5,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  16.0,
                                                                  8.0,
                                                                  16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Food item',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '*',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .foodItemTextController,
                                                                  focusNode: _model
                                                                      .foodItemFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.foodItemTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      logFirebaseEvent(
                                                                          'FOOD_TRACKER_foodItem_ON_TEXTFIELD_CHANG');
                                                                      _model
                                                                          .isFoodAdded = _model.foodItemTextController.text !=
                                                                              '';
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                    hintText:
                                                                        'rice, sabzi, roti',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              Color(0xFF949494),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x80000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x80000000),
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                  maxLength: 20,
                                                                  buildCounter: (context,
                                                                          {required currentLength,
                                                                          required isFocused,
                                                                          maxLength}) =>
                                                                      null,
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  validator: _model
                                                                      .foodItemTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              'Portion',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.35,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.portionTextController,
                                                                              focusNode: _model.portionFocusNode,
                                                                              autofocus: false,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                isDense: true,
                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                                hintText: 'Enter a number',
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                      color: Color(0xFF949494),
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                    ),
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x80000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x80000000),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                              keyboardType: TextInputType.number,
                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                              validator: _model.portionTextControllerValidator.asValidator(context),
                                                                              inputFormatters: [
                                                                                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Portion Size',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.48,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.portionSizeTextController,
                                                                          focusNode:
                                                                              _model.portionSizeFocusNode,
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                true,
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                ),
                                                                            hintText:
                                                                                'plates, bowls, tbsp',
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  color: Color(0xFF949494),
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                          maxLength:
                                                                              20,
                                                                          buildCounter: (context, {required currentLength, required isFocused, maxLength}) =>
                                                                              null,
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          validator: _model
                                                                              .portionSizeTextControllerValidator
                                                                              .asValidator(context),
                                                                          inputFormatters: [
                                                                            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 16.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: FFButtonWidget(
                                                    onPressed:
                                                        !_model.isFoodAdded
                                                            ? null
                                                            : () async {
                                                                logFirebaseEvent(
                                                                    'FOOD_TRACKER_ADD_ITEM_BTN_ON_TAP');
                                                                if (_model.foodItemTextController
                                                                            .text !=
                                                                        '') {
                                                                  if (_model
                                                                          .isEditMode ==
                                                                      true) {
                                                                    FFAppState()
                                                                        .updateMealListStruct(
                                                                      (e) => e
                                                                        ..updateMeals(
                                                                          (e) => e[
                                                                              _model.selectedIndex!]
                                                                            ..mealTime =
                                                                                functions.convertLocalDateTimeToUtcMilliseconds(_model.mealTime!)
                                                                            ..updateItems(
                                                                              (e) => e[_model.foodIndex!]
                                                                                ..foodItem = _model.foodItemTextController.text
                                                                                ..portionSize = _model.portionSizeTextController.text
                                                                                ..portion = _model.portionTextController.text,
                                                                            ),
                                                                        ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    _model.isEditMode =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    FFAppState()
                                                                        .updateMealListStruct(
                                                                      (e) => e
                                                                        ..updateMeals(
                                                                          (e) => e[_model
                                                                              .selectedIndex!]
                                                                            ..updateItems(
                                                                              (e) => e.add(MealItemStruct(
                                                                                foodItem: _model.foodItemTextController.text,
                                                                                portionSize: _model.portionSizeTextController.text,
                                                                                portion: _model.portionTextController.text,
                                                                              )),
                                                                            )
                                                                            ..mealTime =
                                                                                functions.convertLocalDateTimeToUtcMilliseconds(_model.mealTime!),
                                                                        ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .foodItemTextController
                                                                        ?.clear();
                                                                    _model
                                                                        .portionTextController
                                                                        ?.clear();
                                                                    _model
                                                                        .portionSizeTextController
                                                                        ?.clear();
                                                                  });
                                                                  _model.isFoodAdded =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                    text: _model.isEditMode
                                                        ? 'Update item'
                                                        : 'Add item',
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.92,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState()
                                                            .theme
                                                            .primaryColor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      disabledColor:
                                                          Color(0xFFEEEEEE),
                                                      disabledTextColor:
                                                          Color(0xFF949494),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 16.0)),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      'Added food items (${FFAppState().mealList.meals.elementAtOrNull(_model.selectedIndex!)?.items.length.toString()})',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final food = FFAppState()
                                                              .mealList
                                                              .meals
                                                              .elementAtOrNull(
                                                                  _model
                                                                      .selectedIndex!)
                                                              ?.items
                                                              .toList() ??
                                                          [];

                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children:
                                                              List.generate(
                                                                  food.length,
                                                                  (foodIndex) {
                                                            final foodItem =
                                                                food[foodIndex];
                                                            return Container(
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFFDFDFDF),
                                                                  width: 0.5,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Opacity(
                                                                              opacity: 0.4,
                                                                              child: Icon(
                                                                                FFIcons.kfood,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 16.0,
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.2,
                                                                              decoration: BoxDecoration(),
                                                                              child: Text(
                                                                                foodItem.foodItem,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Opacity(
                                                                              opacity: 0.4,
                                                                              child: Icon(
                                                                                FFIcons.kportion,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 16.0,
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.2,
                                                                              decoration: BoxDecoration(),
                                                                              child: Text(
                                                                                '${foodItem.portion} ${foodItem.portionSize}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 32.0)),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('FOOD_TRACKER_Container_qza80ezw_ON_TAP');
                                                                            safeSetState(() {
                                                                              _model.foodItemTextController?.text = foodItem.foodItem;
                                                                            });
                                                                            safeSetState(() {
                                                                              _model.portionTextController?.text = foodItem.portion;
                                                                            });
                                                                            safeSetState(() {
                                                                              _model.portionSizeTextController?.text = foodItem.portionSize;
                                                                            });
                                                                            _model.isEditMode =
                                                                                true;
                                                                            _model.foodIndex =
                                                                                foodIndex;
                                                                            _model.isFoodAdded =
                                                                                true;
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                32.0,
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x255D6A85),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            child:
                                                                                Icon(
                                                                              FFIcons.kedit,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 16.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('FOOD_TRACKER_Container_am60boc8_ON_TAP');
                                                                            if (_model.foodIndex ==
                                                                                foodIndex) {
                                                                              safeSetState(() {
                                                                                _model.foodItemTextController?.clear();
                                                                                _model.portionTextController?.clear();
                                                                                _model.portionSizeTextController?.clear();
                                                                              });
                                                                              _model.isEditMode = false;
                                                                              _model.isFoodAdded = false;
                                                                              safeSetState(() {});
                                                                            }
                                                                            FFAppState().updateMealListStruct(
                                                                              (e) => e
                                                                                ..updateMeals(
                                                                                  (e) => e[_model.selectedIndex!]
                                                                                    ..updateItems(
                                                                                      (e) => e.removeAt(foodIndex),
                                                                                    ),
                                                                                ),
                                                                            );
                                                                            safeSetState(() {});
                                                                            if (FFAppState().mealList.meals.elementAtOrNull(_model.selectedIndex!)?.items.length ==
                                                                                0) {
                                                                              FFAppState().updateMealListStruct(
                                                                                (e) => e
                                                                                  ..updateMeals(
                                                                                    (e) => e[_model.selectedIndex!]..mealTime = null,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                              _model.mealTime = getCurrentTimestamp;
                                                                              _model.isEditMode = false;
                                                                              safeSetState(() {});
                                                                              safeSetState(() {
                                                                                _model.foodItemTextController?.clear();
                                                                                _model.portionTextController?.clear();
                                                                                _model.portionSizeTextController?.clear();
                                                                              });
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                32.0,
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x255D6A85),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            child:
                                                                                Icon(
                                                                              FFIcons.ktrash,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 16.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 6.0)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }).divide(SizedBox(
                                                                  height: 5.0)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Fetcing Last entered food...',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
