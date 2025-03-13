import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/glucose_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_vitals_component_model.dart';
export 'add_vitals_component_model.dart';

class AddVitalsComponentWidget extends StatefulWidget {
  const AddVitalsComponentWidget({
    super.key,
    required this.callback,
    this.isEdit,
    this.vitalToEdit,
    required this.dateTime,
    bool? isAddFromGoal,
    bool? isTask,
    this.taskId,
    this.successCallbackToTask,
    this.bgCallback,
    bool? isPP,
  })  : this.isAddFromGoal = isAddFromGoal ?? false,
        this.isTask = isTask ?? false,
        this.isPP = isPP ?? false;

  final Future Function(bool isNewVItalAdded, String vitalName)? callback;
  final bool? isEdit;
  final VitalsStruct? vitalToEdit;
  final DateTime? dateTime;
  final bool isAddFromGoal;
  final bool isTask;
  final String? taskId;
  final Future Function()? successCallbackToTask;
  final Future Function()? bgCallback;
  final bool isPP;

  @override
  State<AddVitalsComponentWidget> createState() =>
      _AddVitalsComponentWidgetState();
}

class _AddVitalsComponentWidgetState extends State<AddVitalsComponentWidget> {
  late AddVitalsComponentModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddVitalsComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADD_VITALS_COMPONENT_AddVitalsComponent_');
      _model.dateTime =
          widget.isEdit! ? widget.dateTime : getCurrentTimestamp;
      safeSetState(() {});
      safeSetState(() {
        _model.vitalDropDownValueController?.value =
            (widget.isEdit! || widget.isAddFromGoal || widget.isTask
                ? functions.getCardValue(widget.vitalToEdit?.type)!.label
                : 'Weight');
      });
      safeSetState(() {
        _model.enteredVitalTextController?.text =
            (widget.isEdit! ? widget.vitalToEdit!.value : (""));
      });
      safeSetState(() {
        _model.noteTextFieldTextController?.text =
            (widget.isEdit! ? widget.vitalToEdit!.note : (""));
      });
      safeSetState(() {
        _model.bptf1TextController?.text =
            (widget.isEdit! ? widget.vitalToEdit!.object.bpSys : (""));
      });
      safeSetState(() {
        _model.bptf2TextController?.text =
            (widget.isEdit! ? widget.vitalToEdit!.object.bpDia : (""));
      });
      safeSetState(() {
        _model.sleepTF1TextController?.text =
            (widget.isEdit! ? widget.vitalToEdit!.object.hours : (""));
      });
      safeSetState(() {
        _model.sleepTF2TextController?.text =
            (widget.isEdit! ? widget.vitalToEdit!.object.minutes : (""));
      });
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.enteredVitalTextController ??=
        TextEditingController(text: widget.vitalToEdit?.value);
    _model.enteredVitalFocusNode ??= FocusNode();

    _model.bptf1TextController ??= TextEditingController(
        text: (widget.vitalToEdit?.type == 'BloodPressure') && widget.isEdit!
            ? widget.vitalToEdit?.object.hours
            : (""));
    _model.bptf1FocusNode ??= FocusNode();

    _model.bptf2TextController ??= TextEditingController(
        text: (widget.vitalToEdit?.type == 'BloodPressure') && widget.isEdit!
            ? widget.vitalToEdit?.object.minutes
            : '\"\"');
    _model.bptf2FocusNode ??= FocusNode();

    _model.sleepTF1TextController ??= TextEditingController(
        text: (widget.vitalToEdit?.type == 'Sleep') && widget.isEdit!
            ? widget.vitalToEdit?.object.hours
            : (""));
    _model.sleepTF1FocusNode ??= FocusNode();

    _model.sleepTF2TextController ??= TextEditingController(
        text: (widget.vitalToEdit?.type == 'Sleep') && widget.isEdit!
            ? widget.vitalToEdit?.object.minutes
            : (""));
    _model.sleepTF2FocusNode ??= FocusNode();

