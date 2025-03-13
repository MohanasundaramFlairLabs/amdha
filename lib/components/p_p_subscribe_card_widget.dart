import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'p_p_subscribe_card_model.dart';
export 'p_p_subscribe_card_model.dart';

class PPSubscribeCardWidget extends StatefulWidget {
  const PPSubscribeCardWidget({
    super.key,
    this.doctorName,
  });

  final String? doctorName;

  @override
  State<PPSubscribeCardWidget> createState() => _PPSubscribeCardWidgetState();
}

class _PPSubscribeCardWidgetState extends State<PPSubscribeCardWidget> {
  late PPSubscribeCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PPSubscribeCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFEF3F6), Color(0xFFFFC5D5)],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(-1.0, 0.0),
          end: AlignmentDirectional(1.0, 0),
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.6,
                height: 120.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pregnancy Program',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nevermind',
                            color: Color(0xFFEC6984),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Nevermind'),
                          ),
                    ),
                    Text(
                      'Dr. ${widget.doctorName} has assigned Pregnancy Program to you. Start your journey today !',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelSmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelSmallFamily),
                          ),
                    ),
                    Text(
                      'Join now',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nevermind',
                            color: Color(0xFFEC698B),
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Nevermind'),
                          ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
            ),
            Container(
              width: 80.0,
              height: 140.0,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/pregnancy_lady.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ].divide(SizedBox(width: 10.0)),
        ),
      ),
    );
  }
}
