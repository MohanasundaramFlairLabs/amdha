import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'free_next_component_model.dart';
export 'free_next_component_model.dart';

class FreeNextComponentWidget extends StatefulWidget {
  const FreeNextComponentWidget({
    super.key,
    this.feature,
    this.detail,
    this.index,
    this.callbackNextPage,
  });

  final String? feature;
  final String? detail;
  final int? index;
  final Future Function()? callbackNextPage;

  @override
  State<FreeNextComponentWidget> createState() =>
      _FreeNextComponentWidgetState();
}

class _FreeNextComponentWidgetState extends State<FreeNextComponentWidget> {
  late FreeNextComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreeNextComponentModel());

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
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: widget.index == 0 ? 35.0 : 15.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: widget.index == 0
                          ? FlutterFlowTheme.of(context).secondary
                          : Color(0x7FFFFFFF),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  Container(
                    width: widget.index == 1 ? 35.0 : 15.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: widget.index == 1
                          ? FlutterFlowTheme.of(context).secondary
                          : Color(0x80FFFFFF),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  Container(
                    width: widget.index == 2 ? 35.0 : 15.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: widget.index == 2
                          ? FlutterFlowTheme.of(context).secondary
                          : Color(0x80FFFFFF),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  Container(
                    width: widget.index == 3 ? 35.0 : 15.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: widget.index == 3
                          ? FlutterFlowTheme.of(context).secondary
                          : Color(0x80FFFFFF),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  Container(
                    width: widget.index == 4 ? 35.0 : 15.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: widget.index == 4
                          ? FlutterFlowTheme.of(context).secondary
                          : Color(0x80FFFFFF),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ].divide(SizedBox(width: 2.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(),
                child: Text(
                  widget.feature!,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleMediumFamily,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleMediumFamily),
                      ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(),
                  child: Text(
                    widget.detail!,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleMediumFamily,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleMediumFamily),
                        ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'FREE_NEXT_COMPONENT_COMP_NEXT_BTN_ON_TAP');
                    await widget.callbackNextPage?.call();

                    _model.updatePage(() {});
                    if (widget.index == 4) {
                      context.pushNamed(ConsentScreenWidget.routeName);
                    }
                  },
                  text: 'Next',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'FREE_NEXT_COMPONENT_Text_0fj1uzg7_ON_TAP');

                    context.pushNamed(ConsentScreenWidget.routeName);
                  },
                  child: Text(
                    'Skip >>',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ].addToStart(SizedBox(height: 20.0)).addToEnd(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
