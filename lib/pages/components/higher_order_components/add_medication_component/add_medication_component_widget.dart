import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/micro_components/form_components/frequency_component/frequency_component_widget.dart';
import '/pages/components/micro_components/medication_components/drop_down_field/drop_down_field_widget.dart';
import '/pages/components/micro_components/medication_components/single_form/single_form_widget.dart';
import '/pages/components/micro_components/medication_components/single_form_dropdown/single_form_dropdown_widget.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_medication_component_model.dart';
export 'add_medication_component_model.dart';

class AddMedicationComponentWidget extends StatefulWidget {
  const AddMedicationComponentWidget({
    super.key,
    this.medication,
    required this.callbackAddMedication,
    bool? isEdit,
    bool? isUpcoming,
    bool? istask,
    this.taskId,
  })  : this.isEdit = isEdit ?? false,
        this.isUpcoming = isUpcoming ?? false,
        this.istask = istask ?? false;

  final MedicationModelStruct? medication;
  final Future Function()? callbackAddMedication;
  final bool isEdit;
  final bool isUpcoming;
  final bool istask;
  final String? taskId;

  @override
  State<AddMedicationComponentWidget> createState() =>
      _AddMedicationComponentWidgetState();
}

class _AddMedicationComponentWidgetState
    extends State<AddMedicationComponentWidget> {
  late AddMedicationComponentModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;
  bool medicationNameFocusListenerRegistered = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMedicationComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADD_MEDICATION_COMPONENT_AddMedicationCo');
      _model.results = [];
      _model.isReminderSelected = false;
      _model.frequency = null;
      _model.isMedSet = false;
      _model.isDosage = false;
      _model.startDate = functions.convertStringToDate(widget.isEdit
          ? widget.medication!.startDate
          : getCurrentTimestamp.toString());
      _model.endDate = functions.convertStringToDate(widget.isEdit
          ? widget.medication!.endDate
          : getCurrentTimestamp.toString());
      _model.isSosSelected = false;
      _model.updatePage(() {});
      safeSetState(() {
        _model.medicationNameTextController?.text =
            (widget.isEdit ? widget.medication!.name : (""));
      });
      safeSetState(() {
        _model.dosageModel.singleFormModel.enteredValueTextController?.text =
            (widget.isEdit ? widget.medication!.dosage : (""));
      });
      safeSetState(() {
        _model.dosageModel.unitDropdownModel.vitalDropDownValueController
            ?.value = (widget.isEdit ? widget.medication!.units : (""));
      });
      safeSetState(() {
        _model.instructionsModel.dropdownModel.vitalDropDownValueController
            ?.value = (widget.isEdit ? widget.medication!.instruction : (""));
      });
      safeSetState(() {
        _model.howOftenModel.dropdownModel.vitalDropDownValueController?.value =
            (widget.isEdit
                ? widget.medication!.howOften
                : FFAppConstants.oftenOption.firstOrNull!);
      });
      safeSetState(() {
        _model.criticalValue =
            (widget.isEdit ? widget.medication!.isCritical : false);
      });
      safeSetState(() {
        _model.additionalNoteTextController?.text =
            (widget.isEdit ? widget.medication!.additionalNote : (""));
      });
      safeSetState(() {
        _model.periodModel.enteredValueTextController?.text = (widget.isEdit
            ? functions
                .differenceBetweenDate(
                    functions
                        .convertStringToDate(widget.medication!.startDate),
                    functions.convertStringToDate(widget.medication!.endDate))
                .toString()
            : '1');
      });
      _model.period = functions.differenceBetweenDate(
          functions.convertStringToDate(widget.medication!.startDate),
          getCurrentTimestamp);
      _model.updateFrequencyStruct(
        (e) => e
          ..morning = '6:00 AM'
          ..afternoon = '11:00 AM'
          ..evening = '4:00 PM'
          ..night = '7:00 PM',
      );
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          if (widget.medication?.reminderTimings != null) {
            _model.updateFrequencyStruct(
              (e) => e
                ..morning = widget.medication?.reminderTimings.morning
                ..afternoon = widget.medication?.reminderTimings.afternoon
                ..evening = widget.medication?.reminderTimings.evening
                ..night = widget.medication?.reminderTimings.night,
            );
            _model.updatePage(() {});
          }
        }),
        Future(() async {
          if (widget.medication?.autoReminder != null) {
            _model.isReminderSelected = widget.medication!.autoReminder;
            safeSetState(() {});
          }
        }),
        Future(() async {
          if (widget.medication?.time.contains('SOS') == true) {
            _model.isSosSelected = true;
            _model.startDate = getCurrentTimestamp;
            _model.endDate = getCurrentTimestamp;
            safeSetState(() {});
          }
        }),
      ]);
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.medicationNameTextController ??= TextEditingController(
        text: widget.medication?.name != null && widget.medication?.name != ''
            ? widget.medication?.name
            : (""));

    _model.additionalNoteTextController ??= TextEditingController(
        text: widget.medication?.additionalNote != null &&
                widget.medication?.additionalNote != ''
            ? widget.medication?.additionalNote
            : (""));
    _model.additionalNoteFocusNode ??= FocusNode();

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
      height: MediaQuery.sizeOf(context).height -
          FFAppState().statusBarHeight -
          (widget.isUpcoming ? 0.0 : FFAppState().navBarHeight),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
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
                        'ADD_MEDICATION_COMPONENT_Container_saslr');
                    if (widget.isUpcoming) {
                      context.safePop();
                    } else {
                      await widget.callbackAddMedication?.call();
                      _model.results = [];
                      _model.pageNumber = 1;
                      _model.loadMoreResults = [];
                      _model.showSuggestionList = false;
                      safeSetState(() {});
                    }
                  },
                  child: Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
                Text(
                  widget.isUpcoming || widget.isEdit
                      ? 'Edit Medication'
                      : 'Add Medication',
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
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Medication Name',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                  color: Color(0xFFF24E4E),
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
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                            child: Autocomplete<String>(
                              initialValue: TextEditingValue(
                                  text: widget.medication?.name != null &&
                                          widget.medication?.name != ''
                                      ? widget.medication!.name
                                      : ("")),
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return <String>[].where((option) {
                                  final lowercaseOption = option.toLowerCase();
                                  return lowercaseOption.contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                return AutocompleteOptionsList(
                                  textFieldKey: _model.medicationNameKey,
                                  textController:
                                      _model.medicationNameTextController!,
                                  options: options.toList(),
                                  onSelected: onSelected,
                                  textStyle: FlutterFlowTheme.of(context)
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
                                  textHighlightStyle: TextStyle(),
                                  elevation: 4.0,
                                  optionBackgroundColor:
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  optionHighlightColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  maxHeight: 200.0,
                                );
                              },
                              onSelected: (String selection) {
                                safeSetState(() => _model
                                    .medicationNameSelectedOption = selection);
                                FocusScope.of(context).unfocus();
                              },
                              fieldViewBuilder: (
                                context,
                                textEditingController,
                                focusNode,
                                onEditingComplete,
                              ) {
                                _model.medicationNameFocusNode = focusNode;
                                if (!medicationNameFocusListenerRegistered) {
                                  medicationNameFocusListenerRegistered = true;
                                  _model.medicationNameFocusNode!.addListener(
                                    () async {
                                      logFirebaseEvent(
                                          'ADD_MEDICATION_COMPONENT_medicationName_');
                                      await actions.hideKeyboard();
                                    },
                                  );
                                }
                                _model.medicationNameTextController =
                                    textEditingController;
                                return TextFormField(
                                  key: _model.medicationNameKey,
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.medicationNameTextController',
                                    Duration(milliseconds: 0),
                                    () async {
                                      logFirebaseEvent(
                                          'ADD_MEDICATION_COMPONENT_medicationName_');
                                      if (_model.medicationNameTextController
                                              .text !=
                                          ("")) {
                                        _model.search = _model
                                            .medicationNameTextController.text;
                                        _model.pageNumber = 1;
                                        _model.loadMoreResults = [];
                                        _model.showSuggestionList = false;
                                        _model.results = [];
                                        _model.updatePage(() {});
                                        _model.apiResultpmg = await HocGroup
                                            .searchMedicationCall
                                            .call(
                                          search: _model
                                              .medicationNameTextController
                                              .text,
                                          userId: FFAppState().userId,
                                          page: _model.pageNumber,
                                          baseurl: FFAppState().baseUrl,
                                        );

                                        if ((_model.apiResultpmg?.succeeded ??
                                            true)) {
                                          _model.showSuggestionList =
                                              (getJsonField(
                                                    (_model.apiResultpmg
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.results''',
                                                  )
                                                              .toList()
                                                              .map<ResultsStruct?>(
                                                                  ResultsStruct
                                                                      .maybeFromMap)
                                                              .toList()
                                                          as Iterable<
                                                              ResultsStruct?>)
                                                      .withoutNulls
                                                      .length >
                                                  0;
                                          _model.results = (getJsonField(
                                            (_model.apiResultpmg?.jsonBody ??
                                                ''),
                                            r'''$.results''',
                                            true,
                                          )!
                                                      .toList()
                                                      .map<ResultsStruct?>(
                                                          ResultsStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<ResultsStruct?>)
                                              .withoutNulls
                                              .toList()
                                              .cast<ResultsStruct>();
                                          safeSetState(() {});
                                          _model.loadMoreResults = functions
                                              .addLoadMore(
                                                  (getJsonField(
                                                    (_model.apiResultpmg
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.results''',
                                                    true,
                                                  )!
                                                              .toList()
                                                              .map<ResultsStruct?>(
                                                                  ResultsStruct
                                                                      .maybeFromMap)
                                                              .toList()
                                                          as Iterable<
                                                              ResultsStruct?>)
                                                      .withoutNulls
                                                      .toList(),
                                                  SearchResultStruct.maybeFromMap(
                                                              (_model.apiResultpmg
                                                                      ?.jsonBody ??
                                                                  ''))!
                                                          .total >
                                                      _model.results.length)
                                              .toList()
                                              .cast<String>();
                                          safeSetState(() {});
                                        }
                                      } else {
                                        _model.results = [];
                                        safeSetState(() {});
                                        _model.loadMoreResults = [];
                                        safeSetState(() {});
                                        _model.showSuggestionList = false;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
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
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x805D6A85),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
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
                                  minLines: 1,
                                  validator: _model
                                      .medicationNameTextControllerValidator
                                      .asValidator(context),
                                );
                              },
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            if (_model.showSuggestionList)
                              GestureDetector(
                                onHorizontalDragDown: (details) async {
                                  logFirebaseEvent(
                                      'ADD_MEDICATION_COMPONENT_Container_ymtwj');
                                  await actions.hideKeyboard();
                                },
                                child: Container(
                                  height: (getJsonField(
                                            (_model.apiResultpmg?.jsonBody ??
                                                ''),
                                            r'''$.results''',
                                          )
                                                      .toList()
                                                      .map<ResultsStruct?>(
                                                          ResultsStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<ResultsStruct?>)
                                              .withoutNulls
                                              .length >
                                          10
                                      ? 340.0
                                      : ((getJsonField(
                                            (_model.apiResultpmg?.jsonBody ??
                                                ''),
                                            r'''$.results''',
                                          )
                                                      .toList()
                                                      .map<ResultsStruct?>(
                                                          ResultsStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<ResultsStruct?>)
                                              .withoutNulls
                                              .length *
                                          34),
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final list =
                                            _model.loadMoreResults.toList();
                                        if (list.isEmpty) {
                                          return NoDataComponentWidget(
                                            name: 'Medication',
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15.0),
                                          scrollDirection: Axis.vertical,
                                          itemCount: list.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 15.0),
                                          itemBuilder: (context, listIndex) {
                                            final listItem = list[listIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'ADD_MEDICATION_COMPONENT_Text_gq5al88x_O');
                                                  if (listIndex !=
                                                      _model.results.length) {
                                                    safeSetState(() {
                                                      _model
                                                          .dosageModel
                                                          .unitDropdownModel
                                                          .vitalDropDownValueController
                                                          ?.value = (_model
                                                                  .results
                                                                  .where((e) =>
                                                                      e.shortName ==
                                                                      listItem)
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.unitIdentifier ==
                                                              'Liquid'
                                                          ? 'ml'
                                                          : _model.results
                                                              .where((e) =>
                                                                  e.shortName ==
                                                                  listItem)
                                                              .toList()
                                                              .firstOrNull!
                                                              .unitIdentifier);
                                                    });
                                                    _model.showSuggestionList =
                                                        false;
                                                    _model.results = [];
                                                    _model.pageNumber = 1;
                                                    _model.loadMoreResults = [];
                                                    safeSetState(() {});
                                                    safeSetState(() {
                                                      _model
                                                          .medicationNameTextController
                                                          ?.text = listItem;
                                                    });
                                                  } else {
                                                    _model.apiResultb67 =
                                                        await HocGroup
                                                            .searchMedicationCall
                                                            .call(
                                                      search: _model
                                                          .medicationNameTextController
                                                          .text,
                                                      userId:
                                                          FFAppState().userId,
                                                      page:
                                                          _model.pageNumber + 1,
                                                      baseurl:
                                                          FFAppState().baseUrl,
                                                    );

                                                    if ((_model.apiResultb67
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.results = functions
                                                          .mergeResults(
                                                              _model.results
                                                                  .toList(),
                                                              (getJsonField(
                                                                (_model.apiResultb67
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.results''',
                                                                true,
                                                              )!
                                                                          .toList()
                                                                          .map<ResultsStruct?>(ResultsStruct
                                                                              .maybeFromMap)
                                                                          .toList()
                                                                      as Iterable<
                                                                          ResultsStruct?>)
                                                                  .withoutNulls
                                                                  .toList())
                                                          .toList()
                                                          .cast<
                                                              ResultsStruct>();
                                                      safeSetState(() {});
                                                      _model.loadMoreResults = functions
                                                          .addLoadMore(
                                                              _model.results
                                                                  .toList(),
                                                              SearchResultStruct.maybeFromMap((_model
                                                                              .apiResultpmg
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                      .total >
                                                                  _model.results
                                                                      .length)
                                                          .toList()
                                                          .cast<String>();
                                                      _model.showSuggestionList =
                                                          (getJsonField(
                                                                (_model.apiResultb67
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.results''',
                                                              )
                                                                      .toList()
                                                                      .map<ResultsStruct?>(
                                                                          ResultsStruct
                                                                              .maybeFromMap)
                                                                      .toList() as Iterable<ResultsStruct?>)
                                                                  .withoutNulls
                                                                  .length >
                                                              0;
                                                      _model.pageNumber =
                                                          _model.pageNumber + 1;
                                                      safeSetState(() {});
                                                    }
                                                  }

                                                  safeSetState(() {});
                                                },
                                                child: Text(
                                                  listItem,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            color: listIndex ==
                                                                    _model
                                                                        .results
                                                                        .length
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumFamily),
                                                          ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (_model.isMedSet)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.exclamationCircle,
                                color: Color(0xFFB00020),
                                size: 12.0,
                              ),
                              Text(
                                'This field cannot be empty.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: Color(0xFFB00020),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.dosageModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SingleFormDropdownWidget(
                            fieldName: 'Dosage',
                            options: FFAppConstants.dosageOption,
                            dropdownValue: _model.unit,
                            initialValue: _model.dosage,
                          ),
                        ),
                        if (_model.isDosage)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.exclamationCircle,
                                color: Color(0xFFB00020),
                                size: 12.0,
                              ),
                              Text(
                                () {
                                  if (_model.isDosageCorrect) {
                                    return 'Enter a numeric value.';
                                  } else if (_model
                                              .dosageModel
                                              .unitDropdownModel
                                              .vitalDropDownValue ==
                                          null ||
                                      _model.dosageModel.unitDropdownModel
                                              .vitalDropDownValue ==
                                          '') {
                                    return 'Select appropriate dosage & unit from drop down';
                                  } else {
                                    return 'This field cannot be empty.';
                                  }
                                }(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: Color(0xFFB00020),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(),
                          child: Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.criticalValue ??=
                                  widget.medication?.isCritical != null
                                      ? widget.medication!.isCritical
                                      : false,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.criticalValue = newValue!);
                              },
                              side: BorderSide(
                                width: 2,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              activeColor: valueOrDefault<Color>(
                                FFAppState().theme.primaryColor,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                        ),
                        Text(
                          'Is it Critical',
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
                      ].divide(SizedBox(width: 10.0)),
                    ),
                    wrapWithModel(
                      model: _model.frequencyComponentModel,
                      updateCallback: () => safeSetState(() {}),
                      child: FrequencyComponentWidget(
                        medicationFrequency: widget.medication?.time,
                        reminderUnset: () async {
                          logFirebaseEvent(
                              'ADD_MEDICATION_COMPONENT_Container_9tinf');
                          _model.isReminderSelected = false;
                          safeSetState(() {});
                        },
                        sosCallback: (state) async {
                          logFirebaseEvent(
                              'ADD_MEDICATION_COMPONENT_Container_9tinf');
                          _model.isSosSelected = state;
                          safeSetState(() {});
                        },
                        onTapAction: () async {
                          logFirebaseEvent(
                              'ADD_MEDICATION_COMPONENT_Container_9tinf');
                          await Future.wait([
                            Future(() async {
                              if (_model
                                  .frequencyComponentModel.selectedFrequency
                                  .where((e) => e == 'Morning')
                                  .toList()
                                  .isNotEmpty) {
                                _model.updateFrequencyStruct(
                                  (e) => e
                                    ..morning = valueOrDefault<String>(
                                      dateTimeFormat(
                                        "jm",
                                        _model.datePicked1,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      '6:00 AM',
                                    ),
                                );
                                safeSetState(() {});
                              } else {
                                _model.updateFrequencyStruct(
                                  (e) => e..morning = null,
                                );
                                safeSetState(() {});
                              }
                            }),
                            Future(() async {
                              if (_model
                                  .frequencyComponentModel.selectedFrequency
                                  .where((e) => e == 'Afternoon')
                                  .toList()
                                  .isNotEmpty) {
                                _model.updateFrequencyStruct(
                                  (e) => e
                                    ..afternoon = valueOrDefault<String>(
                                      dateTimeFormat(
                                        "jm",
                                        _model.datePicked1,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      '11:00 AM',
                                    ),
                                );
                                safeSetState(() {});
                              } else {
                                _model.updateFrequencyStruct(
                                  (e) => e..afternoon = null,
                                );
                                safeSetState(() {});
                              }
                            }),
                            Future(() async {
                              if (_model
                                  .frequencyComponentModel.selectedFrequency
                                  .where((e) => e == 'Evening')
                                  .toList()
                                  .isNotEmpty) {
                                _model.updateFrequencyStruct(
                                  (e) => e
                                    ..evening = valueOrDefault<String>(
                                      dateTimeFormat(
                                        "jm",
                                        _model.datePicked1,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      '4:00 PM',
                                    ),
                                );
                                safeSetState(() {});
                              } else {
                                _model.updateFrequencyStruct(
                                  (e) => e..evening = null,
                                );
                                safeSetState(() {});
                              }
                            }),
                            Future(() async {
                              if (_model
                                  .frequencyComponentModel.selectedFrequency
                                  .where((e) => e == 'Night')
                                  .toList()
                                  .isNotEmpty) {
                                _model.updateFrequencyStruct(
                                  (e) => e
                                    ..night = valueOrDefault<String>(
                                      dateTimeFormat(
                                        "jm",
                                        _model.datePicked1,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      '7:00 PM',
                                    ),
                                );
                                safeSetState(() {});
                              } else {
                                _model.updateFrequencyStruct(
                                  (e) => e..night = null,
                                );
                                safeSetState(() {});
                              }
                            }),
                          ]);
                        },
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Set Reminder',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'ADD_MEDICATION_COMPONENT_Row_v2ixe451_ON');
                            if ((_model.frequencyComponentModel
                                    .selectedFrequency.isNotEmpty) &&
                                (_model.frequencyComponentModel
                                        .selectedFrequency.firstOrNull !=
                                    'SOS')) {
                              _model.isReminderSelected =
                                  _model.isReminderSelected ? false : true;
                              _model.updatePage(() {});
                              if (_model.isReminderSelected) {
                                await Future.wait([
                                  Future(() async {
                                    if (_model.frequencyComponentModel
                                        .selectedFrequency
                                        .where((e) => e == 'Morning')
                                        .toList()
                                        .isNotEmpty) {
                                      _model.updateFrequencyStruct(
                                        (e) => e
                                          ..morning = valueOrDefault<String>(
                                            dateTimeFormat(
                                              "jm",
                                              _model.datePicked1,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '6:00 AM',
                                          ),
                                      );
                                      safeSetState(() {});
                                    } else {
                                      _model.updateFrequencyStruct(
                                        (e) => e..morning = null,
                                      );
                                      safeSetState(() {});
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.frequencyComponentModel
                                        .selectedFrequency
                                        .where((e) => e == 'Afternoon')
                                        .toList()
                                        .isNotEmpty) {
                                      _model.updateFrequencyStruct(
                                        (e) => e
                                          ..afternoon = valueOrDefault<String>(
                                            dateTimeFormat(
                                              "jm",
                                              _model.datePicked1,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '11:00 AM',
                                          ),
                                      );
                                      safeSetState(() {});
                                    } else {
                                      _model.updateFrequencyStruct(
                                        (e) => e..afternoon = null,
                                      );
                                      safeSetState(() {});
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.frequencyComponentModel
                                        .selectedFrequency
                                        .where((e) => e == 'Evening')
                                        .toList()
                                        .isNotEmpty) {
                                      _model.updateFrequencyStruct(
                                        (e) => e
                                          ..evening = valueOrDefault<String>(
                                            dateTimeFormat(
                                              "jm",
                                              _model.datePicked1,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '4:00 PM',
                                          ),
                                      );
                                      safeSetState(() {});
                                    } else {
                                      _model.updateFrequencyStruct(
                                        (e) => e..evening = null,
                                      );
                                      safeSetState(() {});
                                    }
                                  }),
                                  Future(() async {
                                    if (_model.frequencyComponentModel
                                        .selectedFrequency
                                        .where((e) => e == 'Night')
                                        .toList()
                                        .isNotEmpty) {
                                      _model.updateFrequencyStruct(
                                        (e) => e
                                          ..night = valueOrDefault<String>(
                                            dateTimeFormat(
                                              "jm",
                                              _model.datePicked1,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '7:00 PM',
                                          ),
                                      );
                                      safeSetState(() {});
                                    } else {
                                      _model.updateFrequencyStruct(
                                        (e) => e..night = null,
                                      );
                                      safeSetState(() {});
                                    }
                                  }),
                                ]);
                              }
                            } else {
                              if (_model.isReminderSelected &&
                                  (_model.frequencyComponentModel
                                          .selectedFrequency.firstOrNull !=
                                      'SOS') &&
                                  (_model.endDate! <= getCurrentTimestamp)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'End date should be greater than current date to set reminder',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please choose frequency before enabling reminder',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (_model.isReminderSelected)
                                Icon(
                                  FFIcons.kbell,
                                  color: Color(0xFFF6861F),
                                  size: 20.0,
                                ),
                              if (_model.isReminderSelected == false)
                                Icon(
                                  FFIcons.kexclude,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (_model.isReminderSelected &&
                        (_model.frequencyComponentModel.selectedFrequency
                            .isNotEmpty) &&
                        (_model.frequencyComponentModel.selectedFrequency
                                .firstOrNull !=
                            'SOS'))
                      Align(
                        alignment: AlignmentDirectional(
                            valueOrDefault<double>(
                              _model.frequencyComponentModel.selectedFrequency
                                          .length ==
                                      1
                                  ? -1.0
                                  : 0.0,
                              0.0,
                            ),
                            valueOrDefault<double>(
                              _model.frequencyComponentModel.selectedFrequency
                                          .length ==
                                      1
                                  ? -1.0
                                  : 0.0,
                              0.0,
                            )),
                        child: Builder(
                          builder: (context) {
                            final frequencies = _model
                                .frequencyComponentModel.selectedFrequency
                                .toList();

                            return Wrap(
                              spacing: 10.0,
                              runSpacing: 10.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.antiAlias,
                              children: List.generate(frequencies.length,
                                  (frequenciesIndex) {
                                final frequenciesItem =
                                    frequencies[frequenciesIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.435,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            frequenciesItem,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ADD_MEDICATION_COMPONENT_Container_lk8kx');
                                              // timepicker

                                              final _datePicked1Time =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime:
                                                    TimeOfDay.fromDateTime(() {
                                                  if (frequenciesItem ==
                                                      'Morning') {
                                                    return functions
                                                        .convertStringToDate(
                                                            '2024-07-15T00:30:00.000Z');
                                                  } else if (frequenciesItem ==
                                                      'Afternoon') {
                                                    return functions
                                                        .convertStringToDate(
                                                            '2024-07-15T05:30:00.000Z');
                                                  } else if (frequenciesItem ==
                                                      'Evening') {
                                                    return functions
                                                        .convertStringToDate(
                                                            '2024-07-15T10:30:00.000Z');
                                                  } else {
                                                    return functions
                                                        .convertStringToDate(
                                                            '2024-07-15T13:30:00.000Z');
                                                  }
                                                }()),
                                                builder: (context, child) {
                                                  return wrapInMaterialTimePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLargeFamily),
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );
                                              if (_datePicked1Time != null) {
                                                safeSetState(() {
                                                  _model.datePicked1 = DateTime(
                                                    () {
                                                      if (frequenciesItem ==
                                                          'Morning') {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T00:30:00.000Z');
                                                      } else if (frequenciesItem ==
                                                          'Afternoon') {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T05:30:00.000Z');
                                                      } else if (frequenciesItem ==
                                                          'Evening') {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T10:30:00.000Z');
                                                      } else {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T13:30:00.000Z');
                                                      }
                                                    }()
                                                        .year,
                                                    () {
                                                      if (frequenciesItem ==
                                                          'Morning') {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T00:30:00.000Z');
                                                      } else if (frequenciesItem ==
                                                          'Afternoon') {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T05:30:00.000Z');
                                                      } else if (frequenciesItem ==
                                                          'Evening') {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T10:30:00.000Z');
                                                      } else {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T13:30:00.000Z');
                                                      }
                                                    }()
                                                        .month,
                                                    () {
                                                      if (frequenciesItem ==
                                                          'Morning') {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T00:30:00.000Z');
                                                      } else if (frequenciesItem ==
                                                          'Afternoon') {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T05:30:00.000Z');
                                                      } else if (frequenciesItem ==
                                                          'Evening') {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T10:30:00.000Z');
                                                      } else {
                                                        return functions
                                                            .convertStringToDate(
                                                                '2024-07-15T13:30:00.000Z');
                                                      }
                                                    }()
                                                        .day,
                                                    _datePicked1Time.hour,
                                                    _datePicked1Time.minute,
                                                  );
                                                });
                                              } else if (_model.datePicked1 !=
                                                  null) {
                                                safeSetState(() {
                                                  _model.datePicked1 = () {
                                                    if (frequenciesItem ==
                                                        'Morning') {
                                                      return functions
                                                          .convertStringToDate(
                                                              '2024-07-15T00:30:00.000Z');
                                                    } else if (frequenciesItem ==
                                                        'Afternoon') {
                                                      return functions
                                                          .convertStringToDate(
                                                              '2024-07-15T05:30:00.000Z');
                                                    } else if (frequenciesItem ==
                                                        'Evening') {
                                                      return functions
                                                          .convertStringToDate(
                                                              '2024-07-15T10:30:00.000Z');
                                                    } else {
                                                      return functions
                                                          .convertStringToDate(
                                                              '2024-07-15T13:30:00.000Z');
                                                    }
                                                  }();
                                                });
                                              }
                                              if (_model.datePicked1 != null) {
                                                if (frequenciesItem ==
                                                    'Morning') {
                                                  _model.updateFrequencyStruct(
                                                    (e) => e
                                                      ..morning =
                                                          valueOrDefault<
                                                              String>(
                                                        dateTimeFormat(
                                                          "jm",
                                                          _model.datePicked1,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '6:00 AM',
                                                      ),
                                                  );
                                                  safeSetState(() {});
                                                } else if (frequenciesItem ==
                                                    'Afternoon') {
                                                  _model.updateFrequencyStruct(
                                                    (e) => e
                                                      ..afternoon =
                                                          valueOrDefault<
                                                              String>(
                                                        dateTimeFormat(
                                                          "jm",
                                                          _model.datePicked1,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '11:00 AM',
                                                      ),
                                                  );
                                                  safeSetState(() {});
                                                } else if (frequenciesItem ==
                                                    'Evening') {
                                                  _model.updateFrequencyStruct(
                                                    (e) => e
                                                      ..evening =
                                                          valueOrDefault<
                                                              String>(
                                                        dateTimeFormat(
                                                          "jm",
                                                          _model.datePicked1,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '4:00 PM',
                                                      ),
                                                  );
                                                  safeSetState(() {});
                                                } else {
                                                  _model.updateFrequencyStruct(
                                                    (e) => e
                                                      ..night = valueOrDefault<
                                                          String>(
                                                        dateTimeFormat(
                                                          "jm",
                                                          _model.datePicked1,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '7:00 PM',
                                                      ),
                                                  );
                                                  safeSetState(() {});
                                                }
                                              }
                                            },
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: Color(0x7F5D6A85),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        () {
                                                          if (frequenciesItem ==
                                                              'Morning') {
                                                            return valueOrDefault<
                                                                String>(
                                                              _model.frequency
                                                                  ?.morning,
                                                              '6:00 AM',
                                                            );
                                                          } else if (frequenciesItem ==
                                                              'Afternoon') {
                                                            return valueOrDefault<
                                                                String>(
                                                              _model.frequency
                                                                  ?.afternoon,
                                                              '11:00 AM',
                                                            );
                                                          } else if (frequenciesItem ==
                                                              'Evening') {
                                                            return valueOrDefault<
                                                                String>(
                                                              _model.frequency
                                                                  ?.evening,
                                                              '4:00 PM',
                                                            );
                                                          } else if (frequenciesItem ==
                                                              'Night') {
                                                            return valueOrDefault<
                                                                String>(
                                                              _model.frequency
                                                                  ?.night,
                                                              '9:00 PM',
                                                            );
                                                          } else {
                                                            return dateTimeFormat(
                                                              "jm",
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            );
                                                          }
                                                        }(),
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
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .solidClock,
                                                      color: Color(0x7F5D6A85),
                                                      size: 16.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    wrapWithModel(
                      model: _model.howOftenModel,
                      updateCallback: () => safeSetState(() {}),
                      child: DropDownFieldWidget(
                        fieldName: 'How Often',
                        options: FFAppConstants.oftenOption,
                        initialValue: widget.medication?.howOften != null &&
                                widget.medication?.howOften != ''
                            ? widget.medication?.howOften
                            : FFAppConstants.oftenOption.firstOrNull,
                        mandatorySymbol: '  ',
                        isDisabled: _model.isSosSelected,
                        onSelection: (value) async {},
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Date',
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
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'ADD_MEDICATION_COMPONENT_Container_ycj6i');
                            if (!_model.isSosSelected) {
                              // Start Date
                              final _datePicked2Date = await showDatePicker(
                                context: context,
                                initialDate: functions.convertStringToDate(
                                    _model.startDate != null
                                        ? _model.startDate!.toString()
                                        : getCurrentTimestamp.toString()),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2050),
                                builder: (context, child) {
                                  return wrapInMaterialDatePickerTheme(
                                    context,
                                    child!,
                                    headerBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    headerForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    headerTextStyle: FlutterFlowTheme.of(
                                            context)
                                        .headlineLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLargeFamily,
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily),
                                        ),
                                    pickerBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    pickerForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    selectedDateTimeBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    selectedDateTimeForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    actionButtonForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    iconSize: 24.0,
                                  );
                                },
                              );

                              if (_datePicked2Date != null) {
                                safeSetState(() {
                                  _model.datePicked2 = DateTime(
                                    _datePicked2Date.year,
                                    _datePicked2Date.month,
                                    _datePicked2Date.day,
                                  );
                                });
                              } else if (_model.datePicked2 != null) {
                                safeSetState(() {
                                  _model.datePicked2 =
                                      functions.convertStringToDate(
                                          _model.startDate != null
                                              ? _model.startDate!.toString()
                                              : getCurrentTimestamp.toString());
                                });
                              }
                              if (_model.datePicked2 != null) {
                                _model.startDate = _model.datePicked2;
                                safeSetState(() {});
                                if (_model.startDate! > _model.endDate!) {
                                  _model.endDate = _model.startDate;
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.periodModel
                                            .enteredValueTextController?.text =
                                        functions
                                            .differenceBetweenDate(
                                                _model.startDate!,
                                                _model.endDate!)
                                            .toString();
                                  });
                                } else {
                                  safeSetState(() {
                                    _model.periodModel
                                            .enteredValueTextController?.text =
                                        functions
                                            .differenceBetweenDate(
                                                _model.startDate!,
                                                _model.endDate!)
                                            .toString();
                                  });
                                }
                              }
                            }
                          },
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: _model.isSosSelected
                                  ? Color(0xFFF5F5F5)
                                  : FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  _model.isSosSelected
                                      ? Color(0xFFF5F5F5)
                                      : Color(0x805D6A85),
                                  Color(0x805D6A85),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      _model.isSosSelected
                                          ? ("")
                                          : dateTimeFormat(
                                              "d-M-y",
                                              _model.startDate,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.calendar_today_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16.0,
                                ),
                              ]
                                  .divide(SizedBox(width: 10.0))
                                  .addToEnd(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.42,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: wrapWithModel(
                            model: _model.periodModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SingleFormWidget(
                              fieldName: 'Period (Days)',
                              mandatorySymbol: ' ',
                              isDisabled: _model.isSosSelected,
                              period: (numberofdays) async {
                                logFirebaseEvent(
                                    'ADD_MEDICATION_COMPONENT_Period_CALLBACK');
                                _model.endDate = functions.calculateEndDate(
                                    _model.startDate!, numberofdays!);
                                safeSetState(() {});
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'End Date',
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
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ADD_MEDICATION_COMPONENT_Container_enmu2');
                                  if (!_model.isSosSelected) {
                                    final _datePicked3Date =
                                        await showDatePicker(
                                      context: context,
                                      initialDate:
                                          functions.convertStringToDate(
                                              _model.startDate != null
                                                  ? _model.startDate!.toString()
                                                  : getCurrentTimestamp
                                                      .toString()),
                                      firstDate: functions.convertStringToDate(
                                          _model.startDate != null
                                              ? _model.startDate!.toString()
                                              : getCurrentTimestamp.toString()),
                                      lastDate: DateTime(2050),
                                      builder: (context, child) {
                                        return wrapInMaterialDatePickerTheme(
                                          context,
                                          child!,
                                          headerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          headerForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          headerTextStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily,
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
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
                                              FlutterFlowTheme.of(context).info,
                                          actionButtonForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 24.0,
                                        );
                                      },
                                    );

                                    if (_datePicked3Date != null) {
                                      safeSetState(() {
                                        _model.datePicked3 = DateTime(
                                          _datePicked3Date.year,
                                          _datePicked3Date.month,
                                          _datePicked3Date.day,
                                        );
                                      });
                                    } else if (_model.datePicked3 != null) {
                                      safeSetState(() {
                                        _model.datePicked3 = functions
                                            .convertStringToDate(
                                                _model.startDate != null
                                                    ? _model.startDate!
                                                        .toString()
                                                    : getCurrentTimestamp
                                                        .toString());
                                      });
                                    }
                                    if (_model.datePicked3 != null) {
                                      _model.endDate = _model.datePicked3;
                                      safeSetState(() {});
                                      safeSetState(() {
                                        _model
                                                .periodModel
                                                .enteredValueTextController
                                                ?.text =
                                            functions
                                                .differenceBetweenDate(
                                                    _model.startDate!,
                                                    _model.endDate!)
                                                .toString();
                                      });
                                      if (_model.endDate! <
                                          getCurrentTimestamp) {
                                        _model.isReminderSelected = false;
                                        safeSetState(() {});
                                      }
                                    }
                                  }
                                },
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: _model.isSosSelected
                                        ? Color(0xFFF5F5F5)
                                        : FlutterFlowTheme.of(context)
                                            .secondary,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                      color: valueOrDefault<Color>(
                                        _model.isSosSelected
                                            ? Color(0xFFF5F5F5)
                                            : Color(0x805D6A85),
                                        Color(0x805D6A85),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            _model.isSosSelected
                                                ? ("")
                                                : dateTimeFormat(
                                                    "d-M-y",
                                                    _model.endDate,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
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
                                      ),
                                      Icon(
                                        Icons.calendar_today_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                    ]
                                        .divide(SizedBox(width: 10.0))
                                        .addToEnd(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                    wrapWithModel(
                      model: _model.instructionsModel,
                      updateCallback: () => safeSetState(() {}),
                      child: DropDownFieldWidget(
                        fieldName: 'Instructions',
                        initialValue: widget.medication?.instruction != null &&
                                widget.medication?.instruction != ''
                            ? widget.medication?.instruction
                            : FFAppConstants.noteOptions.firstOrNull,
                        options: FFAppConstants.noteOptions,
                        mandatorySymbol: ' ',
                        isDisabled: false,
                        onSelection: (value) async {},
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Additional note',
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
                        TextFormField(
                          controller: _model.additionalNoteTextController,
                          focusNode: _model.additionalNoteFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            hintText: 'Type here',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x7F5D6A85),
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
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          maxLines: 5,
                          validator: _model
                              .additionalNoteTextControllerValidator
                              .asValidator(context),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ]
                      .divide(SizedBox(height: 20.0))
                      .addToStart(SizedBox(height: 20.0))
                      .addToEnd(SizedBox(height: 20.0)),
                ),
              ),
            ),
          ),
          Divider(
            height: 0.0,
            thickness: 0.25,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          if (!(isWeb
              ? MediaQuery.viewInsetsOf(context).bottom > 0
              : _isKeyboardVisible))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('ADD_MEDICATION_COMPONENT_ADD_MEDICATION_');
                  _model.results = [];
                  _model.pageNumber = 1;
                  _model.loadMoreResults = [];
                  _model.showSuggestionList = false;
                  safeSetState(() {});
                  if ((_model.medicationNameTextController.text != '') &&
                      (_model.dosageModel.singleFormModel
                              .enteredValueTextController.text !=
                          '0') &&
                      functions.regExForDosage(_model.dosageModel
                          .singleFormModel.enteredValueTextController.text) &&
                      (_model.dosageModel.unitDropdownModel
                                  .vitalDropDownValue !=
                              null &&
                          _model.dosageModel.unitDropdownModel
                                  .vitalDropDownValue !=
                              '')) {
                    if (widget.isEdit) {
                      _model.apiResultd58 =
                          await HocGroup.updateMedicationCall.call(
                        name: _model.medicationNameTextController.text,
                        addedBy: FFAppState().name,
                        additionalNote: functions.regForEscaping(
                            _model.additionalNoteTextController.text),
                        autoReminder: _model.isReminderSelected,
                        dosage: functions.roundOf(_model.dosageModel
                            .singleFormModel.enteredValueTextController.text),
                        endDate: _model.isSosSelected
                            ? ("")
                            : functions
                                .nextMidnightEndDate(_model.endDate!)
                                .millisecondsSinceEpoch
                                .toString(),
                        howOften: _model.isSosSelected
                            ? ("")
                            : _model
                                .howOftenModel.dropdownModel.vitalDropDownValue,
                        isCritical: _model.criticalValue,
                        note: _model
                            .instructionsModel.dropdownModel.vitalDropDownValue,
                        period: _model.isSosSelected
                            ? 0
                            : int.tryParse(_model
                                .periodModel.enteredValueTextController.text),
                        timeList:
                            _model.frequencyComponentModel.selectedFrequency,
                        reminderTimingJson: _model.frequency?.toMap(),
                        startDate: _model.isSosSelected
                            ? ("")
                            : _model.startDate?.millisecondsSinceEpoch
                                .toString(),
                        id: widget.medication?.id,
                        userId: FFAppState().userId,
                        baseurl: FFAppState().baseUrl,
                        units: _model
                            .dosageModel.unitDropdownModel.vitalDropDownValue,
                      );

                      if ((_model.apiResultd58?.succeeded ?? true)) {
                        if (widget.isUpcoming) {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            HomePageWidget.routeName,
                            queryParameters: {
                              'index': serializeParam(
                                0,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          FFAppState().clearFetchUpcomingMedicationCache();
                        } else {
                          await widget.callbackAddMedication?.call();
                          FFAppState().clearFetchUpcomingMedicationCache();
                        }
                      } else {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Error while saving data...',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                      }
                    } else {
                      _model.apiResult2bl =
                          await HocGroup.addMedicationCall.call(
                        medicationName:
                            _model.medicationNameTextController.text,
                        dosage: functions.roundOf(_model.dosageModel
                            .singleFormModel.enteredValueTextController.text),
                        often: _model.isSosSelected
                            ? ("")
                            : _model
                                .howOftenModel.dropdownModel.vitalDropDownValue,
                        startDate: _model.isSosSelected
                            ? ("")
                            : _model.startDate?.millisecondsSinceEpoch
                                .toString(),
                        endDate: _model.isSosSelected
                            ? ("")
                            : functions
                                .nextMidnightEndDate(_model.endDate!)
                                .millisecondsSinceEpoch
                                .toString(),
                        period: _model.isSosSelected
                            ? '0'
                            : _model
                                .periodModel.enteredValueTextController.text,
                        additionalNote: functions.regForEscaping(
                            _model.additionalNoteTextController.text),
                        frequencyList:
                            _model.frequencyComponentModel.selectedFrequency,
                        reminder: _model.isReminderSelected,
                        userId: FFAppState().userId,
                        reminderTimingJson: _model.frequency?.toMap(),
                        addedBy: FFAppState().name,
                        note: _model
                            .instructionsModel.dropdownModel.vitalDropDownValue,
                        isCritical: _model.criticalValue,
                        externalId: 'INT_080',
                        baseurl: FFAppState().baseUrl,
                        units: _model
                            .dosageModel.unitDropdownModel.vitalDropDownValue,
                        taskId: widget.taskId != null && widget.taskId != ''
                            ? widget.taskId
                            : (""),
                      );

                      if ((_model.apiResult2bl?.succeeded ?? true)) {
                        if (widget.isUpcoming) {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            HomePageWidget.routeName,
                            queryParameters: {
                              'index': serializeParam(
                                0,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );

                          FFAppState().clearFetchUpcomingMedicationCache();
                        } else {
                          await widget.callbackAddMedication?.call();
                          FFAppState().clearFetchUpcomingMedicationCache();
                        }
                      } else {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Error while saving data...',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: FlutterFlowTheme.of(context).secondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                      }
                    }
                  } else {
                    await Future.wait([
                      Future(() async {
                        if (_model.medicationNameTextController.text == '') {
                          _model.isMedSet = true;
                          safeSetState(() {});
                          _model.isMedicationCorrect = false;
                          safeSetState(() {});
                        } else {
                          _model.isMedSet = false;
                          safeSetState(() {});
                          if (functions.regForMedication(
                              _model.medicationNameTextController.text)) {
                            _model.isMedicationCorrect = true;
                            safeSetState(() {});
                          } else {
                            _model.isMedicationCorrect = true;
                            safeSetState(() {});
                          }
                        }
                      }),
                      Future(() async {
                        if (((_model.dosageModel.singleFormModel
                                        .enteredValueTextController.text ==
                                    '0') ||
                                (_model.dosageModel.singleFormModel
                                            .enteredValueTextController.text ==
                                        '')) &&
                            (_model.dosageModel.unitDropdownModel
                                    .vitalDropDownValue ==
                                (""))) {
                          _model.isDosage = true;
                          safeSetState(() {});
                          _model.isDosageCorrect = false;
                          safeSetState(() {});
                        } else {
                          _model.isDosage = false;
                          safeSetState(() {});
                          await Future.wait([
                            Future(() async {
                              if (functions.regExForDosage(_model
                                  .dosageModel
                                  .singleFormModel
                                  .enteredValueTextController
                                  .text)) {
                                _model.isDosage = false;
                                safeSetState(() {});
                              } else {
                                _model.isDosageCorrect = true;
                                safeSetState(() {});
                                _model.isDosage = true;
                                safeSetState(() {});
                              }
                            }),
                            Future(() async {
                              if (!(_model.dosageModel.unitDropdownModel
                                          .vitalDropDownValue !=
                                      null &&
                                  _model.dosageModel.unitDropdownModel
                                          .vitalDropDownValue !=
                                      '')) {
                                _model.isDosage = true;
                                safeSetState(() {});
                              }
                            }),
                          ]);
                        }
                      }),
                    ]);
                  }

                  safeSetState(() {});
                },
                text: widget.isUpcoming || widget.isEdit
                    ? 'Update'
                    : 'Add Medication',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 42.0,
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
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
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
        ].addToEnd(SizedBox(height: 20.0)),
      ),
    );
  }
}
