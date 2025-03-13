import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_widget.dart';
import '/components/plan_purchase_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subscription_screen_model.dart';
export 'subscription_screen_model.dart';

class SubscriptionScreenWidget extends StatefulWidget {
  const SubscriptionScreenWidget({
    super.key,
    bool? isFromPregnancyProgram,
  }) : this.isFromPregnancyProgram = isFromPregnancyProgram ?? false;

  final bool isFromPregnancyProgram;

  static String routeName = 'SubscriptionScreen';
  static String routePath = '/subscriptionScreen';

  @override
  State<SubscriptionScreenWidget> createState() =>
      _SubscriptionScreenWidgetState();
}

class _SubscriptionScreenWidgetState extends State<SubscriptionScreenWidget> {
  late SubscriptionScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SUBSCRIPTION_SCREEN_SubscriptionScreen_O');
      _model.isLoading = false;
      safeSetState(() {});
      await Future.wait([
        Future(() async {}),
        Future(() async {
          _model.allPlan = await SubscriptionGroup.getAllPlansCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.allPlan?.succeeded ?? true)) {
            _model.isPlanReceived = true;
            safeSetState(() {});
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.allPlan?.statusCode ?? 200),
            );
          }
        }),
      ]);
    });

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
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 46.0,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'SUBSCRIPTION_SCREEN_arrow_back_ios_ICN_O');
                            context.safePop();
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Subscriptions',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 20.0,
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
                ),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Text(
                      'Access all your health data at the touch of a button.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      height: MediaQuery.sizeOf(context).height * 0.72,
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final listofplans = AllPlansStruct.maybeFromMap(
                                      (_model.allPlan?.jsonBody ?? ''))
                                  ?.plans
                                  .toList() ??
                              [];
                          if (listofplans.isEmpty) {
                            return LoadingWidget();
                          }

                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(listofplans.length,
                                      (listofplansIndex) {
                                final listofplansItem =
                                    listofplans[listofplansIndex];
                                return Visibility(
                                  visible: widget.isFromPregnancyProgram
                                      ? (listofplansItem.planName ==
                                          'Pregnancy Program')
                                      : true,
                                  child: PlanPurchaseCardWidget(
                                    key: Key(
                                        'Keydr6_${listofplansIndex}_of_${listofplans.length}'),
                                    plandetails: listofplansItem,
                                    userName:
                                        FFAppState().userDetails.firstName,
                                    phoneNumber:
                                        FFAppState().userDetails.phoneNumber,
                                    subscriptionSuccessCallback:
                                        (transactionId) async {
                                      logFirebaseEvent(
                                          'SUBSCRIPTION_SCREEN_Container_dr6wi24j_C');
                                      _model.isLoading = true;
                                      safeSetState(() {});
                                      _model.apiResultrazor =
                                          await SubscriptionGroup
                                              .transactionCall
                                              .call(
                                        userId: FFAppState().userId,
                                        transactionId: transactionId,
                                        status: 'success',
                                        date: getCurrentTimestamp
                                            .millisecondsSinceEpoch
                                            .toString(),
                                        baseurl: FFAppState().baseUrl,
                                      );

                                      if ((_model.apiResultrazor?.succeeded ??
                                          true)) {
                                        _model.subscriptionResponse2 =
                                            await SubscriptionGroup
                                                .submitSubscriptionCall
                                                .call(
                                          userId: FFAppState().userId,
                                          planId: listofplansItem.planId,
                                          baseurl: FFAppState().baseUrl,
                                        );

                                        if ((_model.subscriptionResponse2
                                                ?.succeeded ??
                                            true)) {
                                          _model.quota = await SubscriptionGroup
                                              .getQuotasCall
                                              .call(
                                            userId: FFAppState().userId,
                                            baseurl: FFAppState().baseUrl,
                                          );

                                          if ((_model.quota?.succeeded ??
                                              true)) {
                                            FFAppState().quotas =
                                                QuotaModelStruct.maybeFromMap(
                                                    (_model.quota?.jsonBody ??
                                                        ''))!;
                                            FFAppState().update(() {});
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
                                              }.withoutNulls,
                                            );
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Payment failed'),
                                                content:
                                                    Text('Please try again'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }

                                        _model.isLoading = false;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                  ),
                                );
                              })
                                  .divide(
                                    SizedBox(height: 10.0),
                                    filterFn: (listofplansIndex) {
                                      final listofplansItem =
                                          listofplans[listofplansIndex];
                                      return widget.isFromPregnancyProgram
                                          ? (listofplansItem.planName ==
                                              'Pregnancy Program')
                                          : true;
                                    },
                                  )
                                  .addToStart(SizedBox(height: 10.0))
                                  .addToEnd(SizedBox(height: 10.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ].addToEnd(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
