import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/plan_card_widget.dart';
import '/components/plan_purchase_card_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'plan_details_model.dart';
export 'plan_details_model.dart';

class PlanDetailsWidget extends StatefulWidget {
  const PlanDetailsWidget({super.key});

  static String routeName = 'PlanDetails';
  static String routePath = '/planDetails';

  @override
  State<PlanDetailsWidget> createState() => _PlanDetailsWidgetState();
}

class _PlanDetailsWidgetState extends State<PlanDetailsWidget>
    with TickerProviderStateMixin {
  late PlanDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PLAN_DETAILS_PlanDetails_ON_INIT_STATE');
      await Future.wait([
        Future(() async {
          _model.allPlans = await SubscriptionGroup.getAllPlansCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.allPlans?.succeeded ?? true)) {
            _model.isLoading = false;
            safeSetState(() {});
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.allPlans?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {}),
      ]);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
              if (!_model.isLoading) {
                return Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Row(
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
                                          'PLAN_DETAILS_Container_h4vcbnnm_ON_TAP');

                                      context.pushNamed(
                                        HomePageWidget.routeName,
                                        queryParameters: {
                                          'index': serializeParam(
                                            0,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Subscriptions',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                                Container(
                                  width: 60.0,
                                  height: 56.0,
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible: AllPlansStruct.maybeFromMap(
                                                (_model.allPlans?.jsonBody ??
                                                    ''))!
                                            .subscriptions
                                            .where((e) => e.status == 'expired')
                                            .toList()
                                            .length >
                                        0,
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PLAN_DETAILS_PAGE_Icon_ertvvtsg_ON_TAP');

                                        context.pushNamed(
                                          ExpiredPlansWidget.routeName,
                                          queryParameters: {
                                            'subscription': serializeParam(
                                              AllPlansStruct.maybeFromMap(
                                                      (_model.allPlans
                                                              ?.jsonBody ??
                                                          ''))
                                                  ?.subscriptions,
                                              ParamType.DataStruct,
                                              isList: true,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Icon(
                                        Icons.history_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
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
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF034572),
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: FlutterFlowButtonTabBar(
                                      useToggleButtonStyle: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      unselectedLabelStyle: FlutterFlowTheme.of(
                                              context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      labelColor: valueOrDefault<Color>(
                                        FFAppState().theme.secondaryColor,
                                        FlutterFlowTheme.of(context).secondary,
                                      ),
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      backgroundColor: Color(0xFF034572),
                                      unselectedBackgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderColor: Color(0xFF034572),
                                      unselectedBorderColor: Color(0xFF034572),
                                      borderWidth: 0.0,
                                      borderRadius: 0.0,
                                      elevation: 0.0,
                                      buttonMargin:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8.0, 0.0, 8.0, 0.0),
                                      padding: EdgeInsets.all(6.0),
                                      tabs: [
                                        Tab(
                                          text: 'Active',
                                        ),
                                        Tab(
                                          text: 'Available',
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final subscription = AllPlansStruct
                                                          .maybeFromMap((_model
                                                                  .allPlans
                                                                  ?.jsonBody ??
                                                              ''))
                                                      ?.subscriptions
                                                      .toList() ??
                                                  [];
                                              if (subscription.isEmpty) {
                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  child: NoDataComponentWidget(
                                                    name: 'Subscription',
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    textColor:
                                                        valueOrDefault<Color>(
                                                      FFAppState()
                                                          .theme
                                                          .secondaryColor,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                    ),
                                                  ),
                                                );
                                              }

                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                          subscription.length,
                                                          (subscriptionIndex) {
                                                    final subscriptionItem =
                                                        subscription[
                                                            subscriptionIndex];
                                                    return Visibility(
                                                      visible: subscriptionItem
                                                              .status ==
                                                          'active',
                                                      child: PlanCardWidget(
                                                        key: Key(
                                                            'Keyz2u_${subscriptionIndex}_of_${subscription.length}'),
                                                        subscription:
                                                            subscriptionItem,
                                                      ),
                                                    );
                                                  })
                                                      .divide(
                                                        SizedBox(height: 20.0),
                                                        filterFn:
                                                            (subscriptionIndex) {
                                                          final subscriptionItem =
                                                              subscription[
                                                                  subscriptionIndex];
                                                          return subscriptionItem
                                                                  .status ==
                                                              'active';
                                                        },
                                                      )
                                                      .addToStart(SizedBox(
                                                          height: 20.0))
                                                      .addToEnd(SizedBox(
                                                          height: 20.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final plan = AllPlansStruct
                                                          .maybeFromMap((_model
                                                                  .allPlans
                                                                  ?.jsonBody ??
                                                              ''))
                                                      ?.plans
                                                      .toList() ??
                                                  [];
                                              if (plan.isEmpty) {
                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  child: NoDataComponentWidget(
                                                    name: 'Subscription',
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    textColor:
                                                        valueOrDefault<Color>(
                                                      FFAppState()
                                                          .theme
                                                          .secondaryColor,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                    ),
                                                  ),
                                                );
                                              }

                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children:
                                                      List.generate(
                                                              plan.length,
                                                              (planIndex) {
                                                    final planItem =
                                                        plan[planIndex];
                                                    return PlanPurchaseCardWidget(
                                                      key: Key(
                                                          'Keylz9_${planIndex}_of_${plan.length}'),
                                                      plandetails: planItem,
                                                      userName: FFAppState()
                                                          .userDetails
                                                          .firstName,
                                                      phoneNumber: FFAppState()
                                                          .userDetails
                                                          .phoneNumber,
                                                      subscriptionSuccessCallback:
                                                          (transactionId) async {
                                                        logFirebaseEvent(
                                                            'PLAN_DETAILS_Container_lz9xq6xe_CALLBACK');
                                                        _model.apiResulty64 =
                                                            await SubscriptionGroup
                                                                .transactionCall
                                                                .call(
                                                          userId: FFAppState()
                                                              .userId,
                                                          date: getCurrentTimestamp
                                                              .millisecondsSinceEpoch
                                                              .toString(),
                                                          transactionId:
                                                              transactionId,
                                                          status: 'success',
                                                          baseurl: FFAppState()
                                                              .baseUrl,
                                                        );

                                                        if ((_model.apiResulty64
                                                                ?.succeeded ??
                                                            true)) {
                                                          _model.apiResultin7 =
                                                              await SubscriptionGroup
                                                                  .submitSubscriptionCall
                                                                  .call(
                                                            userId: FFAppState()
                                                                .userId,
                                                            planId:
                                                                planItem.planId,
                                                            baseurl:
                                                                FFAppState()
                                                                    .baseUrl,
                                                          );

                                                          if ((_model
                                                                  .apiResultin7
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.quotas =
                                                                await SubscriptionGroup
                                                                    .getQuotasCall
                                                                    .call(
                                                              userId:
                                                                  FFAppState()
                                                                      .userId,
                                                              baseurl:
                                                                  FFAppState()
                                                                      .baseUrl,
                                                            );

                                                            if ((_model.quotas
                                                                    ?.succeeded ??
                                                                true)) {
                                                              FFAppState()
                                                                      .quotas =
                                                                  QuotaModelStruct
                                                                      .maybeFromMap((_model
                                                                              .quotas
                                                                              ?.jsonBody ??
                                                                          ''))!;
                                                              safeSetState(
                                                                  () {});

                                                              context.pushNamed(
                                                                  PlanDetailsWidget
                                                                      .routeName);
                                                            }
                                                          }
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                    );
                                                  })
                                                          .divide(SizedBox(
                                                              height: 20.0))
                                                          .addToStart(
                                                              SizedBox(
                                                                  height: 20.0))
                                                          .addToEnd(SizedBox(
                                                              height: 20.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF034572),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Fetching Details...',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
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
