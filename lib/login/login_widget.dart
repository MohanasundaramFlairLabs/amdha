import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
    this.loginurl,
  });

  final String? loginurl;

  static String routeName = 'Login';
  static String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_PAGE_Login_ON_INIT_STATE');
      _model.envlResponse = await actions.getEnv();
      FFAppState().baseUrl = _model.envlResponse!.baseUrl;
      safeSetState(() {});
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: custom_widgets.LoginView(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                baseurl: FFAppState().baseUrl,
                loginUrl: widget.loginurl!,
                successCallback: () async {
                  logFirebaseEvent('LOGIN_PAGE_Container_taim239k_CALLBACK');
                  _model.profileResponse = await HocGroup.getProfileCall.call(
                    userId: FFAppState().userId,
                    baseurl: FFAppState().baseUrl,
                  );

                  if ((_model.profileResponse?.succeeded ?? true)) {
                    _model.refreshTokenResponse =
                        await RefreshTokenApiCall.call(
                      baseurl: FFAppState().baseUrl,
                      refreshToken: FFAppState().refreshToken,
                    );

                    if ((_model.refreshTokenResponse?.succeeded ?? true)) {
                      FFAppState().userId = getJsonField(
                        (_model.refreshTokenResponse?.jsonBody ?? ''),
                        r'''$.accessToken''',
                      ).toString();
                      safeSetState(() {});
                      await actions.updateToken(
                        getJsonField(
                          (_model.refreshTokenResponse?.jsonBody ?? ''),
                          r'''$.accessToken''',
                        ).toString(),
                      );
                      if (ProfileCheckModelStruct.maybeFromMap(
                                  (_model.profileResponse?.jsonBody ?? ''))
                              ?.showAdditionalDetailsPage ==
                          true) {
                        FFAppState().userDetails =
                            ProfileModelStruct.maybeFromMap(getJsonField(
                          (_model.profileResponse?.jsonBody ?? ''),
                          r'''$.data''',
                        ))!;
                        safeSetState(() {});

                        context.pushNamed(
                          ConsentScreenWidget.routeName,
                          queryParameters: {
                            'isFromMenu': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                        );
                      } else {
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
                      }
                    }
                  } else {
                    context.pushNamed(FreeScanPageWidget.routeName);
                  }

                  safeSetState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
