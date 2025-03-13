import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/micro_components/delete_dialog_box/delete_dialog_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'option_component_model.dart';
export 'option_component_model.dart';

class OptionComponentWidget extends StatefulWidget {
  const OptionComponentWidget({
    super.key,
    this.id,
    this.path,
  });

  final String? id;
  final String? path;

  @override
  State<OptionComponentWidget> createState() => _OptionComponentWidgetState();
}

class _OptionComponentWidgetState extends State<OptionComponentWidget> {
  late OptionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionComponentModel());

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80.0,
          height: 30.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('OPTION_COMPONENT_COMP_VIEW_BTN_ON_TAP');
              await launchURL(widget.path!);
            },
            text: 'View',
            icon: FaIcon(
              FontAwesomeIcons.fileAlt,
              size: 12.0,
            ),
            options: FFButtonOptions(
              width: 80.0,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            showLoadingIndicator: false,
          ),
        ),
        Container(
          width: 80.0,
          height: 30.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Builder(
            builder: (context) => FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('OPTION_COMPONENT_COMP_DELETE_BTN_ON_TAP');
                await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: Container(
                        height: 200.0,
                        width: 320.0,
                        child: DeleteDialogBoxWidget(
                          fileId: widget.id,
                          type: ' ',
                          message: 'Are you sure you want to delete this File?',
                          deleteAction: (id, type) async {
                            _model.apiResultne7 =
                                await HocGroup.deleteHealthFileCall.call(
                              id: id,
                              path: widget.path,
                              userId: FFAppState().userId,
                              baseurl: FFAppState().baseUrl,
                            );

                            if ((_model.apiResultne7?.succeeded ?? true)) {
                              _model.updatePage(() {});
                              Navigator.pop(context);
                              FFAppState().clearFetchListFileQueryCache();
                              FFAppState().refresh =
                                  !(FFAppState().refresh ?? true);
                              FFAppState().update(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Something went wrong...',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                  ),
                                  duration: Duration(milliseconds: 3000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                );

                safeSetState(() {});
              },
              text: 'Delete',
              icon: Icon(
                FFIcons.kdelete,
                size: 15.0,
              ),
              options: FFButtonOptions(
                width: 80.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4.0),
                  bottomRight: Radius.circular(4.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              showLoadingIndicator: false,
            ),
          ),
        ),
      ],
    );
  }
}
