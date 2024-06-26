import '/components/consent/consent_box/consent_box_widget.dart';
import '/components/consent/note_box/note_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'consent_screen_model.dart';
export 'consent_screen_model.dart';

class ConsentScreenWidget extends StatefulWidget {
  const ConsentScreenWidget({super.key});

  @override
  State<ConsentScreenWidget> createState() => _ConsentScreenWidgetState();
}

class _ConsentScreenWidgetState extends State<ConsentScreenWidget> {
  late ConsentScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsentScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Text(
                        'Informed consent',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                wrapWithModel(
                  model: _model.noteBoxModel,
                  updateCallback: () => setState(() {}),
                  child: const NoteBoxWidget(
                    title: 'Note !',
                    subTitle:
                        'Before using the app, please provide your consent by tapping the items below:',
                  ),
                ),
                wrapWithModel(
                  model: _model.consentBoxModel1,
                  updateCallback: () => setState(() {}),
                  child: const ConsentBoxWidget(
                    title: 'Terms of  use',
                    subTitle: 'Last updated June 1, 2024',
                    consentInfo:
                        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a',
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                wrapWithModel(
                  model: _model.consentBoxModel2,
                  updateCallback: () => setState(() {}),
                  child: const ConsentBoxWidget(
                    title: 'Privacy  Policy',
                    subTitle: 'Alpha MD Health',
                    consentInfo:
                        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a',
                  ),
                ),
                const Spacer(),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: (_model.consentBoxModel1.consentValue! &&
                            _model.consentBoxModel2.consentValue!)
                        ? null
                        : () async {
                            context.pushNamed('SubscriptionScreen');
                          },
                    text: 'Agree & Continue',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                      disabledColor: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ),
              ].addToEnd(const SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
