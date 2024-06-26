import '/components/micro_components/medication_components/drop_down_field/drop_down_field_widget.dart';
import '/components/micro_components/note_component/note_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scan_form_two_model.dart';
export 'scan_form_two_model.dart';

class ScanFormTwoWidget extends StatefulWidget {
  const ScanFormTwoWidget({
    super.key,
    required this.callbackScanFormTwo,
  });

  final Future Function(String? posture, String? scanType)? callbackScanFormTwo;

  @override
  State<ScanFormTwoWidget> createState() => _ScanFormTwoWidgetState();
}

class _ScanFormTwoWidgetState extends State<ScanFormTwoWidget> {
  late ScanFormTwoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanFormTwoModel());

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
            width: MediaQuery.sizeOf(context).width * 0.9,
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
                    FFAppState().activityComponent = 'medical';
                    FFAppState().update(() {});
                  },
                  child: Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
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
                  model: _model.postureModel,
                  updateCallback: () => setState(() {}),
                  child: DropDownFieldWidget(
                    fieldName: 'Posture',
                    initialValue: FFAppConstants.postureOption.first,
                    options: FFAppConstants.postureOption,
                  ),
                ),
                wrapWithModel(
                  model: _model.scanTypeModel,
                  updateCallback: () => setState(() {}),
                  child: DropDownFieldWidget(
                    fieldName: 'Scan Type',
                    initialValue: FFAppConstants.ScanOption.first,
                    options: FFAppConstants.ScanOption,
                  ),
                ),
              ]
                  .divide(const SizedBox(height: 20.0))
                  .addToStart(const SizedBox(height: 20.0))
                  .addToEnd(const SizedBox(height: 20.0)),
            ),
          ),
          const Spacer(),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
              child: wrapWithModel(
                model: _model.noteComponentModel,
                updateCallback: () => setState(() {}),
                child: const NoteComponentWidget(),
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              await widget.callbackScanFormTwo?.call(
                _model.postureModel.dropdownModel.dropDownValue,
                _model.scanTypeModel.dropdownModel.dropDownValue,
              );
            },
            text: 'Scan',
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
