import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'toggle_button_model.dart';
export 'toggle_button_model.dart';

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({
    super.key,
    this.toggleName,
    bool? isActive,
  }) : isActive = isActive ?? false;

  final String? toggleName;
  final bool isActive;

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  late ToggleButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToggleButtonModel());

    _model.switchValue = widget.isActive;
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
      height: 50.0,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              widget.toggleName!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          Switch.adaptive(
            value: _model.switchValue!,
            onChanged: (newValue) async {
              setState(() => _model.switchValue = newValue);
            },
            activeColor: FlutterFlowTheme.of(context).primary,
            activeTrackColor: FlutterFlowTheme.of(context).accent1,
            inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
            inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
          ),
        ],
      ),
    );
  }
}
