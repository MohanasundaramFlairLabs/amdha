import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reschedule_bottom_sheet_model.dart';
export 'reschedule_bottom_sheet_model.dart';

class RescheduleBottomSheetWidget extends StatefulWidget {
  const RescheduleBottomSheetWidget({
    super.key,
    this.rescheduleCallback,
    this.deletedCalback,
  });

  final Future Function()? rescheduleCallback;
  final Future Function()? deletedCalback;

  @override
  State<RescheduleBottomSheetWidget> createState() =>
      _RescheduleBottomSheetWidgetState();
}

class _RescheduleBottomSheetWidgetState
    extends State<RescheduleBottomSheetWidget> {
  late RescheduleBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RescheduleBottomSheetModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 130.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('RESCHEDULE_BOTTOM_SHEET_Container_dassfk');
              await widget.deletedCalback?.call();
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Cancel Consultation',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nevermind',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Nevermind'),
                      ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('RESCHEDULE_BOTTOM_SHEET_Container_7rnbi5');
              await widget.rescheduleCallback?.call();
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Reschedule Consultation',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nevermind',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            GoogleFonts.asMap().containsKey('Nevermind'),
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
