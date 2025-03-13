import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/food_tracker/meal_time_edit_component/meal_time_edit_component_widget.dart';
import '/food_tracker/preview_meal_edit_component/preview_meal_edit_component_widget.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'preview_meal_page_model.dart';
export 'preview_meal_page_model.dart';

class PreviewMealPageWidget extends StatefulWidget {
  const PreviewMealPageWidget({super.key});

  static String routeName = 'PreviewMealPage';
  static String routePath = '/previewMealPage';

  @override
  State<PreviewMealPageWidget> createState() => _PreviewMealPageWidgetState();
}

class _PreviewMealPageWidgetState extends State<PreviewMealPageWidget> {
  late PreviewMealPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreviewMealPageModel());

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
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PREVIEW_MEAL_Container_i76b6vw9_ON_TAP');
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                            FoodTrackerPageWidget.routeName);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'PREVIEW_MEAL_Icon_h887m0dx_ON_TAP');

                                              context.pushNamed(
                                                  FoodTrackerPageWidget
                                                      .routeName);
                                            },
                                            child: Icon(
                                              Icons.chevron_left,
                                              color: Color(0xFF242E49),
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Preview meal',
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
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
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
                                          'PREVIEW_MEAL_Container_d9klvw5q_ON_TAP');
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                          FoodTrackerPageWidget.routeName);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Icon(
                                        Icons.close_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
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
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
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
                                  child: Builder(
                                    builder: (context) {
                                      if ((FFAppState()
                                              .mealList
                                              .meals
                                              .firstOrNull!
                                              .items
                                              .isNotEmpty) ||
                                          (FFAppState()
                                              .mealList
                                              .meals
                                              .lastOrNull!
                                              .items
                                              .isNotEmpty) ||
                                          (FFAppState()
                                              .mealList
                                              .meals
                                              .elementAtOrNull(1)!
                                              .items
                                              .isNotEmpty) ||
                                          (FFAppState()
                                              .mealList
                                              .meals
                                              .elementAtOrNull(2)!
                                              .items
                                              .isNotEmpty)) {
                                        return Builder(
                                          builder: (context) {
                                            final meal = FFAppState()
                                                .mealList
                                                .meals
                                                .toList();
                                            if (meal.isEmpty) {
                                              return NoDataComponentWidget(
                                                name: 'meal',
                                              );
                                            }

                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: List.generate(
                                                    meal.length, (mealIndex) {
                                                  final mealItem =
                                                      meal[mealIndex];
                                                  return Visibility(
                                                    visible:
                                                        mealItem.items.length >
                                                            0,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
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
                                                                children: [
                                                                  Text(
                                                                    '${mealItem.mealType} (${mealItem.items.length.toString()})',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'PREVIEW_MEAL_Container_vmyx7ith_ON_TAP');
                                                                        if (mealItem.items.length >
                                                                            0) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 1.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 256.0,
                                                                                    child: MealTimeEditComponentWidget(
                                                                                      selectedIndex: mealIndex,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kedit,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            15.0,
                                                                      ),
                                                                      Text(
                                                                        mealItem.mealTime != ''
                                                                            ? dateTimeFormat(
                                                                                "hh : mm a",
                                                                                functions.convertMillisecondsToDateTime(mealItem.mealTime),
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              )
                                                                            : 'hh : mm',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nevermind',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Nevermind'),
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ],
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final foodItem =
                                                                  mealItem.items
                                                                      .toList();

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    foodItem
                                                                        .length,
                                                                    (foodItemIndex) {
                                                                  final foodItemItem =
                                                                      foodItem[
                                                                          foodItemIndex];
                                                                  return Container(
                                                                    height:
                                                                        48.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFDFDFDF),
                                                                        width:
                                                                            0.5,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Opacity(
                                                                                    opacity: 0.4,
                                                                                    child: Icon(
                                                                                      FFIcons.kfood,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 16.0,
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.3,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Text(
                                                                                      foodItemItem.foodItem,
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
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
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
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Text(
                                                                                      '${foodItemItem.portion} ${foodItemItem.portionSize}',
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
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Builder(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('PREVIEW_MEAL_Container_hxzhwqfb_ON_TAP');
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: AlignmentDirectional(0.0, 1.0).resolve(Directionality.of(context)),
                                                                                          child: GestureDetector(
                                                                                            onTap: () {
                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Container(
                                                                                              height: 355.0,
                                                                                              child: PreviewMealEditComponentWidget(
                                                                                                seletedIndex: mealIndex,
                                                                                                foodIndex: foodItemIndex,
                                                                                                updateAction: () async {
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 32.0,
                                                                                    height: 32.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x255D6A85),
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                    ),
                                                                                    child: Icon(
                                                                                      FFIcons.kedit,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 16.0,
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
                                                                                  logFirebaseEvent('PREVIEW_MEAL_Container_gc4i8518_ON_TAP');
                                                                                  FFAppState().updateMealListStruct(
                                                                                    (e) => e
                                                                                      ..updateMeals(
                                                                                        (e) => e[mealIndex]
                                                                                          ..updateItems(
                                                                                            (e) => e.removeAt(foodItemIndex),
                                                                                          ),
                                                                                      ),
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                  if (mealItem.items.length == 0) {
                                                                                    FFAppState().updateMealListStruct(
                                                                                      (e) => e
                                                                                        ..updateMeals(
                                                                                          (e) => e[mealIndex]..mealTime = null,
                                                                                        ),
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x255D6A85),
                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                  ),
                                                                                  child: Icon(
                                                                                    FFIcons.ktrash,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                }).divide(
                                                                    SizedBox(
                                                                        height:
                                                                            5.0)),
                                                              );
                                                            },
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    ),
                                                  );
                                                }).divide(
                                                  SizedBox(height: 16.0),
                                                  filterFn: (mealIndex) {
                                                    final mealItem =
                                                        meal[mealIndex];
                                                    return mealItem
                                                            .items.length >
                                                        0;
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        return wrapWithModel(
                                          model: _model.noDataComponentModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: NoDataComponentWidget(
                                            name: 'meal',
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((FFAppState()
                              .mealList
                              .meals
                              .firstOrNull!
                              .items
                              .isNotEmpty) ||
                          (FFAppState()
                              .mealList
                              .meals
                              .lastOrNull!
                              .items
                              .isNotEmpty) ||
                          (FFAppState()
                              .mealList
                              .meals
                              .elementAtOrNull(1)!
                              .items
                              .isNotEmpty) ||
                          (FFAppState()
                              .mealList
                              .meals
                              .elementAtOrNull(2)!
                              .items
                              .isNotEmpty))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PREVIEW_MEAL_SAVE_MEALS__CLOSE_BTN_ON_TA');
                                _model.tz = await actions.getLocalTimeZone();
                                _model.apiResult7ha =
                                    await HocGroup.submitFoodTrackerCall.call(
                                  mealsJson: functions.convertFoodtoJson(
                                      FFAppState().mealList.meals.toList()),
                                  userId: FFAppState().userId,
                                  baseurl: FFAppState().baseUrl,
                                  createDate: functions.convertDateTimetoDate(
                                      getCurrentTimestamp),
                                  timeZone: _model.tz,
                                );

                                if ((_model.apiResult7ha?.succeeded ?? true)) {
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
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Unable to Submit'),
                                        content: Text(
                                            (_model.apiResult7ha?.jsonBody ??
                                                    '')
                                                .toString()),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: 'Save Meals & Close',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 42.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  FFAppState().theme.primaryColor,
                                  FlutterFlowTheme.of(context).success,
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
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
      ),
    );
  }
}
