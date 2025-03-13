import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'faq_component_model.dart';
export 'faq_component_model.dart';

class FaqComponentWidget extends StatefulWidget {
  const FaqComponentWidget({
    super.key,
    this.question,
    this.answer,
    this.liking,
  });

  final String? question;
  final String? answer;
  final String? liking;

  @override
  State<FaqComponentWidget> createState() => _FaqComponentWidgetState();
}

class _FaqComponentWidgetState extends State<FaqComponentWidget> {
  late FaqComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaqComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('FAQ_COMPONENT_Container_q41hwgin_ON_TAP');
        _model.toggle = !_model.toggle;
        safeSetState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        widget.question!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  if (_model.toggle)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.angleUp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 18.0,
                      ),
                    ),
                  if (!_model.toggle)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: FaIcon(
                        FontAwesomeIcons.angleDown,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 18.0,
                      ),
                    ),
                ],
              ),
            ),
            if (_model.toggle)
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Text(
                      widget.answer!,
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  if (false)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Text(
                              widget.liking!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            safeSetState(() => _model.like = !_model.like);
                            logFirebaseEvent(
                                'FAQ_COMPONENT_ToggleIcon_jkjikpvu_ON_TOG');
                            _model.dislike = false;
                            safeSetState(() {});
                          },
                          value: !_model.like,
                          onIcon: Icon(
                            Icons.thumb_up_off_alt,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          offIcon: Icon(
                            Icons.thumb_up,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            safeSetState(
                                () => _model.dislike = !_model.dislike);
                            logFirebaseEvent(
                                'FAQ_COMPONENT_ToggleIcon_2p0qa5an_ON_TOG');
                            _model.like = false;
                            safeSetState(() {});
                          },
                          value: !_model.dislike,
                          onIcon: Icon(
                            Icons.thumb_down_off_alt,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          offIcon: Icon(
                            Icons.thumb_down_alt,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 20.0,
                          ),
                        ),
                      ]
                          .divide(SizedBox(width: 10.0))
                          .addToEnd(SizedBox(width: 20.0)),
                    ),
                ]
                    .divide(SizedBox(height: 10.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            Divider(
              height: 0.0,
              thickness: 0.25,
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
          ].addToStart(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
