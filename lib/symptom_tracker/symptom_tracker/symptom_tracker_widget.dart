import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/text_input_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/symptom_tracker/severity_popup/severity_popup_widget.dart';
import '/symptom_tracker/submit_symptom_popup/submit_symptom_popup_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'symptom_tracker_model.dart';
export 'symptom_tracker_model.dart';

class SymptomTrackerWidget extends StatefulWidget {
  const SymptomTrackerWidget({
    super.key,
    this.category,
    this.severity,
    this.taskId,
  });

  final String? category;
  final String? severity;
  final String? taskId;

  static String routeName = 'SymptomTracker';
  static String routePath = '/symptomTracker';

  @override
  State<SymptomTrackerWidget> createState() => _SymptomTrackerWidgetState();
}

class _SymptomTrackerWidgetState extends State<SymptomTrackerWidget> {
  late SymptomTrackerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SymptomTrackerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SYMPTOM_TRACKER_SymptomTracker_ON_INIT_S');
      _model.apiResultugy = await TaskGroup.symptomTrackerCall.call(
        userId: FFAppState().userId,
        baseurl: FFAppState().baseUrl,
        category: widget.category,
        severity: widget.severity,
      );

      if ((_model.apiResultugy?.succeeded ?? true)) {
        _model.symptomList = functions
            .createSymptomsList((getJsonField(
              (_model.apiResultugy?.jsonBody ?? ''),
              r'''$.name''',
              true,
            ) as List)
                .map<String>((s) => s.toString())
                .toList())
            .toList()
            .cast<SymptomsListStruct>();
        safeSetState(() {});
      }
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'SYMPTOM_TRACKER_Container_jujcfhnm_ON_TA');
                            context.safePop();
                          },
                          child: Container(
                            width: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Let’s capture how you are feeling',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  decoration: BoxDecoration(),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Since you have detected ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${widget.severity} ${widget.category}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        )
                                      ],
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
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Select the symptoms',
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
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: () {
                                          if (_model.searchList.length >= 4) {
                                            return 250.0;
                                          } else if (_model.searchList.length ==
                                              1) {
                                            return 100.0;
                                          } else if (_model.searchList.length ==
                                              2) {
                                            return 150.0;
                                          } else if (_model.searchList.length ==
                                              3) {
                                            return 200.0;
                                          } else {
                                            return 50.0;
                                          }
                                        }(),
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            FFAppState()
                                                .theme
                                                .backgroudPrimaryColor,
                                            Color(0x143894B5),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              TextFormField(
                                                controller:
                                                    _model.nameTextController,
                                                focusNode: _model.nameFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.nameTextController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    logFirebaseEvent(
                                                        'SYMPTOM_TRACKER_Name_ON_TEXTFIELD_CHANGE');
                                                    _model.searchList = [];
                                                    safeSetState(() {});
                                                    _model.searchResult =
                                                        await TaskGroup
                                                            .symptomSearchCall
                                                            .call(
                                                      query: _model
                                                          .nameTextController
                                                          .text,
                                                      userId:
                                                          FFAppState().userId,
                                                      baseurl:
                                                          FFAppState().baseUrl,
                                                    );

                                                    if ((_model.searchResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.searchList =
                                                          functions
                                                              .createSymptomsList(
                                                                  (getJsonField(
                                                                (_model.searchResult
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.names''',
                                                                true,
                                                              ) as List)
                                                                      .map<String>(
                                                                          (s) => s
                                                                              .toString())
                                                                      .toList())
                                                              .toList()
                                                              .cast<
                                                                  SymptomsListStruct>();
                                                      safeSetState(() {});
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: false,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        color: valueOrDefault<
                                                            Color>(
                                                          FFAppState()
                                                              .theme
                                                              .primaryColor,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                                  hintText: 'I am experiencing',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        color:
                                                            Color(0xFF9F9C9C),
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
                                                      color: Color(0x00000000),
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.transparent,
                                                  prefixIcon: Icon(
                                                    Icons.search_sharp,
                                                    color: Color(0xFF797575),
                                                  ),
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState()
                                                            .theme
                                                            .primaryColor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                                maxLines: null,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .nameTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                              if (_model.searchList.length > 0)
                                                Builder(
                                                  builder: (context) {
                                                    final symptom = _model
                                                        .searchList
                                                        .toList();

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            symptom.length,
                                                            (symptomIndex) {
                                                          final symptomItem =
                                                              symptom[
                                                                  symptomIndex];
                                                          return Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'SYMPTOM_TRACKER_PAGE_Row_5s6iksch_ON_TAP');
                                                                if (_model
                                                                    .selectedSymptoms
                                                                    .contains(
                                                                        symptomItem)) {
                                                                  _model.removeFromSelectedSymptoms(
                                                                      symptomItem);
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model.addToSelectedSymptoms(
                                                                      symptomItem);
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                if (!_model
                                                                    .symptomList
                                                                    .contains(
                                                                        symptomItem)) {
                                                                  _model.insertAtIndexInSymptomList(
                                                                      0,
                                                                      symptomItem);
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                                _model.searchList =
                                                                    [];
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .nameTextController
                                                                      ?.clear();
                                                                });
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .search_sharp,
                                                                    color: Color(
                                                                        0xFF797575),
                                                                    size: 24.0,
                                                                  ),
                                                                  Text(
                                                                    symptomItem
                                                                        .name,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            FFAppState().theme.primaryColor,
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ]
                                                                    .divide(SizedBox(
                                                                        width:
                                                                            10.0))
                                                                    .addToStart(
                                                                        SizedBox(
                                                                            width:
                                                                                10.0)),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                                if (false)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final list = _model.searchList.toList();

                                        return Wrap(
                                          spacing: 10.0,
                                          runSpacing: 10.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: List.generate(list.length,
                                              (listIndex) {
                                            final listItem = list[listIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'SYMPTOM_TRACKER_Container_4keuk9my_ON_TA');
                                                if (_model.selectedSymptoms
                                                    .contains(listItem)) {
                                                  _model
                                                      .removeFromSelectedSymptoms(
                                                          listItem);
                                                  safeSetState(() {});
                                                } else {
                                                  _model.addToSelectedSymptoms(
                                                      listItem);
                                                  safeSetState(() {});
                                                }
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Container(
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: _model
                                                            .selectedSymptoms
                                                            .contains(listItem)
                                                        ? valueOrDefault<Color>(
                                                            FFAppState()
                                                                .theme
                                                                .backgroudPrimaryColor,
                                                            Color(0x191C75BA),
                                                          )
                                                        : Color(0x00000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: _model
                                                              .selectedSymptoms
                                                              .contains(
                                                                  listItem)
                                                          ? valueOrDefault<
                                                              Color>(
                                                              FFAppState()
                                                                  .theme
                                                                  .primaryColor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            )
                                                          : Color(0xFFEEEEEE),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 22.0,
                                                          height: 22.0,
                                                          child: custom_widgets
                                                              .SymptomTrackerTimeline(
                                                            width: 22.0,
                                                            height: 22.0,
                                                            symptomType:
                                                                listItem.name,
                                                            color: _model
                                                                    .selectedSymptoms
                                                                    .contains(
                                                                        listItem)
                                                                ? valueOrDefault<
                                                                    Color>(
                                                                    FFAppState()
                                                                        .theme
                                                                        .primaryColor,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  )
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            iconSize: 22,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Text(
                                                              listItem.name,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: _model
                                                                            .selectedSymptoms
                                                                            .contains(
                                                                                listItem)
                                                                        ? valueOrDefault<
                                                                            Color>(
                                                                            FFAppState().theme.primaryColor,
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          )
                                                                        : Color(
                                                                            0xFF242E49),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: (_model
                                                .selectedSymptoms.length ==
                                            0)
                                        ? null
                                        : () async {
                                            logFirebaseEvent(
                                                'SYMPTOM_TRACKER_ADD_TO_LIST_BTN_ON_TAP');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: SeverityPopupWidget(
                                                      symptom: _model
                                                          .selectedSymptoms,
                                                      isEdit: false,
                                                      callback:
                                                          (symptom) async {
                                                        _model.selectedSymptoms =
                                                            [];
                                                        safeSetState(() {});
                                                        _model.selectedWithDetails = functions
                                                            .mergeSymptomsList(
                                                                _model
                                                                    .selectedWithDetails
                                                                    .toList(),
                                                                symptom
                                                                    .toList())
                                                            .toList()
                                                            .cast<
                                                                SymptomsListStruct>();
                                                        safeSetState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                    text: 'Add to list',
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: _model.selectedSymptoms.length > 0
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : Color(0xAA949494),
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: _model.selectedSymptoms.length > 0
                                          ? valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            )
                                          : Color(0x195D6A85),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: _model.selectedSymptoms
                                                        .length >
                                                    0
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : Color(0xFF949494),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(4.0),
                                      disabledColor: Color(0x1A5D6A85),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 10.0))
                                  .addToStart(SizedBox(height: 10.0)),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final list = _model.symptomList.toList();

                                return Wrap(
                                  spacing: 10.0,
                                  runSpacing: 10.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children:
                                      List.generate(list.length, (listIndex) {
                                    final listItem = list[listIndex];
                                    return Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SYMPTOM_TRACKER_Container_il8fs7s5_ON_TA');
                                          if (listItem.name != 'Other') {
                                            if (_model.selectedSymptoms
                                                .contains(listItem)) {
                                              _model.removeFromSelectedSymptoms(
                                                  listItem);
                                              safeSetState(() {});
                                              _model.removeFromSymptomList(
                                                  listItem);
                                              safeSetState(() {});
                                              _model.insertAtIndexInSymptomList(
                                                  _model.symptomList.length - 1,
                                                  listItem);
                                              safeSetState(() {});
                                            } else {
                                              _model.addToSelectedSymptoms(
                                                  listItem);
                                              safeSetState(() {});
                                              _model.removeFromSymptomList(
                                                  listItem);
                                              safeSetState(() {});
                                              _model.insertAtIndexInSymptomList(
                                                  0, listItem);
                                              safeSetState(() {});
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: TextInputPopupWidget(
                                                      callback:
                                                          (symptom) async {
                                                        if (_model
                                                            .selectedSymptoms
                                                            .contains(
                                                                SymptomsListStruct(
                                                          name: symptom,
                                                        ))) {
                                                        } else {
                                                          _model.addToSelectedSymptoms(
                                                              SymptomsListStruct(
                                                            name: symptom,
                                                          ));
                                                          safeSetState(() {});
                                                          _model.removeFromSymptomList(
                                                              SymptomsListStruct(
                                                            name: symptom,
                                                          ));
                                                          safeSetState(() {});
                                                          _model.insertAtIndexInSymptomList(
                                                              0,
                                                              SymptomsListStruct(
                                                                name: symptom,
                                                              ));
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Container(
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedSymptoms
                                                      .contains(listItem)
                                                  ? valueOrDefault<Color>(
                                                      FFAppState()
                                                          .theme
                                                          .backgroudPrimaryColor,
                                                      Color(0x191C75BA),
                                                    )
                                                  : Color(0x00000000),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: _model.selectedSymptoms
                                                        .contains(listItem)
                                                    ? valueOrDefault<Color>(
                                                        FFAppState()
                                                            .theme
                                                            .primaryColor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      )
                                                    : Color(0xFFEEEEEE),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 22.0,
                                                    height: 22.0,
                                                    child: custom_widgets
                                                        .SymptomTrackerTimeline(
                                                      width: 22.0,
                                                      height: 22.0,
                                                      symptomType:
                                                          listItem.name,
                                                      color: _model
                                                              .selectedSymptoms
                                                              .contains(
                                                                  listItem)
                                                          ? valueOrDefault<
                                                              Color>(
                                                              FFAppState()
                                                                  .theme
                                                                  .primaryColor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            )
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      iconSize: 22,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        listItem.name,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: _model
                                                                          .selectedSymptoms
                                                                          .contains(
                                                                              listItem)
                                                                      ? valueOrDefault<
                                                                          Color>(
                                                                          FFAppState()
                                                                              .theme
                                                                              .primaryColor,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        )
                                                                      : Color(
                                                                          0xFF242E49),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                          if (_model.selectedWithDetails.length > 0)
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().theme.backgroudPrimaryColor,
                                  Color(0x191C75BA),
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 10.0, 5.0, 10.0),
                                child: Builder(
                                  builder: (context) {
                                    final finalList =
                                        _model.selectedWithDetails.toList();

                                    return Wrap(
                                      spacing: 10.0,
                                      runSpacing: 10.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(finalList.length,
                                          (finalListIndex) {
                                        final finalListItem =
                                            finalList[finalListIndex];
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Container(
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .primaryColor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 22.0,
                                                    height: 22.0,
                                                    child: custom_widgets
                                                        .SymptomTrackerTimeline(
                                                      width: 22.0,
                                                      height: 22.0,
                                                      symptomType:
                                                          finalListItem.name,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState()
                                                            .theme
                                                            .primaryColor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                      iconSize: 22,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        finalListItem.name
                                                            .maybeHandleOverflow(
                                                          maxChars: 30,
                                                          replacement: '…',
                                                        ),
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    FFAppState()
                                                                        .theme
                                                                        .primaryColor,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 2.0,
                                                    height: 25.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState()
                                                            .theme
                                                            .backgroudPrimaryColor,
                                                        Color(0x191C75BA),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 25.0,
                                                    height: 25.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        if (finalListItem
                                                                .selectedValues
                                                                .severity ==
                                                            'Mild')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/smile.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        if (finalListItem
                                                                .selectedValues
                                                                .severity ==
                                                            'Moderate')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/moderate.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        if (finalListItem
                                                                .selectedValues
                                                                .severity ==
                                                            'Extreme')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/severe.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    finalListItem
                                                        .selectedValues.duration
                                                        .maybeHandleOverflow(
                                                      maxChars: 25,
                                                      replacement: '…',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  Text(
                                                    dateTimeFormat(
                                                      "d E",
                                                      functions
                                                          .convertMillisecondsToDateTime(
                                                              finalListItem
                                                                  .selectedValues
                                                                  .onSetDate),
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                  Container(
                                                    width: 2.0,
                                                    height: 25.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState()
                                                            .theme
                                                            .backgroudPrimaryColor,
                                                        Color(0x191C75BA),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SYMPTOM_TRACKER_Icon_x696za9l_ON_TAP');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  SeverityPopupWidget(
                                                                symptom: functions
                                                                    .createArrayofSymptom(
                                                                        finalListItem),
                                                                isEdit: true,
                                                                callback:
                                                                    (symptom) async {
                                                                  _model.selectedSymptoms =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.selectedWithDetails = functions
                                                                      .mergeSymptomsList(
                                                                          _model
                                                                              .selectedWithDetails
                                                                              .toList(),
                                                                          symptom
                                                                              .toList())
                                                                      .toList()
                                                                      .cast<
                                                                          SymptomsListStruct>();
                                                                  safeSetState(
                                                                      () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Icon(
                                                      Icons.edit_sharp,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState()
                                                            .theme
                                                            .primaryColor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SYMPTOM_TRACKER_Icon_sro8la6s_ON_TAP');
                                                      _model
                                                          .removeFromSelectedWithDetails(
                                                              finalListItem);
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState()
                                                            .theme
                                                            .primaryColor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(width: 7.0))
                                                    .addToEnd(
                                                        SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: FFButtonWidget(
                      onPressed: ((_model.selectedSymptoms.length == 0) &&
                              (_model.selectedWithDetails.length == 0))
                          ? null
                          : () async {
                              logFirebaseEvent(
                                  'SYMPTOM_TRACKER_PAGE_SUBMIT_BTN_ON_TAP');
                              _model.apiResult5ky =
                                  await TaskGroup.submitSymptomCall.call(
                                userId: FFAppState().userId,
                                baseurl: FFAppState().baseUrl,
                                jsonJson: functions.convertSymptomsListToJson(
                                    _model.selectedWithDetails.toList(),
                                    _model.selectedSymptoms.toList()),
                                category: widget.category,
                                taskId: widget.taskId,
                              );

                              if ((_model.apiResult5ky?.succeeded ?? true)) {
                                _model.apiResult7jz =
                                    await TaskGroup.submittaskCall.call(
                                  jsonJson: functions.createtaskResponse(
                                      '', '', widget.taskId!),
                                  userId: FFAppState().userId,
                                  baseurl: FFAppState().baseUrl,
                                );

                                if ((_model.apiResult7jz?.succeeded ?? true)) {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            child: SubmitSymptomPopupWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Something  went wrong'),
                                        content: Text(
                                            (_model.apiResult7jz?.jsonBody ??
                                                    '')
                                                .toString()),
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
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Something  went wrong'),
                                      content: Text(
                                          (_model.apiResultugy?.jsonBody ?? '')
                                              .toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }

                              safeSetState(() {});
                            },
                      text: 'Submit',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 42.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: valueOrDefault<Color>(
                          FFAppState().theme.primaryColor,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: (_model.selectedSymptoms.length > 0) ||
                                      (_model.selectedWithDetails.length > 0)
                                  ? FlutterFlowTheme.of(context).secondary
                                  : Color(0xFF949494),
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
                        disabledColor: Color(0x1A5D6A85),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
