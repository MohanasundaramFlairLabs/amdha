import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/micro_components/vitals_component/status_card/status_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_results_model.dart';
export 'scan_results_model.dart';

class ScanResultsWidget extends StatefulWidget {
  const ScanResultsWidget({
    super.key,
    required this.vitals,
    required this.goHomeCallBack,
  });

  final List<VitalsStruct>? vitals;
  final Future Function()? goHomeCallBack;

  @override
  State<ScanResultsWidget> createState() => _ScanResultsWidgetState();
}

class _ScanResultsWidgetState extends State<ScanResultsWidget> {
  late ScanResultsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanResultsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SCAN_RESULTS_ScanResults_ON_INIT_STATE');
      _model.vitalResponse = await VitalsCall.call(
        userId: FFAppState().userId,
        baseurl: FFAppState().baseUrl,
      );
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

    return Container(
      height: MediaQuery.sizeOf(context).height -
          FFAppState().statusBarHeight -
          FFAppState().navBarHeight,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
      ),
      child: Stack(
        alignment: AlignmentDirectional(1.0, 1.0),
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 56.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  'Results',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Divider(
                height: 0.0,
                thickness: 0.25,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState().fetchVitalsList(
                            requestFn: () => VitalsCall.call(
                              userId: FFAppState().userId,
                              baseurl: FFAppState().baseUrl,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final listViewVitalsResponse = snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final vital = widget.vitals!.toList();

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    20.0,
                                    0,
                                    0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: vital.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 10.0),
                                  itemBuilder: (context, vitalIndex) {
                                    final vitalItem = vital[vitalIndex];
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: StatusCardWidget(
                                        key: Key(
                                            'Keys2r_${vitalIndex}_of_${vital.length}'),
                                        vital: vitalItem,
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ].addToStart(SizedBox(height: 20.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('SCAN_RESULTS_COMP_GO_HOME_BTN_ON_TAP');
                    await widget.goHomeCallBack?.call();
                  },
                  text: 'Go Home',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: valueOrDefault<Color>(
                      FFAppState().theme.primaryColor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
