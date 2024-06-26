import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'status_card_model.dart';
export 'status_card_model.dart';

class StatusCardWidget extends StatefulWidget {
  const StatusCardWidget({
    super.key,
    required this.vital,
  });

  final VitalsStruct? vital;

  @override
  State<StatusCardWidget> createState() => _StatusCardWidgetState();
}

class _StatusCardWidgetState extends State<StatusCardWidget> {
  late StatusCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      height: 80.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          functions.getCardValue(widget.vital?.type)?.color,
          const Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      functions.getCardValue(widget.vital?.type)?.iconColor,
                      const Color(0x00000000),
                    ),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget.vital?.type == 'Steps')
                      Icon(
                        FFIcons.kgroup,
                        color: valueOrDefault<Color>(
                          functions.getCardValue(widget.vital?.type)?.iconColor,
                          const Color(0x00000000),
                        ),
                        size: 35.0,
                      ),
                    if ((widget.vital?.type == 'TotalBodyWater') ||
                        (widget.vital?.type == 'BodyWater'))
                      Icon(
                        FFIcons.kgroup124Copy,
                        color: valueOrDefault<Color>(
                          functions.getCardValue(widget.vital?.type)?.iconColor,
                          const Color(0x00000000),
                        ),
                        size: 35.0,
                      ),
                    if ((widget.vital?.type == 'VO2Max') ||
                        (widget.vital?.type == 'Steps'))
                      Icon(
                        FFIcons.kgroup124Copy,
                        color: valueOrDefault<Color>(
                          functions.getCardValue(widget.vital?.type)?.iconColor,
                          const Color(0x00000000),
                        ),
                        size: 35.0,
                      ),
                    if (widget.vital?.type == 'HeartRate')
                      Icon(
                        FFIcons.kgroup124,
                        color: valueOrDefault<Color>(
                          functions.getCardValue(widget.vital?.type)?.iconColor,
                          const Color(0x00000000),
                        ),
                        size: 35.0,
                      ),
                    if (widget.vital?.type == 'CardiacOutput')
                      Icon(
                        FFIcons.kgroup125Copy2,
                        color: valueOrDefault<Color>(
                          functions.getCardValue(widget.vital?.type)?.iconColor,
                          const Color(0x00000000),
                        ),
                        size: 35.0,
                      ),
                    if (widget.vital?.type == 'BloodPressure')
                      Icon(
                        FFIcons.kgroup124Copy3,
                        color: valueOrDefault<Color>(
                          functions.getCardValue(widget.vital?.type)?.iconColor,
                          const Color(0x00000000),
                        ),
                        size: 35.0,
                      ),
                    if (widget.vital?.type == 'BloodVolume ')
                      Icon(
                        FFIcons.kgroup125Copy,
                        color: valueOrDefault<Color>(
                          functions.getCardValue(widget.vital?.type)?.iconColor,
                          const Color(0x00000000),
                        ),
                        size: 35.0,
                      ),
                    if ((widget.vital?.type == 'RespirationRate') ||
                        (widget.vital?.type == 'MeanArterialPressure'))
                      Icon(
                        FFIcons.kgroup129,
                        color: valueOrDefault<Color>(
                          functions.getCardValue(widget.vital?.type)?.iconColor,
                          const Color(0x00000000),
                        ),
                        size: 35.0,
                      ),
                    if (widget.vital?.type == 'StressIndex')
                      Icon(
                        FFIcons.kgroup125,
                        color: valueOrDefault<Color>(
                          functions.getCardValue(widget.vital?.type)?.iconColor,
                          const Color(0x00000000),
                        ),
                        size: 35.0,
                      ),
                    if (widget.vital?.type == 'StressIndex')
                      Icon(
                        FFIcons.kgroup125,
                        color: valueOrDefault<Color>(
                          functions.getCardValue(widget.vital?.type)?.iconColor,
                          const Color(0x00000000),
                        ),
                        size: 35.0,
                      ),
                    if (widget.vital?.type == 'Weight')
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          FFIcons.kvector,
                          color: valueOrDefault<Color>(
                            functions
                                .getCardValue(widget.vital?.type)
                                ?.iconColor,
                            const Color(0x00000000),
                          ),
                          size: 35.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      functions.getCardValue(widget.vital?.type)?.label,
                      'Value',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: Colors.black,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.vital?.value,
                          '00',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: Colors.black,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            functions.getCardValue(widget.vital?.type)?.unit,
                            'Value',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: Colors.black,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ].divide(const SizedBox(height: 5.0)),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: const AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Text(
                  'Range  ${functions.getCardValue(widget.vital?.type)?.range}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: const Color(0xFF5D6A85),
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
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
