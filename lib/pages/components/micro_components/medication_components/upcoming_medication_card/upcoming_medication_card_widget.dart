import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'upcoming_medication_card_model.dart';
export 'upcoming_medication_card_model.dart';

class UpcomingMedicationCardWidget extends StatefulWidget {
  const UpcomingMedicationCardWidget({
    super.key,
    this.medicationName,
    this.note,
    bool? autoReminder,
    this.frequency,
  }) : this.autoReminder = autoReminder ?? false;

  final String? medicationName;
  final String? note;
  final bool autoReminder;
  final String? frequency;

  @override
  State<UpcomingMedicationCardWidget> createState() =>
      _UpcomingMedicationCardWidgetState();
}

class _UpcomingMedicationCardWidgetState
    extends State<UpcomingMedicationCardWidget> {
  late UpcomingMedicationCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpcomingMedicationCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('UPCOMING_MEDICATION_CARD_UpcomingMedicat');
      _model.reminder = widget.autoReminder;
      safeSetState(() {});
    });

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(4.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Color(0x265D6A85),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: Color(0x145D6A85),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Icon(
                    FFIcons.kupcomingMedication,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.medicationName!,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Text(
                          widget.frequency!,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ),
                ),
                if (widget.autoReminder)
                  Icon(
                    FFIcons.kbell,
                    color: Color(0xFFF6861F),
                    size: 20.0,
                  ),
                if (!widget.autoReminder)
                  Icon(
                    FFIcons.kexclude,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
              ].divide(SizedBox(width: 5.0)).addToEnd(SizedBox(width: 5.0)),
            ),
            Container(
              height: 30.0,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Instruction :',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.note,
                      'Not added',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ]
                    .divide(SizedBox(width: 5.0))
                    .addToStart(SizedBox(width: 5.0))
                    .addToEnd(SizedBox(width: 5.0)),
              ),
            ),
          ].divide(SizedBox(height: 5.0)),
        ),
      ),
    );
  }
}
