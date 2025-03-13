import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'goalactionsheet_model.dart';
export 'goalactionsheet_model.dart';

class GoalactionsheetWidget extends StatefulWidget {
  const GoalactionsheetWidget({
    super.key,
    this.vitalName,
    bool? isUpdate,
    bool? isNewGoal,
    this.updated,
    bool? isEdit,
    this.vitalToEdit,
  })  : this.isUpdate = isUpdate ?? false,
        this.isNewGoal = isNewGoal ?? false,
        this.isEdit = isEdit ?? false;

  final String? vitalName;
  final bool isUpdate;
  final bool isNewGoal;
  final Future Function()? updated;
  final bool isEdit;
  final VitalsStruct? vitalToEdit;

  @override
  State<GoalactionsheetWidget> createState() => _GoalactionsheetWidgetState();
}

class _GoalactionsheetWidgetState extends State<GoalactionsheetWidget> {
  late GoalactionsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalactionsheetModel());

    _model.enteredVitalTextController1 ??=
        TextEditingController(text: widget.vitalToEdit?.value);
    _model.enteredVitalFocusNode1 ??= FocusNode();

    _model.enteredVitalTextController2 ??= TextEditingController();
    _model.enteredVitalFocusNode2 ??= FocusNode();

    _model.enteredVitalTextController3 ??= TextEditingController();
    _model.enteredVitalFocusNode3 ??= FocusNode();

    _model.enteredVitalTextController4 ??= TextEditingController();
    _model.enteredVitalFocusNode4 ??= FocusNode();

    _model.enteredVitalTextController5 ??= TextEditingController();
    _model.enteredVitalFocusNode5 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 220.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 10.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 45.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${() {
                      if (widget.isUpdate) {
                        return 'Update';
                      } else if (widget.isEdit) {
                        return 'Edit';
                      } else {
                        return 'Set';
                      }
                    }()} ${() {
                      if (widget.isUpdate) {
                        return functions.getCardValue(widget.vitalName)?.label;
                      } else if (widget.isEdit) {
                        return functions.getCardValue(widget.vitalName)?.label;
                      } else {
                        return 'Target';
                      }
                    }()}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nevermind',
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nevermind'),
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('GOALACTIONSHEET_COMP_close_ICN_ON_TAP');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 80.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if ((widget.vitalName != 'BloodPressure') &&
                    (widget.vitalName != 'Sleep'))
                  Form(
                    key: _model.formKey3,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: () {
                                  if (widget.isUpdate) {
                                    return 'New ${functions.getCardValue(widget.vitalName)?.label} (${functions.getCardValue(widget.vitalName)?.unit})';
                                  } else if (widget.isEdit) {
                                    return 'Edit ${functions.getCardValue(widget.vitalName)?.label} (${functions.getCardValue(widget.vitalName)?.unit})';
                                  } else {
                                    return 'Set Target Value (${functions.getCardValue(widget.vitalName)?.unit})';
                                  }
                                }(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width *
                                              0.04,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              TextSpan(
                                text: '',
                                style: TextStyle(
                                  color: Color(0xFFBB2828),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize:
                                      MediaQuery.sizeOf(context).width * 0.2,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 1.0),
                          child: TextFormField(
                            controller: _model.enteredVitalTextController1,
                            focusNode: _model.enteredVitalFocusNode1,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.enteredVitalTextController1',
                              Duration(milliseconds: 0),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 12.0, 0.0, 14.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: _model
                                .enteredVitalTextController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ),
                if (widget.vitalName == 'BloodPressure')
                  Form(
                    key: _model.formKey1,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.44,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: () {
                                        if (widget.isUpdate) {
                                          return (widget.vitalName == 'Sleep'
                                              ? 'Set Hours'
                                              : 'New   Systolic (${functions.getCardValue(widget.vitalName)?.unit})');
                                        } else if (widget.isEdit) {
                                          return 'Edit Systolic (mmHg)';
                                        } else {
                                          return (widget.vitalName == 'Sleep'
                                              ? 'Set Hours'
                                              : 'Set   Systolic (${functions.getCardValue(widget.vitalName)?.unit})');
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.035,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        color: Color(0xFFBB2828),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              TextFormField(
                                controller: _model.enteredVitalTextController2,
                                focusNode: _model.enteredVitalFocusNode2,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.enteredVitalTextController2',
                                  Duration(milliseconds: 0),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10.0, 12.0, 0.0, 14.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: _model
                                    .enteredVitalTextController2Validator
                                    .asValidator(context),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.44,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: () {
                                        if (widget.isUpdate) {
                                          return (widget.vitalName == 'Sleep'
                                              ? 'Set Minutes'
                                              : 'New Diastolic(${functions.getCardValue(widget.vitalName)?.unit})');
                                        } else if (widget.isEdit) {
                                          return 'Edit Diastolic (mmHg)';
                                        } else {
                                          return (widget.vitalName == 'Sleep'
                                              ? 'Set Minutes'
                                              : 'Set  Diastolic(${functions.getCardValue(widget.vitalName)?.unit})');
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.035,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        color: Color(0xFFBB2828),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize:
                                            MediaQuery.sizeOf(context).width *
                                                0.035,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              TextFormField(
                                controller: _model.enteredVitalTextController3,
                                focusNode: _model.enteredVitalFocusNode3,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.enteredVitalTextController3',
                                  Duration(milliseconds: 0),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10.0, 12.0, 0.0, 14.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: _model
                                    .enteredVitalTextController3Validator
                                    .asValidator(context),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (widget.vitalName == 'Sleep')
                  Form(
                    key: _model.formKey2,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.44,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: () {
                                        if (widget.isUpdate) {
                                          return (widget.vitalName == 'Sleep'
                                              ? 'Set Hours'
                                              : 'New   Systolic (${functions.getCardValue(widget.vitalName)?.unit})');
                                        } else if (widget.isEdit) {
                                          return 'Edit Systolic (mmHg)';
                                        } else {
                                          return (widget.vitalName == 'Sleep'
                                              ? 'Set Hours'
                                              : 'Set   Systolic (${functions.getCardValue(widget.vitalName)?.unit})');
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.035,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        color: Color(0xFFBB2828),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              TextFormField(
                                controller: _model.enteredVitalTextController4,
                                focusNode: _model.enteredVitalFocusNode4,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.enteredVitalTextController4',
                                  Duration(milliseconds: 0),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10.0, 12.0, 0.0, 14.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: _model
                                    .enteredVitalTextController4Validator
                                    .asValidator(context),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.44,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: () {
                                        if (widget.isUpdate) {
                                          return (widget.vitalName == 'Sleep'
                                              ? 'Set Minutes'
                                              : 'New Diastolic(${functions.getCardValue(widget.vitalName)?.unit})');
                                        } else if (widget.isEdit) {
                                          return 'Edit Diastolic (mmHg)';
                                        } else {
                                          return (widget.vitalName == 'Sleep'
                                              ? 'Set Minutes'
                                              : 'Set  Diastolic(${functions.getCardValue(widget.vitalName)?.unit})');
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.035,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        color: Color(0xFFBB2828),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize:
                                            MediaQuery.sizeOf(context).width *
                                                0.035,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              TextFormField(
                                controller: _model.enteredVitalTextController5,
                                focusNode: _model.enteredVitalFocusNode5,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.enteredVitalTextController5',
                                  Duration(milliseconds: 0),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10.0, 12.0, 0.0, 14.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: _model
                                    .enteredVitalTextController5Validator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('^(|([1-5]?[0-9]|59))\$'))
                                ],
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 45.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('GOALACTIONSHEET_COMP_UPDATE_BTN_ON_TAP');
                  if (widget.isNewGoal) {
                    if (widget.vitalName == 'BloodPressure') {
                      if (_model.formKey1.currentState == null ||
                          !_model.formKey1.currentState!.validate()) {
                        return;
                      }
                      _model.apiResult17ys = await SetGoalCall.call(
                        userId: FFAppState().userId,
                        type: widget.vitalName,
                        objectJson: <String, String?>{
                          'bp_sys': _model.enteredVitalTextController2.text,
                          'bp_dia': _model.enteredVitalTextController3.text,
                        },
                        baseurl: FFAppState().baseUrl,
                      );

                      if ((_model.apiResult17ys?.succeeded ?? true)) {
                        FFAppState().clearFetchVitlHistoryQueryCache();
                        await widget.updated?.call();
                      }
                    } else {
                      if (widget.vitalName == 'Sleep') {
                        if (_model.formKey2.currentState == null ||
                            !_model.formKey2.currentState!.validate()) {
                          return;
                        }
                        _model.apiResult17ysaa = await SetGoalCall.call(
                          userId: FFAppState().userId,
                          type: widget.vitalName,
                          objectJson: <String, String?>{
                            'hours': _model.enteredVitalTextController4.text,
                            'minutes': functions.validateAndFormatNumber(
                                _model.enteredVitalTextController5.text),
                          },
                          baseurl: FFAppState().baseUrl,
                        );

                        if ((_model.apiResult17ysaa?.succeeded ?? true)) {
                          FFAppState().clearFetchVitlHistoryQueryCache();
                          await widget.updated?.call();
                        }
                      } else {
                        if (_model.formKey3.currentState == null ||
                            !_model.formKey3.currentState!.validate()) {
                          return;
                        }
                        _model.apiResult17ya = await SetGoalCall.call(
                          userId: FFAppState().userId,
                          type: widget.vitalName,
                          value: _model.enteredVitalTextController1.text,
                          baseurl: FFAppState().baseUrl,
                        );

                        if ((_model.apiResult17ya?.succeeded ?? true)) {
                          FFAppState().clearFetchVitlHistoryQueryCache();
                          await widget.updated?.call();
                        }
                      }
                    }
                  } else {
                    if (widget.vitalName == 'BloodPressure') {
                      if (_model.formKey1.currentState == null ||
                          !_model.formKey1.currentState!.validate()) {
                        return;
                      }
                      _model.apiResult11 = await UpdateVitalGoalCall.call(
                        userId: FFAppState().userId,
                        type: widget.vitalName,
                        objectJson: <String, String?>{
                          'bp_sys': _model.enteredVitalTextController2.text,
                          'bp_dia': _model.enteredVitalTextController3.text,
                        },
                        baseurl: FFAppState().baseUrl,
                      );

                      if ((_model.apiResult11?.succeeded ?? true)) {
                        FFAppState().clearFetchVitlHistoryQueryCache();
                        await widget.updated?.call();
                      }
                    } else {
                      if (widget.vitalName == 'Sleep') {
                        if (_model.formKey2.currentState == null ||
                            !_model.formKey2.currentState!.validate()) {
                          return;
                        }
                        _model.apiResult1111 = await UpdateVitalGoalCall.call(
                          userId: FFAppState().userId,
                          type: widget.vitalName,
                          objectJson: <String, String?>{
                            'hours': _model.enteredVitalTextController4.text,
                            'minutes': functions.validateAndFormatNumber(
                                _model.enteredVitalTextController5.text),
                          },
                          baseurl: FFAppState().baseUrl,
                        );

                        if ((_model.apiResult1111?.succeeded ?? true)) {
                          FFAppState().clearFetchVitlHistoryQueryCache();
                          await widget.updated?.call();
                        }
                      } else {
                        if (_model.formKey3.currentState == null ||
                            !_model.formKey3.currentState!.validate()) {
                          return;
                        }
                        _model.apiResult34 = await UpdateVitalGoalCall.call(
                          userId: FFAppState().userId,
                          type: widget.vitalName,
                          value: _model.enteredVitalTextController1.text,
                          baseurl: FFAppState().baseUrl,
                        );

                        if ((_model.apiResult34?.succeeded ?? true)) {
                          FFAppState().clearFetchVitlHistoryQueryCache();
                          await widget.updated?.call();
                        }
                      }
                    }
                  }

                  Navigator.pop(context);

                  safeSetState(() {});
                },
                text: 'Update',
                options: FFButtonOptions(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: valueOrDefault<Color>(
                    FFAppState().theme.primaryColor,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
