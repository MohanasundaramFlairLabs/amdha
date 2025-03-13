import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'launch_model.dart';
export 'launch_model.dart';

class LaunchWidget extends StatefulWidget {
  const LaunchWidget({
    super.key,
    this.code,
    this.tenant,
  });

  final String? code;
  final String? tenant;

  static String routeName = 'launch';
  static String routePath = '/launch/:tenant/:code';

  @override
  State<LaunchWidget> createState() => _LaunchWidgetState();
}

class _LaunchWidgetState extends State<LaunchWidget>
    with TickerProviderStateMixin {
  late LaunchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LaunchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LAUNCH_PAGE_launch_ON_INIT_STATE');
      await Future.wait([
        Future(() async {
          _model.envres = await actions.getEnv();
          FFAppState().baseUrl = _model.envres!.baseUrl;
          safeSetState(() {});
          if (isWeb &&
              (widget.code != null && widget.code != '') &&
              (widget.tenant != null && widget.tenant != '')) {
            FFAppState().isSignOut = false;
            FFAppState().isGenx = true;
            safeSetState(() {});
            _model.authTokenResponse1 = await GetAuthTokenCall.call(
              code: widget.code,
              tenant: widget.tenant,
              baseurl: FFAppState().baseUrl,
            );

            if ((_model.authTokenResponse1?.succeeded ?? true)) {
              FFAppState().userId = getJsonField(
                (_model.authTokenResponse1?.jsonBody ?? ''),
                r'''$.token''',
              ).toString().toString();
              FFAppState().refreshToken = getJsonField(
                (_model.authTokenResponse1?.jsonBody ?? ''),
                r'''$.refresh''',
              ).toString().toString();
              safeSetState(() {});
              await actions.saveToLocalStorage(
                'userId',
                getJsonField(
                  (_model.authTokenResponse1?.jsonBody ?? ''),
                  r'''$.token''',
                ).toString().toString(),
              );
            } else {
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('Authentication failed'),
                    content: Text('Use valid link to proceed'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            }
          } else {
            FFAppState().isSignOut = !FFAppState().isGenx;
            safeSetState(() {});
          }
        }),
        Future(() async {
          await Future.delayed(const Duration(milliseconds: 4000));
          _model.envresponses = await actions.getEnv();
          _model.hideLogo = true;
          _model.showContent = true;
          safeSetState(() {});
          await Future.delayed(const Duration(milliseconds: 2000));
          if (FFAppState().userId != '') {
            _model.profileResponse = await HocGroup.getProfileCall.call(
              userId: FFAppState().userId,
              baseurl: FFAppState().baseUrl,
            );

            if ((_model.profileResponse?.succeeded ?? true)) {
              _model.apiResult1ow = await RefreshTokenApiCall.call(
                baseurl: FFAppState().baseUrl,
                refreshToken: FFAppState().refreshToken,
              );

              if ((_model.apiResult1ow?.succeeded ?? true)) {
                FFAppState().userId = getJsonField(
                  (_model.apiResult1ow?.jsonBody ?? ''),
                  r'''$.accessToken''',
                ).toString().toString();
                safeSetState(() {});
                await actions.updateToken(
                  getJsonField(
                    (_model.apiResult1ow?.jsonBody ?? ''),
                    r'''$.accessToken''',
                  ).toString().toString(),
                );
                if (ProfileCheckModelStruct.maybeFromMap(
                            (_model.profileResponse?.jsonBody ?? ''))
                        ?.showAdditionalDetailsPage ==
                    true) {
                  context.pushNamed(ConsentScreenWidget.routeName);

                  FFAppState().userDetails =
                      ProfileModelStruct.maybeFromMap(getJsonField(
                    (_model.profileResponse?.jsonBody ?? ''),
                    r'''$.data''',
                  ))!;
                  safeSetState(() {});
                } else {
                  context.goNamed(
                    HomePageWidget.routeName,
                    queryParameters: {
                      'index': serializeParam(
                        0,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                }
              }
            } else {
              await Future.wait([
                Future(() async {
                  if ((_model.profileResponse?.statusCode ?? 200) == 401) {
                    if (isAndroid || isiOS) {
                      _model.envResponse = await actions.getEnv();

                      context.goNamed(
                        LoginWidget.routeName,
                        queryParameters: {
                          'loginurl': serializeParam(
                            _model.envResponse?.loginUrl,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    }
                  }
                }),
                Future(() async {
                  if ((_model.profileResponse?.statusCode ?? 200) == 404) {
                    context.pushNamed(FreeScanPageWidget.routeName);
                  }
                }),
              ]);
            }
          } else {
            FFAppState().isSignOut = !FFAppState().isGenx;
            safeSetState(() {});
            if (isAndroid || isiOS) {
              _model.envresponse = await actions.getEnv();

              context.goNamed(
                LoginWidget.routeName,
                queryParameters: {
                  'loginurl': serializeParam(
                    _model.envresponses?.loginUrl,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            } else {
              _model.isMobileBrowser = await actions.isRunningInMobileBrowser();
              if (_model.isMobileBrowser!) {
                _model.envres2 = await actions.getEnv();

                context.pushNamed(
                  WebLoginWidget.routeName,
                  queryParameters: {
                    'loginUrl': serializeParam(
                      _model.envres2?.loginUrl,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              } else {
                context.goNamed(PromotionWidget.routeName);
              }
            }
          }
        }),
        Future(() async {
          await actions.checkForAppUpdate(
            context,
          );
        }),
        Future(() async {
          await actions.initializeFirebase(
            context,
          );
          await actions.initTimeZoneForLocalNotifcation();
          await actions.getPushPermission();
          _model.fcmToken = await actions.getFCMToken();
          FFAppState().FcmToken = _model.fcmToken!;
          safeSetState(() {});
        }),
      ]);
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 4000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 4000.ms),
          MoveEffect(
            curve: Curves.easeIn,
            delay: 4000.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 300.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 4000.0.ms,
            duration: 0.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -500.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 4000.0.ms,
            duration: 0.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1000.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 3000.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/pic1.png',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                fit: BoxFit.cover,
              ),
            ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation1']!),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _model.showContent
                          ? Color(0x0C000000)
                          : Color(0x00000000),
                      _model.showContent ? Color(0x80000000) : Color(0x00000000)
                    ],
                    stops: [0.0, 0.75],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/healthlogowhite.png',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.contain,
                            alignment: Alignment(0.0, 0.0),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation2']!),
                      ),
                    ),
                    if (!_model.hideLogo)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/healthlogowhite.png',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.contain,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation3']!),
                      ),
                    if (_model.showContent)
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 130.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Personal \nHealthcare Assistant \nBrought To You By ',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 30.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Text(
                                  'AMDHA',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 30.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ],
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                        ),
                      ),
                    if (_model.showContent)
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 80.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            decoration: BoxDecoration(),
                            child: Text(
                              'Get a health insights, track your vitals,\nImprove your health, right from your phone.',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!),
                        ),
                      ),
                    if (!_model.hideLogo)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 150.0, 0.0, 0.0),
                          child: Text(
                            'Welcome to AMDHA',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation']!),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
