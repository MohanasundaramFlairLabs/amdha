import '/components/micro_components/form_components/dropdown/dropdown_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
  });

  final String? fieldName;
  final List<String>? options;
  final String? initialValue;

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldName!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          wrapWithModel(
            model: _model.dropdownModel,
            updateCallback: () => setState(() {}),
            child: DropdownWidget(
              listOfOptions: widget.options,
              initialValue: widget.initialValue,
              callbackDrop: (selectedValue) async {},
            ),
          ),
        ].divide(const SizedBox(height: 10.0)),
      ),
    );
  }
}
