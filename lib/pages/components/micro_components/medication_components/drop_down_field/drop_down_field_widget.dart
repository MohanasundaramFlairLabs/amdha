import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/form_components/dropdown/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drop_down_field_model.dart';
export 'drop_down_field_model.dart';

class DropDownFieldWidget extends StatefulWidget {
  const DropDownFieldWidget({
    super.key,
    this.fieldName,
    this.options,
    this.initialValue,
    this.mandatorySymbol,
    this.onSelection,
    bool? isDisabled,
  }) : this.isDisabled = isDisabled ?? false;

  final String? fieldName;
  final List<String>? options;
  final String? initialValue;
  final String? mandatorySymbol;
  final Future Function(String? value)? onSelection;
  final bool isDisabled;

  @override
  State<DropDownFieldWidget> createState() => _DropDownFieldWidgetState();
}

class _DropDownFieldWidgetState extends State<DropDownFieldWidget> {
  late DropDownFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropDownFieldModel());

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
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: valueOrDefault<String>(
                    widget.fieldName,
                    'Title',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
                TextSpan(
                  text: valueOrDefault<String>(
                    widget.mandatorySymbol,
                    '*',
                  ),
                  style: TextStyle(
                    color: Color(0xFFF56363),
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                )
              ],
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
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('DROP_DOWN_FIELD_Container_6hn5hxl0_ON_TA');
              await widget.onSelection?.call(
                valueOrDefault<String>(
                  _model.dropdownModel.vitalDropDownValue,
                  'value',
                ),
              );
            },
            child: wrapWithModel(
              model: _model.dropdownModel,
              updateCallback: () => safeSetState(() {}),
              child: DropdownWidget(
                listOfOptions: widget.options,
                isDisabled: widget.isDisabled,
                initialValue: widget.initialValue,
                callbackDrop: (selectedValue) async {
                  logFirebaseEvent('DROP_DOWN_FIELD_Container_6hn5hxl0_CALLB');
                  await widget.onSelection?.call(
                    selectedValue,
                  );
                },
              ),
            ),
          ),
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
