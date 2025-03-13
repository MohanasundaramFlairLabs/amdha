import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/consutation_history_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_consultation_history_model.dart';
export 'all_consultation_history_model.dart';

class AllConsultationHistoryWidget extends StatefulWidget {
  const AllConsultationHistoryWidget({super.key});

  static String routeName = 'AllConsultationHistory';
  static String routePath = '/allConsultationHistory';

  @override
  State<AllConsultationHistoryWidget> createState() =>
      _AllConsultationHistoryWidgetState();
}

class _AllConsultationHistoryWidgetState
    extends State<AllConsultationHistoryWidget> {
  late AllConsultationHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllConsultationHistoryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ALL_CONSULTATION_HISTORY_AllConsultation');
      _model.apiResult7e3 =
          await ConnectionsGroup.getAllConsultationHistoryCall.call(
        userId: FFAppState().userId,
        baseurl: FFAppState().baseUrl,
      );

      if ((_model.apiResult7e3?.succeeded ?? true)) {
        _model.historyList = (getJsonField(
          (_model.apiResult7e3?.jsonBody ?? ''),
          r'''$.data''',
          true,
        )!
                .toList()
                .map<HistoryModelStruct?>(HistoryModelStruct.maybeFromMap)
                .toList() as Iterable<HistoryModelStruct?>)
            .withoutNulls
            .toList()
            .cast<HistoryModelStruct>();
        safeSetState(() {});
      } else {
        await action_blocks.sessionExpired(
          context,
          statusCode: (_model.apiResult7e3?.statusCode ?? 200),
        );
      }
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
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
                              'ALL_CONSULTATION_HISTORY_Container_dl97j');

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
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Consultation History',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
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
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final history = _model.historyList.toList();
                        if (history.isEmpty) {
                          return NoDataComponentWidget(
                            name: 'Consultaion',
                          );
                        }

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(history.length, (historyIndex) {
                              final historyItem = history[historyIndex];
                              return Visibility(
                                visible: (historyItem.status == 'Completed') ||
                                    (historyItem.status == 'Cancelled'),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ALL_CONSULTATION_HISTORY_Container_vz140');
                                    if (historyItem.status == 'Completed') {
                                      context.pushNamed(
                                        DetailedConsultationHistoryWidget
                                            .routeName,
                                        queryParameters: {
                                          'data': serializeParam(
                                            historyItem,
                                            ParamType.DataStruct,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  child: ConsutationHistoryCardWidget(
                                    key: Key(
                                        'Keyvz1_${historyIndex}_of_${history.length}'),
                                    data: historyItem,
                                  ),
                                ),
                              );
                            })
                                    .divide(
                                      SizedBox(height: 10.0),
                                      filterFn: (historyIndex) {
                                        final historyItem =
                                            history[historyIndex];
                                        return (historyItem.status ==
                                                'Completed') ||
                                            (historyItem.status == 'Cancelled');
                                      },
                                    )
                                    .addToStart(SizedBox(height: 20.0))
                                    .addToEnd(SizedBox(height: 10.0)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
