import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/grant_amdha/grant_amdha_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'health_connect_model.dart';
export 'health_connect_model.dart';

class HealthConnectWidget extends StatefulWidget {
  const HealthConnectWidget({super.key});

  static String routeName = 'HealthConnect';
  static String routePath = '/healthConnect';

  @override
  State<HealthConnectWidget> createState() => _HealthConnectWidgetState();
}

class _HealthConnectWidgetState extends State<HealthConnectWidget> {
  late HealthConnectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthConnectModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HEALTH_CONNECT_HealthConnect_ON_INIT_STA');
      _model.permissionStatus = await actions.getVitalsPermission();
      FFAppState().healthToggle = _model.permissionStatus!;
      safeSetState(() {});
      safeSetState(() {
        _model.toggleSwitchValue = FFAppState().healthToggle;
      });
    });

    _model.toggleSwitchValue = FFAppState().healthToggle;
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
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 63.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                  'HEALTH_CONNECT_PAGE_Icon_e6me1les_ON_TAP');
                              context.safePop();
                            },
                            child: Icon(
                              Icons.chevron_left,
                              color: Color(0xFF303030),
                              size: 24.0,
                            ),
                          ),
                          Text(
                            'Health device data',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nevermind',
                                  color: Color(0xFF242E49),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nevermind'),
                                ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                      Builder(
                        builder: (context) => Switch.adaptive(
                          value: _model.toggleSwitchValue!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.toggleSwitchValue = newValue);
                            if (newValue) {
                              logFirebaseEvent(
                                  'HEALTH_CONNECT_toggle_switch_ON_TOGGLE_O');
                              if (FFAppState().healthPermissionCancelled) {
                                await actions.getHealthDeviceVitals();
                                if (Navigator.of(context).canPop()) {
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

                                FFAppState().healthPermissionCancelled = false;
                                safeSetState(() {});
                              } else {
                                FFAppState().healthToggle = true;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.toggleSwitchValue =
                                      FFAppState().healthToggle;
                                });
                                showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Container(
                                          height: 140.0,
                                          width: 300.0,
                                          child: GrantAmdhaWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                );

                                await Future.delayed(
                                    const Duration(milliseconds: 2000));
                                Navigator.pop(context);
                                if (Navigator.of(context).canPop()) {
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

                                await actions.openHealthPermissionDialog();
                              }
                            } else {
                              logFirebaseEvent(
                                  'HEALTH_CONNECT_toggle_switch_ON_TOGGLE_O');
                              FFAppState().healthToggle = false;
                              safeSetState(() {});

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

                              await actions.openHealthPermissionDialog();
                              safeSetState(() {
                                _model.toggleSwitchValue =
                                    FFAppState().healthToggle;
                              });
                            }
                          },
                          activeColor: Color(0xFF34C759),
                          activeTrackColor: Color(0xFF34C759),
                          inactiveTrackColor: Color(0xFFE9E9E9),
                          inactiveThumbColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 0.5,
                thickness: 0.5,
                color: Color(0xFFDFDFDF),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 40.0, 10.0, 0.0),
                child: Text(
                  'Tap \'View My Health Apps\' below to manage this app\'s access to your health data.  Select Amdha to adjust individual permissions.\n\nGo to Settings > Data Access & Devices, and select Amdha.',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 16.0),
                child: FFButtonWidget(
                  onPressed: !FFAppState().healthToggle
                      ? null
                      : () async {
                          logFirebaseEvent(
                              'HEALTH_CONNECT_VIEW_MY_HEALTH_APPS_BTN_O');
                          if (Navigator.of(context).canPop()) {
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

                          await actions.openHealthPermissionDialog();
                        },
                  text: 'View my health apps',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(4.0),
                    disabledColor: Color(0xFFEEEEEE),
                    disabledTextColor: Color(0xFF949494),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: valueOrDefault<Color>(
                    FFAppState().theme.backgroudPrimaryColor,
                    Color(0x2A249689),
                  ),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.privacy_tip,
                          color: Color(0xFF008080),
                          size: 24.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'This app requests access to your Health data to personalize your health insights.  Your health information is kept private and is never shared without your explicit consent.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                  lineHeight: 1.5,
                                ),
                          ),
                        ),
                      ],
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
