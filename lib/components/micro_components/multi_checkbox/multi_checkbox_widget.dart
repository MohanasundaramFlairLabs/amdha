import '/components/micro_components/form_components/checkbox/checkbox_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'multi_checkbox_model.dart';
export 'multi_checkbox_model.dart';

class MultiCheckboxWidget extends StatefulWidget {
  const MultiCheckboxWidget({
    super.key,
    this.fieldName,
    this.options,
    this.selectedOptions,
  });

  final String? fieldName;
  final List<String>? options;
  final List<String>? selectedOptions;

  @override
  State<MultiCheckboxWidget> createState() => _MultiCheckboxWidgetState();
}

class _MultiCheckboxWidgetState extends State<MultiCheckboxWidget> {
  late MultiCheckboxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultiCheckboxModel());

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
            model: _model.checkboxModel,
            updateCallback: () => setState(() {}),
            child: CheckboxWidget(
              listOfOptions: widget.options,
              selectedOptions: widget.selectedOptions != null &&
                      (widget.selectedOptions)!.isNotEmpty
                  ? widget.selectedOptions
                  : List.generate(
                      random_data.randomInteger(0, 0),
                      (index) => random_data.randomString(
                            0,
                            0,
                            false,
                            false,
                            false,
                          )),
            ),
          ),
        ].divide(const SizedBox(height: 10.0)),
      ),
    );
  }
}
