import '/components/micro_components/form_components/dropdown/dropdown_widget.dart';
import '/components/micro_components/medication_components/single_form/single_form_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'single_form_dropdown_model.dart';
export 'single_form_dropdown_model.dart';

class SingleFormDropdownWidget extends StatefulWidget {
  const SingleFormDropdownWidget({
    super.key,
    this.fieldName,
    this.options,
    this.initialValue,
    this.dropdownValue,
  });

  final String? fieldName;
  final List<String>? options;
  final String? initialValue;
  final String? dropdownValue;

  @override
  State<SingleFormDropdownWidget> createState() =>
      _SingleFormDropdownWidgetState();
}

class _SingleFormDropdownWidgetState extends State<SingleFormDropdownWidget> {
  late SingleFormDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleFormDropdownModel());

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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.singleFormModel,
                updateCallback: () => setState(() {}),
                child: SingleFormWidget(
                  fieldName: widget.fieldName,
                  initialValue: widget.initialValue,
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: wrapWithModel(
                model: _model.dropdownModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: DropdownWidget(
                  listOfOptions: widget.options,
                  initialValue: widget.dropdownValue,
                  callbackDrop: (selectedValue) async {},
                ),
              ),
            ),
          ),
        ].divide(const SizedBox(width: 20.0)),
      ),
    );
  }
}
