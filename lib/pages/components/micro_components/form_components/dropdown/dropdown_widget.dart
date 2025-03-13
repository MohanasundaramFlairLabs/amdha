import '';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dropdown_model.dart';
export 'dropdown_model.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    super.key,
    this.listOfOptions,
    this.callbackDrop,
    bool? isDisabled,
    this.initialValue,
  }) : this.isDisabled = isDisabled ?? false;

  final List<String>? listOfOptions;
  final Future Function(String? selectedValue)? callbackDrop;
  final bool isDisabled;
  final String? initialValue;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  late DropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<String>(
      controller: _model.vitalDropDownValueController ??=
          FormFieldController<String>(
        _model.vitalDropDownValue ??=
            widget.initialValue != null && widget.initialValue != ''
                ? widget.initialValue
                : ' ',
      ),
      options: widget.listOfOptions!,
      onChanged: (val) async {
        safeSetState(() => _model.vitalDropDownValue = val);
        logFirebaseEvent('DROPDOWN_VitalDropDown_ON_FORM_WIDGET_SE');
        await widget.callbackDrop?.call(
          _model.vitalDropDownValue,
        );
        _model.value = _model.vitalDropDownValue;
        safeSetState(() {});

        FFAppState().update(() {});
      },
      height: 40.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            color: FlutterFlowTheme.of(context).secondaryText,
            letterSpacing: 0.0,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
          ),
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: widget.isDisabled
          ? Color(0xFFF5F5F5)
          : FlutterFlowTheme.of(context).secondary,
      elevation: 2.0,
      borderColor: valueOrDefault<Color>(
        widget.isDisabled ? Color(0xFFF5F5F5) : Color(0x7F5D6A85),
        Color(0x7F5D6A85),
      ),
      borderWidth: 1.0,
      borderRadius: 4.0,
      margin: EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 10.0, 4.0),
      hidesUnderline: true,
      disabled: widget.isDisabled,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
