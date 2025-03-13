import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/not_found_component/not_found_component_widget.dart';
import '/pages/components/micro_components/vitals_component/goal_card/goal_card_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'goal_component_model.dart';
export 'goal_component_model.dart';

class GoalComponentWidget extends StatefulWidget {
  const GoalComponentWidget({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<GoalComponentWidget> createState() => _GoalComponentWidgetState();
}

class _GoalComponentWidgetState extends State<GoalComponentWidget> {
  late GoalComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GOAL_COMPONENT_GoalComponent_ON_INIT_STA');
      await Future.wait([
        Future(() async {
          _model.apiResult5vl = await GetGoalsCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.apiResult5vl?.succeeded ?? true)) {
            _model.goals = (getJsonField(
              (_model.apiResult5vl?.jsonBody ?? ''),
              r'''$.data''',
              true,
            )!
                    .toList()
                    .map<TargetStruct?>(TargetStruct.maybeFromMap)
                    .toList() as Iterable<TargetStruct?>)
                .withoutNulls
                .toList()
                .cast<TargetStruct>();
            _model.isGoalLoaded = true;
            safeSetState(() {});
          }
        }),
        Future(() async {
          _model.vitalsResp = await VitalsCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.vitalsResp?.succeeded ?? true)) {
            _model.isVitalLoaded = true;
            safeSetState(() {});
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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (_model.isGoalLoaded && _model.isVitalLoaded)
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: Color(0x275D6A85),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'My Goals',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      if (_model.goals.isNotEmpty)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'GOAL_COMPONENT_COMP_Row_9oj5tne5_ON_TAP');
                            if (FFAppState().quotas.quotas.addVitals > 0) {
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
                                }.withoutNulls,
                              );
                            } else {
                              await action_blocks.doSubscription(context);
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'View all',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: valueOrDefault<Color>(
                                  FFAppState().theme.primaryColor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 24.0,
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final goal = (getJsonField(
                              (_model.apiResult5vl?.jsonBody ?? ''),
                              r'''$.data''',
                              true,
                            )
                                    ?.toList()
                                    .map<TargetStruct?>(
                                        TargetStruct.maybeFromMap)
                                    .toList() as Iterable<TargetStruct?>)
                                .withoutNulls
                                .toList() ??
                            [];
                        if (goal.isEmpty) {
                          return NotFoundComponentWidget(
                            isGoal: true,
                            subTitle: 'You have not set goals yet.',
                            buttonTitle: 'Set Goals',
                          );
                        }

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(goal.length, (goalIndex) {
                              final goalItem = goal[goalIndex];
                              return Container(
                                decoration: BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'GOAL_COMPONENT_Container_k10gzl0g_ON_TAP');
                                    if (FFAppState().quotas.quotas.addVitals >
                                        0) {
                                      FFAppState()
                                          .clearFetchVitlHistoryQueryCache();

                                      context.pushNamed(
                                        SetgoalWidget.routeName,
                                        queryParameters: {
                                          'vitalName': serializeParam(
                                            goalItem.vitalType,
                                            ParamType.String,
                                          ),
                                          'isFromGoal': serializeParam(
                                            true,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      await action_blocks.doSubscription(
                                        context,
                                        parameterIds: FFAppState().planIds,
                                      );
                                    }
                                  },
                                  child: GoalCardWidget(
                                    key: Key(
                                        'Keyk10_${goalIndex}_of_${goal.length}'),
                                    vital: functions.findVital(
                                        goalItem,
                                        VitalsModelStruct.maybeFromMap(
                                                (_model.vitalsResp?.jsonBody ??
                                                    ''))!
                                            .vitals
                                            .toList()),
                                    goal: goalItem.value,
                                  ),
                                ),
                              );
                            }).divide(SizedBox(width: 10.0)),
                          ),
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        if (!_model.isGoalLoaded && !_model.isVitalLoaded)
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                'Fetching Goals...',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ),
      ],
    );
  }
}
