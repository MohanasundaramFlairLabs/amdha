import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/interventions_widget.dart';
import '/components/p_p_subscribe_card_widget.dart';
import '/components/wellbeing_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/dashboard_component/remaining_scan_component/remaining_scan_component_widget.dart';
import '/pages/components/micro_components/dashboard_component/subscribe_component/subscribe_component_widget.dart';
import '/pages/components/micro_components/medication_components/upcoming_medication_component/upcoming_medication_component_widget.dart';
import '/pages/components/micro_components/vitals_component/goal_component/goal_component_widget.dart';
import '/pages/components/shimmer_components/dashboard_shimmer_component/dashboard_shimmer_component_widget.dart';
import '/pregnancy_program/stages_card/stages_card_widget.dart';
import '/senior_wellness/c_t_afor_food_exercise/c_t_afor_food_exercise_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_component_model.dart';
export 'home_component_model.dart';

class HomeComponentWidget extends StatefulWidget {
  const HomeComponentWidget({
    super.key,
    this.doScan,
    this.program,
  });

  final Future Function()? doScan;
  final ProgramsStruct? program;

  @override
  State<HomeComponentWidget> createState() => _HomeComponentWidgetState();
}

class _HomeComponentWidgetState extends State<HomeComponentWidget> {
  late HomeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_COMPONENT_HomeComponent_ON_INIT_STA');
      _model.pregnancyProgram = widget.program;
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          _model.well = await HocGroup.wellbeingScoreCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.well?.succeeded ?? true)) {
            _model.wellbeing =
                WellbeingStruct.maybeFromMap((_model.well?.jsonBody ?? ''))
                    ?.wellbeingScore;
            safeSetState(() {});
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.well?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {
          _model.quotaResponse = await SubscriptionGroup.getQuotasCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.quotaResponse?.succeeded ?? true)) {
            _model.quotas = QuotaModelStruct.maybeFromMap(
                (_model.quotaResponse?.jsonBody ?? ''));
            safeSetState(() {});
            FFAppState().quotas = QuotaModelStruct.maybeFromMap(
                (_model.quotaResponse?.jsonBody ?? ''))!;
            safeSetState(() {});
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.quotaResponse?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {
          _model.freescanResponse =
              await SubscriptionGroup.checkFreeScanCall.call(
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.freescanResponse?.succeeded ?? true)) {
            _model.freeScanDetails = QuotaModelStruct.maybeFromMap(
                (_model.freescanResponse?.jsonBody ?? ''));
            safeSetState(() {});
            FFAppState().isFreeScanAvailable =
                _model.freeScanDetails?.quotas.careplixScan == 1;
            safeSetState(() {});
            await Future.delayed(const Duration(milliseconds: 1000));
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.freescanResponse?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {
          _model.listofConnections =
              await ConnectionsGroup.getUpcomingConnectionsCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.listofConnections?.succeeded ?? true)) {
            _model.connectionsList = ((_model.listofConnections?.jsonBody ?? '')
                    .toList()
                    .map<ConnectionsModelStruct?>(
                        ConnectionsModelStruct.maybeFromMap)
                    .toList() as Iterable<ConnectionsModelStruct?>)
                .withoutNulls
                .toList()
                .cast<ConnectionsModelStruct>();
            safeSetState(() {});
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.listofConnections?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {
          _model.planresponse = await SubscriptionGroup.plansCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.planresponse?.succeeded ?? true)) {
            await actions.savePlanIds(
              (_model.planresponse?.jsonBody ?? ''),
            );
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.planresponse?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {
          _model.criticalTaskResult = await TaskGroup.getTaskCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
            startDate: functions
                .previousMorningDate(getCurrentTimestamp)
                .millisecondsSinceEpoch
                .toString(),
          );

          if ((_model.criticalTaskResult?.succeeded ?? true)) {
            _model.criticalTaskFound = TaskModelStruct.maybeFromMap(
                    (_model.criticalTaskResult?.jsonBody ?? ''))!
                .tasks
                .where((e) =>
                    (e.config.critical == true) && (e.status == 'pending'))
                .toList()
                .isNotEmpty;
            safeSetState(() {});
          }
        }),
      ]);
      _model.isLoading = true;
      _model.updatePage(() {});
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

    return Builder(
      builder: (context) {
        if (_model.isLoading) {
          return Container(
            height: MediaQuery.sizeOf(context).height -
                FFAppState().statusBarHeight -
                FFAppState().navBarHeight,
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                FFAppState().theme.backgroudPrimaryColor,
                FlutterFlowTheme.of(context).secondary,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'HOME_COMPONENT_Container_s47kbuc2_ON_TAP');
                            if (_model.connectionsList.length > 0) {
                              context.goNamed(
                                UpcomingConsultationPageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );
                            }
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: _model.connectionsList.length > 0
                                  ? Color(0xFFF6861F)
                                  : Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 20.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.connectionsList.length
                                              .toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: _model.connectionsList
                                                          .length >
                                                      0
                                                  ? Color(0xFFF6861F)
                                                  : Color(0xFFD9D9D9),
                                              fontSize: 14.0,
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
                                  ),
                                ),
                                Text(
                                  'View Consultations',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nevermind',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Nevermind'),
                                      ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                        if ((widget.program?.programName == 'Pregnancy') &&
                            (widget.program?.paymentStatus == false))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOME_COMPONENT_Container_u2wdr72v_ON_TAP');

                                context.pushNamed(
                                  SubscriptionScreenWidget.routeName,
                                  queryParameters: {
                                    'isFromPregnancyProgram': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: wrapWithModel(
                                model: _model.pPSubscribeCardModel,
                                updateCallback: () => safeSetState(() {}),
                                child: PPSubscribeCardWidget(
                                  doctorName: FFAppState()
                                      .userDetails
                                      .providers
                                      .where((e) =>
                                          e.id == widget.program?.doctorId)
                                      .toList()
                                      .firstOrNull
                                      ?.firstName,
                                ),
                              ),
                            ),
                          ),
                        if ((widget.program?.programName == 'Pregnancy') &&
                            (widget.program?.paymentStatus == true))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOME_COMPONENT_Container_6j1g9qe7_ON_TAP');

                                context.pushNamed(
                                  PPDetailedViewWidget.routeName,
                                  queryParameters: {
                                    'program': serializeParam(
                                      widget.program,
                                      ParamType.DataStruct,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              child: wrapWithModel(
                                model: _model.stagesCardModel,
                                updateCallback: () => safeSetState(() {}),
                                child: StagesCardWidget(
                                  program: widget.program,
                                ),
                              ),
                            ),
                          ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.wellbeingComponentModel,
                            updateCallback: () => safeSetState(() {}),
                            child: WellbeingComponentWidget(
                              lastUpdate: (_model.wellbeing != null) &&
                                      (_model.wellbeing?.date != null &&
                                          _model.wellbeing?.date != '')
                                  ? _model.wellbeing!.date
                                  : (""),
                              wellbeingScore: (_model.wellbeing != null) &&
                                      (_model.wellbeing?.value != null &&
                                          _model.wellbeing?.value != '')
                                  ? (int.parse(_model.wellbeing!.value))
                                  : (int.parse("0")),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: wrapWithModel(
                              model: _model.cTAforFoodExerciseModel,
                              updateCallback: () => safeSetState(() {}),
                              child: CTAforFoodExerciseWidget(),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 1.6,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: PageView(
                                    controller: _model.pageViewController ??=
                                        PageController(initialPage: 0),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_COMPONENT_Image_gamx8twh_ON_TAP');
                                            if (FFAppState()
                                                    .quotas
                                                    .quotas
                                                    .videoCall >
                                                0) {
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                HomePageWidget.routeName,
                                                queryParameters: {
                                                  'index': serializeParam(
                                                    3,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              await action_blocks
                                                  .doSubscription(
                                                context,
                                                parameterIds:
                                                    FFAppState().planIds,
                                              );
                                            }
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            child: Image.asset(
                                              'assets/images/doctorban.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_COMPONENT_Image_ahwusod1_ON_TAP');
                                            if (FFAppState()
                                                    .quotas
                                                    .quotas
                                                    .addVitals >
                                                0) {
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                HomePageWidget.routeName,
                                                queryParameters: {
                                                  'index': serializeParam(
                                                    4,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              await action_blocks
                                                  .doSubscription(
                                                context,
                                                parameterIds:
                                                    FFAppState().planIds,
                                              );
                                            }
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            child: Image.asset(
                                              'assets/images/Banner_rec_3.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_COMPONENT_Image_9ho9lu7k_ON_TAP');
                                            if (FFAppState()
                                                    .quotas
                                                    .quotas
                                                    .addVitals >
                                                0) {
                                              context.pushNamed(
                                                  EducationPageWidget
                                                      .routeName);
                                            } else {
                                              await action_blocks
                                                  .doSubscription(
                                                context,
                                                parameterIds:
                                                    FFAppState().planIds,
                                              );
                                            }
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            child: Image.asset(
                                              'assets/images/Property_1=Banner_2.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_COMPONENT_Image_f57gwzd4_ON_TAP');
                                            if (FFAppState()
                                                    .quotas
                                                    .quotas
                                                    .addVitals >
                                                0) {
                                              context.pushNamed(
                                                  JournalHomePageWidget
                                                      .routeName);

                                              Navigator.pop(context);
                                            } else {
                                              await action_blocks
                                                  .doSubscription(
                                                context,
                                                parameterIds:
                                                    FFAppState().planIds,
                                              );
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            child: Image.asset(
                                              'assets/images/Journal-CTA.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 5.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
                                          PageController(initialPage: 0),
                                      count: 4,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) async {
                                        await _model.pageViewController!
                                            .animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                        safeSetState(() {});
                                      },
                                      effect: smooth_page_indicator.SlideEffect(
                                        spacing: 8.0,
                                        radius: 1.0,
                                        dotWidth: 8.0,
                                        dotHeight: 8.0,
                                        dotColor: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        activeDotColor: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        paintStyle: PaintingStyle.stroke,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_model.criticalTaskFound)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.interventionsModel,
                              updateCallback: () => safeSetState(() {}),
                              child: InterventionsWidget(
                                tasks: TaskModelStruct.maybeFromMap(
                                        (_model.criticalTaskResult?.jsonBody ??
                                            ''))!
                                    .tasks
                                    .where((e) =>
                                        (e.config.critical == true) &&
                                        (e.status == 'pending'))
                                    .toList(),
                              ),
                            ),
                          ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.goalComponentModel,
                            updateCallback: () => safeSetState(() {}),
                            child: GoalComponentWidget(),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (FFAppState().isFreeScanAvailable ||
                                  (((_model.quotas?.quotas.careplixScan != null
                                              ? _model
                                                  .quotas!.quotas.careplixScan
                                              : 0) >
                                          0) &&
                                      (FFAppState().quotas.quotas.careplixScan >
                                          0)))
                                wrapWithModel(
                                  model: _model.remainingScanComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: RemainingScanComponentWidget(
                                    count:
                                        _model.quotas?.quotas.careplixScan !=
                                                null
                                            ? _model.quotas!.quotas.careplixScan
                                            : 0,
                                    doScan: () async {
                                      logFirebaseEvent(
                                          'HOME_COMPONENT_Container_wugda2m0_CALLBA');
                                      await widget.doScan?.call();
                                    },
                                  ),
                                ),
                              if ((_model.freeScanDetails?.quotas
                                          .careplixScan ==
                                      0) &&
                                  (_model.quotas?.quotas.careplixScan == 0))
                                wrapWithModel(
                                  model: _model.subscribeComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SubscribeComponentWidget(
                                    count: _model.quotas?.quotas.careplixScan,
                                    doSubscribe: () async {
                                      logFirebaseEvent(
                                          'HOME_COMPONENT_Container_ehg4v29y_CALLBA');
                                      await action_blocks
                                          .doSubscription(context);
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.upcomingMedicationComponentModel,
                            updateCallback: () => safeSetState(() {}),
                            child: UpcomingMedicationComponentWidget(),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 10.0))
                          .addToStart(SizedBox(height: 10.0))
                          .addToEnd(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return wrapWithModel(
            model: _model.dashboardShimmerComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: DashboardShimmerComponentWidget(),
          );
        }
      },
    );
  }
}
