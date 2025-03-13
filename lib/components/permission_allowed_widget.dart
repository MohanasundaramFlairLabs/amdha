import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'permission_allowed_model.dart';
export 'permission_allowed_model.dart';

class PermissionAllowedWidget extends StatefulWidget {
  const PermissionAllowedWidget({super.key});

  @override
  State<PermissionAllowedWidget> createState() =>
      _PermissionAllowedWidgetState();
}

class _PermissionAllowedWidgetState extends State<PermissionAllowedWidget> {
  late PermissionAllowedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PermissionAllowedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF4CD964),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Opacity(
          opacity: 0.8,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Color(0xFF4CD964),
                      size: 24.0,
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Data synced from the connected device. \nvalues updated with latest data',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PERMISSION_ALLOWED_Icon_927ct3qi_ON_TAP');
                        Navigator.pop(context);

                        context.pushNamed(
                          HomePageWidget.routeName,
                          queryParameters: {
                            'index': serializeParam(
                              4,
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
                      },
                      child: Icon(
                        Icons.close,
                        color: Color(0x80242E49),
                        size: 24.0,
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