    _model.noteTextFieldTextController ??= TextEditingController();
    _model.noteTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height -
          FFAppState().statusBarHeight -
          FFAppState().navBarHeight,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 56.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'ADD_VITALS_COMPONENT_Container_mhe6wfj3_');
                    await widget.callback?.call(
                      false,
                      'nil',
                    );
                    _model.listofGlucoseVitals = [];
                    safeSetState(() {});
                  },
                  child: Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  () {
                    if (widget.isEdit!) {
                      return 'Edit Vital';
                    } else if (widget.isTask) {
                      return 'Add Vital';
                    } else {
                      return 'Add Vital';
                    }
                  }(),
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
            thickness: 0.5,
            color: Color(0xCC000000),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Select Vital Type',
                          minFontSize: 10.0,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        FlutterFlowDropDown<String>(
                          controller: _model.vitalDropDownValueController ??=
                              FormFieldController<String>(
                            _model.vitalDropDownValue ??=
                                widget.isTask || widget.isEdit!
                                    ? functions
                                        .getCardValue(widget.vitalToEdit?.type)
                                        ?.label
                                    : 'Weight',
                          ),
                          options: () {
                            if (widget.isEdit! ||
                                widget.isAddFromGoal ||
                                widget.isTask) {
                              return FFAppConstants.listOfEditVitals;
                            } else if (widget.isPP) {
                              return FFAppConstants.ListofVitalsPP;
                            } else {
                              return FFAppConstants.listofVitals;
                            }
                          }(),
                          onChanged: (val) async {
                            safeSetState(() => _model.vitalDropDownValue = val);
                            logFirebaseEvent(
                                'ADD_VITALS_COMPONENT_VitalDropDown_ON_FO');
                            safeSetState(() {
                              _model.enteredVitalTextController?.text = ("");
                            });
                            safeSetState(() {
                              _model.bptf1TextController?.text = ("");
                            });
                            safeSetState(() {
                              _model.bptf2TextController?.text = ("");
                            });
                            safeSetState(() {
                              _model.sleepTF1TextController?.text = ("");
                            });
                            safeSetState(() {
                              _model.sleepTF2TextController?.text = ("");
                            });
                            safeSetState(() {
                              _model.noteTextFieldTextController?.text = ("");
                            });
                            _model.dateTime = getCurrentTimestamp;
                            safeSetState(() {});
                          },
                          height: 40.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          borderWidth: 1.0,
                          borderRadius: 4.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              10.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          disabled: widget.isEdit! ||
                              widget.isAddFromGoal ||
                              widget.isTask,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 20.0))
                    .addToStart(SizedBox(height: 20.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
          ),
          if ((_model.vitalDropDownValue == 'Blood Glucose') &&
              (_model.listofGlucoseVitals.length <= 7))
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nevermind',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Nevermind'),
                            ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_VITALS_COMPONENT_COMP_ADD_BTN_ON_TAP');
                          _model.addToListofGlucoseVitals(VitalsStruct());
                          safeSetState(() {});
                        },
                        text: 'Add',
                        icon: Icon(
                          Icons.add,
                          color: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x003894B5),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: valueOrDefault<Color>(
                                  FFAppState().theme.primaryColor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (_model.vitalDropDownValue != 'Blood Glucose')
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                key: _model.formKey1,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if ((_model.vitalDropDownValue !=
                                            'Blood Pressure') &&
                                        (_model.vitalDropDownValue != 'Sleep'))
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                _model.vitalDropDownValue ==
                                                        'Step Count'
                                                    ? _model.vitalDropDownValue
                                                    : '${_model.vitalDropDownValue} in (${widget.isEdit! ? widget.vitalToEdit?.unit : functions.getCardValue((String vital) {
                                                          return vital
                                                              .replaceAll(
                                                                  " ", '');
                                                        }(_model.vitalDropDownValue!))?.unit})',
                                                'vitals',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily),
                                                  ),
                                            ),
                                            TextSpan(
                                              text: '*',
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
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                    if ((_model.vitalDropDownValue !=
                                            'Blood Pressure') &&
                                        (_model.vitalDropDownValue != 'Sleep'))
                                      TextFormField(
                                        controller:
                                            _model.enteredVitalTextController,
                                        focusNode: _model.enteredVitalFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.enteredVitalTextController',
                                          Duration(milliseconds: 0),
                                          () => safeSetState(() {}),
                                        ),
                                        autofocus: false,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        textInputAction: TextInputAction.done,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 12.0, 0.0, 14.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: _model
                                            .enteredVitalTextControllerValidator
                                            .asValidator(context),
                                      ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                              Form(
                                key: _model.formKey2,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Visibility(
                                  visible: _model.vitalDropDownValue ==
                                      'Blood Pressure',
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.45,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Systolic mmHg',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: '*',
                                                    style: TextStyle(
                                                      color: Color(0xFFC41F1F),
                                                    ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.bptf1TextController,
                                                focusNode:
                                                    _model.bptf1FocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumFamily),
                                                          ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumFamily),
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(10.0, 12.0,
                                                              0.0, 14.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                validator: _model
                                                    .bptf1TextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.45,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Diastolic mmHg',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: '*',
                                                    style: TextStyle(
                                                      color: Color(0xFFC41F1F),
                                                    ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                            TextFormField(
                                              controller:
                                                  _model.bptf2TextController,
                                              focusNode: _model.bptf2FocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 12.0,
                                                            0.0, 14.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              keyboardType: const TextInputType
                                                  .numberWithOptions(
                                                  decimal: true),
                                              validator: _model
                                                  .bptf2TextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Form(
                                key: _model.formKey3,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Visibility(
                                  visible: _model.vitalDropDownValue == 'Sleep',
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Hours',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                    TextSpan(
                                                      text: '*',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFC41F1F),
                                                      ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: _model
                                                    .sleepTF1TextController,
                                                focusNode:
                                                    _model.sleepTF1FocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumFamily),
                                                          ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumFamily),
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(10.0, 12.0,
                                                              0.0, 14.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .sleepTF1TextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          '^(|([1-5]?[0-9]|99))\$'))
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          height: 75.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Minutes',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                    TextSpan(
                                                      text: ' ',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFC41F1F),
                                                      ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              TextFormField(
                                                controller: _model
                                                    .sleepTF2TextController,
                                                focusNode:
                                                    _model.sleepTF2FocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumFamily),
                                                          ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumFamily),
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(10.0, 12.0,
                                                              0.0, 14.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .sleepTF2TextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          '^([1-9]|[1-5][0-9])\$'))
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.44,
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    'Date',
                                    minFontSize: 10.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ADD_VITALS_COMPONENT_Container_gwddvmdj_');
                                      final _datePicked1Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: ((widget.isEdit!
                                                ? widget.dateTime
                                                : getCurrentTimestamp) ??
                                            DateTime.now()),
                                        firstDate: DateTime(1900),
                                        lastDate: (getCurrentTimestamp ??
                                            DateTime(2050)),
                                        builder: (context, child) {
                                          return wrapInMaterialDatePickerTheme(
                                            context,
                                            child!,
                                            headerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            headerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            headerTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLargeFamily,
                                                      fontSize: 32.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily),
                                                    ),
                                            pickerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            pickerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            selectedDateTimeBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            selectedDateTimeForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            actionButtonForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 24.0,
                                          );
                                        },
                                      );

                                      if (_datePicked1Date != null) {
                                        safeSetState(() {
                                          _model.datePicked1 = DateTime(
                                            _datePicked1Date.year,
                                            _datePicked1Date.month,
                                            _datePicked1Date.day,
                                          );
                                        });
                                      } else if (_model.datePicked1 != null) {
                                        safeSetState(() {
                                          _model.datePicked1 = (widget.isEdit!
                                              ? widget.dateTime
                                              : getCurrentTimestamp);
                                        });
                                      }
                                      if (_model.datePicked1 != null) {
                                        _model.dateTime = _model.datePicked1;
                                        safeSetState(() {});
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                dateTimeFormat(
                                                  "d-M-y",
                                                  _model.dateTime,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Icon(
                                                Icons.calendar_today_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.44,
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    'Time',
                                    minFontSize: 10.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'ADD_VITALS_COMPONENT_Container_ljovzzwr_');

                                      final _datePicked2Time =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            (_model.dateTime ??
                                                DateTime.now())),
                                        builder: (context, child) {
                                          return wrapInMaterialTimePickerTheme(
                                            context,
                                            child!,
                                            headerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            headerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            headerTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .override(
                                                      fontFamily: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLargeFamily,
                                                      fontSize: 32.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily),
                                                    ),
                                            pickerBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            pickerForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            selectedDateTimeBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            selectedDateTimeForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            actionButtonForegroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 24.0,
                                          );
                                        },
                                      );
                                      if (_datePicked2Time != null) {
                                        safeSetState(() {
                                          _model.datePicked2 = DateTime(
                                            (_model.dateTime ?? DateTime.now())
                                                .year,
                                            (_model.dateTime ?? DateTime.now())
                                                .month,
                                            (_model.dateTime ?? DateTime.now())
                                                .day,
                                            _datePicked2Time.hour,
                                            _datePicked2Time.minute,
                                          );
                                        });
                                      } else if (_model.datePicked2 != null) {
                                        safeSetState(() {
                                          _model.datePicked2 = _model.dateTime;
                                        });
                                      }
                                      if (_model.datePicked2 != null) {
                                        if (functions.isNotFutureDate(
                                            _model.datePicked2!)) {
                                          _model.dateTime = _model.datePicked2;
                                          safeSetState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Future time  not allowed.',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                dateTimeFormat(
                                                  "h:mm a",
                                                  _model.dateTime,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                              Icon(
                                                Icons.access_time,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Notes',
                                minFontSize: 10.0,
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
                              Container(
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 5.0),
                                  child: TextFormField(
                                    controller:
                                        _model.noteTextFieldTextController,
                                    focusNode: _model.noteTextFieldFocusNode,
                                    autofocus: false,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      hintText: 'Add your description here...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    maxLines: 20,
                                    validator: _model
                                        .noteTextFieldTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                ),
              ),
            ),
          if ((_model.vitalDropDownValue != 'Blood Glucose') &&
              !(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_VITALS_COMPONENT_CANCEL_BTN_ON_TAP');
                          if (widget.isTask) {
                            await widget.successCallbackToTask?.call();
                          } else {
                            await widget.callback?.call(
                              false,
                              'nil',
                            );
                          }
                        },
                        text: 'Cancel',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: valueOrDefault<Color>(
                                  FFAppState().theme.primaryColor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                              FFAppState().theme.primaryColor,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_VITALS_COMPONENT_ADD_VITAL_BTN_ON_TA');
                          if (_model.vitalDropDownValue == 'Blood Pressure') {
                            if (_model.formKey2.currentState == null ||
                                !_model.formKey2.currentState!.validate()) {
                              return;
                            }
                            if (widget.isEdit!) {
                              _model.apiResultsgqa =
                                  await UpdateVitalHistoryCall.call(
                                userId: FFAppState().userId,
                                id: widget.vitalToEdit?.id,
                                date: _model.dateTime?.millisecondsSinceEpoch
                                    .toString(),
                                time: _model.dateTime?.millisecondsSinceEpoch
                                    .toString(),
                                entryType: 'Manual',
                                note: functions.escapeDoubleQuotes(
                                    _model.noteTextFieldTextController.text),
                                type: widget.vitalToEdit?.type,
                                objectJson: _model.vitalDropDownValue ==
                                        'Blood Pressure'
                                    ? <String, String?>{
                                        'bp_sys':
                                            _model.bptf1TextController.text,
                                        'bp_dia':
                                            _model.bptf2TextController.text,
                                      }
                                    : <String, String?>{
                                        'hours':
                                            _model.bptf1TextController.text,
                                        'minutes':
                                            _model.bptf2TextController.text,
                                      },
                                baseurl: FFAppState().baseUrl,
                              );

                              if ((_model.apiResultsgqa?.succeeded ?? true)) {
                                await widget.callback?.call(
                                  false,
                                  'nil',
                                );
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Something went wrong'),
                                      content: Text(
                                          'Please try again after sometime'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Okay'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                await action_blocks.sessionExpired(
                                  context,
                                  statusCode:
                                      (_model.apiResultsgqa?.statusCode ?? 200),
                                );
                              }
                            } else {
                              _model.apiResultsg = await AddVitalsCall.call(
                                type: functions
                                    .getCardValueApi(_model.vitalDropDownValue)
                                    ?.type,
                                note: functions.escapeDoubleQuotes(
                                    _model.noteTextFieldTextController.text),
                                date: _model.dateTime?.millisecondsSinceEpoch
                                    .toString(),
                                userId: FFAppState().userId,
                                objectJson: _model.vitalDropDownValue ==
                                        'Blood Pressure'
                                    ? <String, String?>{
                                        'bp_sys':
                                            _model.bptf1TextController.text,
                                        'bp_dia':
                                            _model.bptf2TextController.text,
                                      }
                                    : <String, String?>{
                                        'hours':
                                            _model.bptf1TextController.text,
                                        'minutes':
                                            _model.bptf2TextController.text,
                                      },
                                baseurl: FFAppState().baseUrl,
                                taskId: widget.taskId != null &&
                                        widget.taskId != ''
                                    ? widget.taskId
                                    : (""),
                              );

                              if ((_model.apiResultsg?.succeeded ?? true)) {
                                if (widget.isTask) {
                                  _model.apiResult3k7 =
                                      await TaskGroup.submittaskCall.call(
                                    jsonJson: functions.createtaskResponse(
                                        '', '', widget.taskId!),
                                    userId: FFAppState().userId,
                                    baseurl: FFAppState().baseUrl,
                                  );

                                  if ((_model.apiResult3k7?.succeeded ??
                                      true)) {
                                    await widget.successCallbackToTask?.call();
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Something went wrong'),
                                          content: Text(
                                              'Please try again after sometime'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Okay'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  await widget.callback?.call(
                                    true,
                                    functions
                                        .getCardValueApi(
                                            _model.vitalDropDownValue)!
                                        .type,
                                  );
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Something went wrong'),
                                      content: Text(
                                          'Please try again after sometime'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Okay'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                await action_blocks.sessionExpired(
                                  context,
                                  statusCode:
                                      (_model.apiResultsg?.statusCode ?? 200),
                                );
                              }
                            }
                          } else {
                            if (_model.vitalDropDownValue == 'Sleep') {
                              safeSetState(() {
                                _model.sleepTF2TextController?.text = (_model.sleepTF2TextController.text != ''
                                    ? _model.sleepTF2TextController.text
                                    : '0');
                              });
                              if (_model.formKey3.currentState == null ||
                                  !_model.formKey3.currentState!.validate()) {
                                return;
                              }
                              if (widget.isEdit!) {
                                _model.apiResultsgqa1 =
                                    await UpdateVitalHistoryCall.call(
                                  userId: FFAppState().userId,
                                  id: widget.vitalToEdit?.id,
                                  date: _model.dateTime?.millisecondsSinceEpoch
                                      .toString(),
                                  time: _model.dateTime?.millisecondsSinceEpoch
                                      .toString(),
                                  entryType: 'Manual',
                                  note: functions.escapeDoubleQuotes(
                                      _model.noteTextFieldTextController.text),
                                  type: widget.vitalToEdit?.type,
                                  objectJson: _model.vitalDropDownValue ==
                                          'Blood Pressure'
                                      ? <String, String?>{
                                          'bp_sys':
                                              _model.bptf1TextController.text,
                                          'bp_dia':
                                              _model.bptf2TextController.text,
                                        }
                                      : <String, String?>{
                                          'hours': functions
                                              .validateAndFormatNumber(_model
                                                  .sleepTF1TextController.text),
                                          'minutes': functions
                                              .validateAndFormatNumber(_model
                                                  .sleepTF2TextController.text),
                                        },
                                  baseurl: FFAppState().baseUrl,
                                );

                                if ((_model.apiResultsgqa1?.succeeded ??
                                    true)) {
                                  await widget.callback?.call(
                                    false,
                                    'nil',
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Something went wrong'),
                                        content: Text(
                                            'Please try again after sometime'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Okay'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  await action_blocks.sessionExpired(
                                    context,
                                    statusCode:
                                        (_model.apiResultsgqa1?.statusCode ??
                                            200),
                                  );
                                }
                              } else {
                                _model.apiResultsg222 =
                                    await AddVitalsCall.call(
                                  type: functions
                                      .getCardValueApi(
                                          _model.vitalDropDownValue)
                                      ?.type,
                                  note: functions.escapeDoubleQuotes(
                                      _model.noteTextFieldTextController.text),
                                  date: _model.dateTime?.millisecondsSinceEpoch
                                      .toString(),
                                  userId: FFAppState().userId,
                                  objectJson: _model.vitalDropDownValue ==
                                          'Blood Pressure'
                                      ? <String, String?>{
                                          'bp_sys':
                                              _model.bptf1TextController.text,
                                          'bp_dia':
                                              _model.bptf2TextController.text,
                                        }
                                      : <String, String?>{
                                          'hours': functions
                                              .validateAndFormatNumber(_model
                                                  .sleepTF1TextController.text),
                                          'minutes': functions
                                              .validateAndFormatNumber(_model
                                                  .sleepTF2TextController.text),
                                        },
                                  baseurl: FFAppState().baseUrl,
                                  taskId: widget.taskId != null &&
                                          widget.taskId != ''
                                      ? widget.taskId
                                      : (""),
                                );

                                if ((_model.apiResultsg222?.succeeded ??
                                    true)) {
                                  if (widget.isTask) {
                                    _model.apiResult3 =
                                        await TaskGroup.submittaskCall.call(
                                      jsonJson: functions.createtaskResponse(
                                          '', '', widget.taskId!),
                                      userId: FFAppState().userId,
                                      baseurl: FFAppState().baseUrl,
                                    );

                                    if ((_model.apiResult3?.succeeded ??
                                        true)) {
                                      await widget.successCallbackToTask
                                          ?.call();
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Something went wrong'),
                                            content: Text(
                                                'Please try again after sometime'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Okay'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  } else {
                                    await widget.callback?.call(
                                      true,
                                      functions
                                          .getCardValueApi(
                                              _model.vitalDropDownValue)!
                                          .type,
                                    );
                                  }
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Something went wrong'),
                                        content: Text(
                                            'Please try again after sometime'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Okay'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  await action_blocks.sessionExpired(
                                    context,
                                    statusCode:
                                        (_model.apiResultsg222?.statusCode ??
                                            200),
                                  );
                                }
                              }
                            } else {
                              if (_model.vitalDropDownValue == 'Step Count') {
                                if (functions.isAValidNumber(
                                    _model.enteredVitalTextController.text)) {
                                  if (widget.isEdit!) {
                                    _model.apiResultsgqa1111 =
                                        await UpdateVitalHistoryCall.call(
                                      userId: FFAppState().userId,
                                      id: widget.vitalToEdit?.id,
                                      date: _model
                                          .dateTime?.millisecondsSinceEpoch
                                          .toString(),
                                      time: _model
                                          .dateTime?.millisecondsSinceEpoch
                                          .toString(),
                                      entryType: 'Manual',
                                      note: functions.escapeDoubleQuotes(_model
                                          .noteTextFieldTextController.text),
                                      type: widget.vitalToEdit?.type,
                                      value: _model
                                          .enteredVitalTextController.text,
                                      baseurl: FFAppState().baseUrl,
                                    );

                                    if ((_model.apiResultsgqa1111?.succeeded ??
                                        true)) {
                                      await widget.callback?.call(
                                        false,
                                        'nil',
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Something went wrong'),
                                            content: Text(
                                                'Please try again after sometime'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Okay'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      await action_blocks.sessionExpired(
                                        context,
                                        statusCode: (_model.apiResultsgqa1111
                                                ?.statusCode ??
                                            200),
                                      );
                                    }
                                  } else {
                                    _model.apiResultsgwe12345 =
                                        await AddVitalsCall.call(
                                      type: functions
                                          .getCardValueApi(
                                              _model.vitalDropDownValue)
                                          ?.type,
                                      value: _model
                                          .enteredVitalTextController.text,
                                      note: functions.escapeDoubleQuotes(_model
                                          .noteTextFieldTextController.text),
                                      date: _model
                                          .dateTime?.millisecondsSinceEpoch
                                          .toString(),
                                      userId: FFAppState().userId,
                                      baseurl: FFAppState().baseUrl,
                                      taskId: widget.taskId != null &&
                                              widget.taskId != ''
                                          ? widget.taskId
                                          : (""),
                                    );

                                    if ((_model.apiResultsgwe12345?.succeeded ??
                                        true)) {
                                      if (widget.isTask) {
                                        _model.apiResult322 =
                                            await TaskGroup.submittaskCall.call(
                                          jsonJson:
                                              functions.createtaskResponse(
                                                  '', '', widget.taskId!),
                                          userId: FFAppState().userId,
                                          baseurl: FFAppState().baseUrl,
                                        );

                                        if ((_model.apiResult322?.succeeded ??
                                            true)) {
                                          await widget.successCallbackToTask
                                              ?.call();
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Something went wrong'),
                                                content: Text(
                                                    'Please try again after sometime'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Okay'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        await widget.callback?.call(
                                          true,
                                          functions
                                              .getCardValueApi(
                                                  _model.vitalDropDownValue)!
                                              .type,
                                        );
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Something went wrong'),
                                            content: Text(
                                                'Please try again after sometime'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Okay'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      await action_blocks.sessionExpired(
                                        context,
                                        statusCode: (_model.apiResultsgwe12345
                                                ?.statusCode ??
                                            200),
                                      );
                                    }
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Enter a valid step count',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor: Color(0xFF6E6E6E),
                                    ),
                                  );
                                }
                              } else {
                                if (_model.vitalDropDownValue ==
                                    'Baby Kick Count') {
                                  if (_model.enteredVitalTextController.text !=
                                          '') {
                                    if (widget.isEdit!) {
                                      _model.apiResultsgqa112233 =
                                          await UpdateVitalHistoryCall.call(
                                        userId: FFAppState().userId,
                                        id: widget.vitalToEdit?.id,
                                        date: _model
                                            .dateTime?.millisecondsSinceEpoch
                                            .toString(),
                                        time: _model
                                            .dateTime?.millisecondsSinceEpoch
                                            .toString(),
                                        entryType: 'Manual',
                                        note: functions.escapeDoubleQuotes(
                                            _model.noteTextFieldTextController
                                                .text),
                                        type: widget.vitalToEdit?.type,
                                        value: _model
                                            .enteredVitalTextController.text,
                                        baseurl: FFAppState().baseUrl,
                                      );

                                      if ((_model
                                              .apiResultsgqa112233?.succeeded ??
                                          true)) {
                                        await widget.callback?.call(
                                          false,
                                          'nil',
                                        );
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  Text('Something went wrong'),
                                              content: Text(
                                                  'Please try again after sometime'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Okay'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        await action_blocks.sessionExpired(
                                          context,
                                          statusCode: (_model
                                                  .apiResultsgqa112233
                                                  ?.statusCode ??
                                              200),
                                        );
                                      }
                                    } else {
                                      _model.apiResultsgwe11111 =
                                          await AddVitalsCall.call(
                                        type: functions
                                            .getCardValueApi(
                                                _model.vitalDropDownValue)
                                            ?.type,
                                        value: _model
                                            .enteredVitalTextController.text,
                                        note: functions.escapeDoubleQuotes(
                                            _model.noteTextFieldTextController
                                                .text),
                                        date: _model
                                            .dateTime?.millisecondsSinceEpoch
                                            .toString(),
                                        userId: FFAppState().userId,
                                        baseurl: FFAppState().baseUrl,
                                        taskId: widget.taskId != null &&
                                                widget.taskId != ''
                                            ? widget.taskId
                                            : (""),
                                      );

                                      if ((_model
                                              .apiResultsgwe11111?.succeeded ??
                                          true)) {
                                        if (widget.isTask) {
                                          _model.apiResult321kick =
                                              await TaskGroup.submittaskCall
                                                  .call(
                                            jsonJson:
                                                functions.createtaskResponse(
                                                    '', '', widget.taskId!),
                                            userId: FFAppState().userId,
                                            baseurl: FFAppState().baseUrl,
                                          );

                                          if ((_model.apiResult321kick
                                                  ?.succeeded ??
                                              true)) {
                                            await widget.successCallbackToTask
                                                ?.call();
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Something went wrong'),
                                                  content: Text(
                                                      'Please try again after sometime'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Okay'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        } else {
                                          await widget.callback?.call(
                                            true,
                                            functions
                                                .getCardValueApi(
                                                    _model.vitalDropDownValue)!
                                                .type,
                                          );
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  Text('Something went wrong'),
                                              content: Text(
                                                  'Please try again after sometime'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Okay'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        await action_blocks.sessionExpired(
                                          context,
                                          statusCode: (_model.apiResultsgwe11111
                                                  ?.statusCode ??
                                              200),
                                        );
                                      }
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Enter a valid baby count',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 2000),
                                        backgroundColor: Color(0xFF6E6E6E),
                                      ),
                                    );
                                  }
                                } else {
                                  if (_model.formKey1.currentState == null ||
                                      !_model.formKey1.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (widget.isEdit!) {
                                    _model.apiResultsgqa11111 =
                                        await UpdateVitalHistoryCall.call(
                                      userId: FFAppState().userId,
                                      id: widget.vitalToEdit?.id,
                                      date: _model
                                          .dateTime?.millisecondsSinceEpoch
                                          .toString(),
                                      time: _model
                                          .dateTime?.millisecondsSinceEpoch
                                          .toString(),
                                      entryType: 'Manual',
                                      note: functions.escapeDoubleQuotes(_model
                                          .noteTextFieldTextController.text),
                                      type: widget.vitalToEdit?.type,
                                      value: _model
                                          .enteredVitalTextController.text,
                                      baseurl: FFAppState().baseUrl,
                                    );

                                    if ((_model.apiResultsgqa11111?.succeeded ??
                                        true)) {
                                      await widget.callback?.call(
                                        false,
                                        'nil',
                                      );
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Something went wrong'),
                                            content: Text(
                                                'Please try again after sometime'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Okay'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      await action_blocks.sessionExpired(
                                        context,
                                        statusCode: (_model.apiResultsgqa11111
                                                ?.statusCode ??
                                            200),
                                      );
                                    }
                                  } else {
                                    _model.apiResultsgwe =
                                        await AddVitalsCall.call(
                                      type: functions
                                          .getCardValueApi(
                                              _model.vitalDropDownValue)
                                          ?.type,
                                      value: _model
                                          .enteredVitalTextController.text,
                                      note: functions.escapeDoubleQuotes(_model
                                          .noteTextFieldTextController.text),
                                      date: _model
                                          .dateTime?.millisecondsSinceEpoch
                                          .toString(),
                                      userId: FFAppState().userId,
                                      baseurl: FFAppState().baseUrl,
                                      taskId: widget.taskId != null &&
                                              widget.taskId != ''
                                          ? widget.taskId
                                          : (""),
                                    );

                                    if ((_model.apiResultsgwe?.succeeded ??
                                        true)) {
                                      if (widget.isTask) {
                                        _model.apiResult321 =
                                            await TaskGroup.submittaskCall.call(
                                          jsonJson:
                                              functions.createtaskResponse(
                                                  '', '', widget.taskId!),
                                          userId: FFAppState().userId,
                                          baseurl: FFAppState().baseUrl,
                                        );

                                        if ((_model.apiResult321?.succeeded ??
                                            true)) {
                                          await widget.successCallbackToTask
                                              ?.call();
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Something went wrong'),
                                                content: Text(
                                                    'Please try again after sometime'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Okay'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        await widget.callback?.call(
                                          true,
                                          functions
                                              .getCardValueApi(
                                                  _model.vitalDropDownValue)!
                                              .type,
                                        );
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Something went wrong'),
                                            content: Text(
                                                'Please try again after sometime'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Okay'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      await action_blocks.sessionExpired(
                                        context,
                                        statusCode:
                                            (_model.apiResultsgwe?.statusCode ??
                                                200),
                                      );
                                    }
                                  }
                                }
                              }
                            }
                          }

                          safeSetState(() {});
                          FFAppState().refreshGraph =
                              !(FFAppState().refreshGraph ?? true);
                          _model.updatePage(() {});

                          safeSetState(() {});
                        },
                        text: widget.isEdit! ? 'Save' : 'Add Vital',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (_model.vitalDropDownValue == 'Blood Glucose')
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Builder(
                  builder: (context) {
                    final gItem = _model.listofGlucoseVitals.toList();

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(gItem.length, (gItemIndex) {
                          final gItemItem = gItem[gItemIndex];
                          return GlucoseComponentWidget(
                            key: Key('Keyqxs_${gItemIndex}_of_${gItem.length}'),
                            vital: gItemItem,
                            deleteAction: () async {
                              logFirebaseEvent(
                                  'ADD_VITALS_COMPONENT_Container_qxsuobve_');
                              _model.removeAtIndexFromListofGlucoseVitals(
                                  gItemIndex);
                              safeSetState(() {});
                            },
                            vitalAction: (vital) async {
                              logFirebaseEvent(
                                  'ADD_VITALS_COMPONENT_Container_qxsuobve_');
                              _model.updateListofGlucoseVitalsAtIndex(
                                gItemIndex,
                                (_) => vital,
                              );
                              safeSetState(() {});
                            },
                          );
                        })
                            .divide(SizedBox(height: 10.0))
                            .addToStart(SizedBox(height: 10.0))
                            .addToEnd(SizedBox(height: 10.0)),
                      ),
                    );
                  },
                ),
              ),
            ),
          if ((_model.vitalDropDownValue == 'Blood Glucose') &&
              (_model.listofGlucoseVitals.length > 0))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_VITALS_COMPONENT_CANCEL_BTN_ON_TAP');
                          if (widget.isTask) {
                            await widget.successCallbackToTask?.call();
                          } else {
                            await widget.callback?.call(
                              false,
                              'nil',
                            );
                          }
                        },
                        text: 'Cancel',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: valueOrDefault<Color>(
                                  FFAppState().theme.primaryColor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                              FFAppState().theme.primaryColor,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_VITALS_COMPONENT_ADD_VITAL_BTN_ON_TA');
                          if (functions
                                  .validateVitals(
                                      _model.listofGlucoseVitals.toList())
                                  .isValid ==
                              true) {
                            _model.apiResultvpd = await AddBGVitalCall.call(
                              baseurl: FFAppState().baseUrl,
                              userId: FFAppState().userId,
                              dataJson: functions.convertListToJson(
                                  _model.listofGlucoseVitals.toList()),
                            );

                            if ((_model.apiResultvpd?.succeeded ?? true)) {
                              if (widget.isTask) {
                                _model.apiResultbbh =
                                    await TaskGroup.submittaskCall.call(
                                  jsonJson: functions.createtaskResponse(
                                      '', '', widget.taskId!),
                                  userId: FFAppState().userId,
                                  baseurl: FFAppState().baseUrl,
                                );

                                if ((_model.apiResultbbh?.succeeded ?? true)) {
                                  await widget.bgCallback?.call();
                                  _model.enableSubmitButton = true;
                                  _model.listofGlucoseVitals = [];
                                  safeSetState(() {});
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Something went wrong'),
                                        content: Text('Please try again'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                await widget.bgCallback?.call();
                                _model.enableSubmitButton = true;
                                _model.listofGlucoseVitals = [];
                                safeSetState(() {});
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  functions
                                      .validateVitals(
                                          _model.listofGlucoseVitals.toList())
                                      .errorMessage,
                                  style: TextStyle(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF6E6E6E),
                              ),
                            );
                          }

                          safeSetState(() {});
                        },
                        text: widget.isEdit! ? 'Save' : 'Add Vital',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ].addToEnd(SizedBox(height: 15.0)),
      ),
    );
  }
}
