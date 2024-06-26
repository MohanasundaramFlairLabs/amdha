import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vital_card_model.dart';
export 'vital_card_model.dart';

class VitalCardWidget extends StatefulWidget {
  const VitalCardWidget({
    super.key,
    this.vitalValue,
    this.vitalUnit,
    this.vitalRange,
    this.vitalIcon,
    this.vitalMeterIcon,
    this.borderColor,
    this.containerColor,
  });

  final String? vitalValue;
  final String? vitalUnit;
  final String? vitalRange;
  final String? vitalIcon;
  final String? vitalMeterIcon;
  final Color? borderColor;
  final Color? containerColor;

  @override
  State<VitalCardWidget> createState() => _VitalCardWidgetState();
}

class _VitalCardWidgetState extends State<VitalCardWidget> {
  late VitalCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VitalCardModel());

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
      height: 71.0,
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget.borderColor,
            FlutterFlowTheme.of(context).primaryText,
          ),
          width: 0.25,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.vitalIcon!,
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.vitalValue,
                '0',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 32.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          Text(
            widget.vitalUnit!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: Text(
              widget.vitalRange!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.vitalMeterIcon!,
              width: 55.0,
              height: 55.0,
              fit: BoxFit.contain,
            ),
          ),
        ].addToStart(const SizedBox(width: 10.0)).addToEnd(const SizedBox(width: 10.0)),
      ),
    );
  }
}
