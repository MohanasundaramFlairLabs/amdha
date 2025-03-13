import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'web_login_model.dart';
export 'web_login_model.dart';

class WebLoginWidget extends StatefulWidget {
  const WebLoginWidget({
    super.key,
    required this.loginUrl,
  });

  final String? loginUrl;

  static String routeName = 'WebLogin';
  static String routePath = '/webLogin';

  @override
  State<WebLoginWidget> createState() => _WebLoginWidgetState();
}

class _WebLoginWidgetState extends State<WebLoginWidget> {
  late WebLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebLoginModel());

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
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: custom_widgets.WebAppLogin(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              loginUrl: widget.loginUrl!,
              successCallback: () async {
                logFirebaseEvent('WEB_LOGIN_Container_9j1rndj0_CALLBACK');
                _model.getProfile = await HocGroup.getProfileCall.call(
                  userId: FFAppState().userId,
                  baseurl: FFAppState().baseUrl,
                );

                if ((_model.getProfile?.succeeded ?? true)) {
                  _model.refreshResponse = await RefreshTokenApiCall.call(
                    baseurl: FFAppState().baseUrl,
                    refreshToken: FFAppState().refreshToken,
                  );

                  if ((_model.refreshResponse?.succeeded ?? true)) {
                    FFAppState().userId = getJsonField(
                      (_model.refreshResponse?.jsonBody ?? ''),
                      r'''$.accessToken''',
                    ).toString();
                    safeSetState(() {});
                    await actions.updateToken(
                      getJsonField(
                        (_model.refreshResponse?.jsonBody ?? ''),
                        r'''$.accessToken''',
                      ).toString(),
                    );
                    if (ProfileCheckModelStruct.maybeFromMap(
                                (_model.getProfile?.jsonBody ?? ''))
                            ?.showAdditionalDetailsPage ==
                        true) {
                      FFAppState().userDetails =
                          ProfileModelStruct.maybeFromMap(getJsonField(
                        (_model.getProfile?.jsonBody ?? ''),
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
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
                  context.pushNamed(FreeScanPageWidget.routeName);
                }

                safeSetState(() {});
              },
              failureCallback: () async {},
            ),
          ),
        ),
      ),
    );
  }
}
