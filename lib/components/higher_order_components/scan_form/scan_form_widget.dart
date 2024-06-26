import '/components/micro_components/medication_components/date_pick/date_pick_widget.dart';
import '/components/micro_components/medication_components/drop_down_field/drop_down_field_widget.dart';
import '/components/micro_components/medication_components/single_form/single_form_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scan_form_model.dart';
export 'scan_form_model.dart';

class ScanFormWidget extends StatefulWidget {
  const ScanFormWidget({
    super.key,
    required this.callbackScanForm,
    required this.backCallback,
  });

  final Future Function(
          DateTime? dob, int? height, int? weight, String? gender)?
      callbackScanForm;
  final Future Function()? backCallback;

  @override
  State<ScanFormWidget> createState() => _ScanFormWidgetState();
}

class _ScanFormWidgetState extends State<ScanFormWidget> {
  late ScanFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanFormModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 56.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.backCallback?.call();
                  },
                  child: Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Scan Vitals',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0.0,
            thickness: 0.25,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.datePickModel,
                  updateCallback: () => setState(() {}),
                  child: DatePickWidget(
                    fieldName: 'Date of birth',
                    icon: Icon(
                      Icons.date_range,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 16.0,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.singleFormModel1,
                  updateCallback: () => setState(() {}),
                  child: const SingleFormWidget(
                    fieldName: 'Height (CM)',
                  ),
                ),
                wrapWithModel(
                  model: _model.singleFormModel2,
                  updateCallback: () => setState(() {}),
                  child: const SingleFormWidget(
                    fieldName: 'Weight (KG)',
                  ),
                ),
                wrapWithModel(
                  model: _model.dropDownFieldModel,
                  updateCallback: () => setState(() {}),
                  child: DropDownFieldWidget(
                    fieldName: 'Gender',
                    initialValue: FFAppConstants.genderOption.first,
                    options: FFAppConstants.genderOption,
                  ),
                ),
              ]
                  .divide(const SizedBox(height: 20.0))
                  .addToStart(const SizedBox(height: 20.0))
                  .addToEnd(const SizedBox(height: 20.0)),
            ),
          ),
          const Spacer(),
          FFButtonWidget(
            onPressed: () async {
              await widget.callbackScanForm?.call(
                _model.datePickModel.dateSelectionModel.datePicked,
                int.tryParse(
                    _model.singleFormModel1.enteredValueTextController.text),
                int.tryParse(
                    _model.singleFormModel2.enteredValueTextController.text),
                _model.dropDownFieldModel.dropdownModel.dropDownValue,
              );
            },
            text: 'Next',
            options: FFButtonOptions(
              width: MediaQuery.sizeOf(context).width * 0.95,
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].addToEnd(const SizedBox(height: 20.0)),
      ),
    );
  }
}
