import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'not_found_component_model.dart';
export 'not_found_component_model.dart';

class NotFoundComponentWidget extends StatefulWidget {
  const NotFoundComponentWidget({
    super.key,
    bool? isGoal,
    this.subTitle,
    this.buttonTitle,
  }) : this.isGoal = isGoal ?? false;

  final bool isGoal;
  final String? subTitle;
  final String? buttonTitle;

  @override
  State<NotFoundComponentWidget> createState() =>
      _NotFoundComponentWidgetState();
}

class _NotFoundComponentWidgetState extends State<NotFoundComponentWidget> {
  late NotFoundComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotFoundComponentModel());

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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!widget.isGoal)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SvgPicture.asset(
                'assets/images/medications.svg',
                width: 56.0,
                height: 56.0,
                fit: BoxFit.cover,
              ),
            ),
          if (widget.isGoal)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SvgPicture.asset(
                'assets/images/goals.svg',
                width: 56.0,
                height: 56.0,
                fit: BoxFit.contain,
              ),
            ),
          Text(
            widget.subTitle!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('NOT_FOUND_COMPONENT_BUTTON_BTN_ON_TAP');
              if (FFAppState().quotas.quotas.addVitals > 0) {
                if (widget.isGoal) {
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
                  context.pushNamed(
                    HomePageWidget.routeName,
                    queryParameters: {
                      'index': serializeParam(
                        4,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                } else {
                  context.pushNamed(
                    HomePageWidget.routeName,
                    queryParameters: {
                      'index': serializeParam(
                        2,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                }
              } else {
                await action_blocks.doSubscription(
                  context,
                  parameterIds: FFAppState().planIds,
                );
              }
            },
            text: widget.buttonTitle!,
            options: FFButtonOptions(
              height: 30.0,
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: valueOrDefault<Color>(
                FFAppState().theme.primaryColor,
                FlutterFlowTheme.of(context).primary,
              ),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
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
        ].divide(SizedBox(height: 20.0)),
      ),
    );
  }
}
