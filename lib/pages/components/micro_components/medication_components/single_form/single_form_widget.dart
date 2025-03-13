import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'single_form_model.dart';
export 'single_form_model.dart';

class SingleFormWidget extends StatefulWidget {
  const SingleFormWidget({
    super.key,
    this.fieldName,
    String? initialValue,
    this.mandatorySymbol,
    this.period,
    bool? isDisabled,
  })  : this.initialValue = initialValue ?? ' ',
        this.isDisabled = isDisabled ?? false;

  final String? fieldName;
  final String initialValue;
  final String? mandatorySymbol;
  final Future Function(int? numberofdays)? period;
  final bool isDisabled;

  @override
  State<SingleFormWidget> createState() => _SingleFormWidgetState();
}

class _SingleFormWidgetState extends State<SingleFormWidget> {
  late SingleFormModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleFormModel());

    _model.enteredValueTextController ??=
        TextEditingController(text: widget.initialValue);
    _model.enteredValueFocusNode ??= FocusNode();

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
                    'name',
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
                    'text',
                  ),
                  style: TextStyle(
                    color: Color(0xFFFF4848),
                    fontSize: 16.0,
                  ),
                )
              ],
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(),
              child: TextFormField(
                controller: _model.enteredValueTextController,
                focusNode: _model.enteredValueFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.enteredValueTextController',
                  Duration(milliseconds: 0),
                  () async {
                    logFirebaseEvent(
                        'SINGLE_FORM_EnteredValue_ON_TEXTFIELD_CH');
                    await widget.period?.call(
                      int.tryParse(_model.enteredValueTextController.text),
                    );
                  },
                ),
                autofocus: false,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.done,
                readOnly: widget.isDisabled,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelMediumFamily),
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: valueOrDefault<Color>(
                        widget.isDisabled
                            ? Color(0xFFF5F5F5)
                            : Color(0x805D6A85),
                        Color(0x805D6A85),
                      ),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  filled: true,
                  fillColor: widget.isDisabled
                      ? Color(0xFFF5F5F5)
                      : FlutterFlowTheme.of(context).secondary,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 16.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
                textAlign: TextAlign.start,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                validator: _model.enteredValueTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
