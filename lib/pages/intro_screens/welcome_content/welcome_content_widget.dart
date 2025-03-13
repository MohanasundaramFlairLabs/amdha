import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'welcome_content_model.dart';
export 'welcome_content_model.dart';

class WelcomeContentWidget extends StatefulWidget {
  const WelcomeContentWidget({
    super.key,
    bool? enableButton,
  }) : this.enableButton = enableButton ?? true;

  final bool enableButton;

  @override
  State<WelcomeContentWidget> createState() => _WelcomeContentWidgetState();
}

class _WelcomeContentWidgetState extends State<WelcomeContentWidget> {
  late WelcomeContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeContentModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.95,
            decoration: BoxDecoration(),
            child: Text(
              'Your Personal Healthcare Assistant Brought To You By AMDHA',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nevermind',
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts:
                        GoogleFonts.asMap().containsKey('Nevermind'),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.95,
              decoration: BoxDecoration(),
              child: Text(
                'Get a wellbeing score, track your vitals, Improve your health, right from your phone.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nevermind',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          GoogleFonts.asMap().containsKey('Nevermind'),
                    ),
              ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/welcome-amdha.png',
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Opacity(
            opacity: 0.5,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 0.5,
              decoration: BoxDecoration(
                color: Color(0xFFD5D5D5),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: !widget.enableButton
                  ? null
                  : () async {
                      logFirebaseEvent('WELCOME_CONTENT_COMP_NEXT_BTN_ON_TAP');
                      if (FFAppState().subscriptionStatus == 'active') {
                        _model.getProfileApi =
                            await HocGroup.getProfileCall.call(
                          userId: FFAppState().userId,
                          baseurl: FFAppState().baseUrl,
                        );

                        if ((_model.getProfileApi?.succeeded ?? true)) {
                          context.goNamed(
                            HomePageWidget.routeName,
                            queryParameters: {
                              'index': serializeParam(
                                0,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          context.pushNamed(
                              AdditionalDetailsScreenWidget.routeName);
                        }
                      } else {
                        context.pushNamed(ConsentScreenWidget.routeName);
                      }

                      safeSetState(() {});
                    },
              text: 'Next',
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Nevermind',
                      color: Colors.white,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          GoogleFonts.asMap().containsKey('Nevermind'),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
                disabledColor: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
