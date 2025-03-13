import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'survey_component_model.dart';
export 'survey_component_model.dart';

class SurveyComponentWidget extends StatefulWidget {
  const SurveyComponentWidget({
    super.key,
    this.backCallback,
    this.nextCallback,
    this.doctorId,
    this.consultationId,
  });

  final Future Function()? backCallback;
  final Future Function(List<dynamic>? data, bool isSkipSurvey)? nextCallback;
  final String? doctorId;
  final String? consultationId;

  @override
  State<SurveyComponentWidget> createState() => _SurveyComponentWidgetState();
}

class _SurveyComponentWidgetState extends State<SurveyComponentWidget> {
  late SurveyComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SURVEY_COMPONENT_SurveyComponent_ON_INIT');
      _model.answeredSurveys = [];
      _model.disableAction = false;
      safeSetState(() {});
      safeSetState(() {
        _model.answerTextController?.clear();
      });
      _model.surveyResponse = await ConnectionsGroup.getSurveyCall.call(
        userId: FFAppState().userId,
        baseurl: FFAppState().baseUrl,
      );

      if ((_model.surveyResponse?.succeeded ?? true)) {
        _model.survey = ((_model.surveyResponse?.jsonBody ?? '')
                .toList()
                .map<SurveyModelStruct?>(SurveyModelStruct.maybeFromMap)
                .toList() as Iterable<SurveyModelStruct?>)
            .withoutNulls
            .firstOrNull;
        _model.index = 0;
        safeSetState(() {});
      } else {
        await action_blocks.sessionExpired(
          context,
          statusCode: (_model.surveyResponse?.statusCode ?? 200),
        );
      }
    });

    _model.answerTextController ??= TextEditingController();
    _model.answerFocusNode ??= FocusNode();

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height -
          FFAppState().statusBarHeight -
          FFAppState().navBarHeight,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 57.0,
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                FFAppState().theme.primaryColor,
                FlutterFlowTheme.of(context).primary,
              ),
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
                          'SURVEY_COMPONENT_Container_b2hl58md_ON_T');
                      _model.index = 0;
                      safeSetState(() {});
                      safeSetState(() {
                        _model.answerTextController?.clear();
                      });
                      _model.singleSlectionSelectedIndex = null;
                      safeSetState(() {});
                      await widget.backCallback?.call();
                      _model.survey = null;
                      _model.answeredSurveys = [];
                      safeSetState(() {});
                    },
                    child: Container(
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          FFAppState().theme.primaryColor,
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Survey',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondary,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
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
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SURVEY_COMPONENT_Container_ifju8z4m_ON_T');
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: _model.index >= 0
                                      ? valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        )
                                      : Color(0xFFE1E1E1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    '1',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.1,
                              height: 5.0,
                              decoration: BoxDecoration(
                                color: _model.index >= 1
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0xFFE1E1E1),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SURVEY_COMPONENT_Container_6ebye2qv_ON_T');
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: _model.index >= 1
                                      ? valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        )
                                      : Color(0xFFE1E1E1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    '2',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.1,
                              height: 5.0,
                              decoration: BoxDecoration(
                                color: _model.index >= 2
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0xFFE1E1E1),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'SURVEY_COMPONENT_Container_i08e3lni_ON_T');
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: _model.index >= 2
                                      ? valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        )
                                      : Color(0xFFE1E1E1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    '3',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.1,
                              height: 5.0,
                              decoration: BoxDecoration(
                                color: _model.index >= 3
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0xFFE1E1E1),
                              ),
                            ),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: _model.index >= 3
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0xFFE1E1E1),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '4',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.survey?.question,
                                'Question',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          if (_model.survey?.type == 'multiSelect')
                            Builder(
                              builder: (context) {
                                final option = (((_model.surveyResponse
                                                            ?.jsonBody ??
                                                        '')
                                                    .toList()
                                                    .map<SurveyModelStruct?>(
                                                        SurveyModelStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<SurveyModelStruct?>)
                                            .withoutNulls
                                            .elementAtOrNull(_model.index))
                                        ?.options
                                        .toList() ??
                                    [];

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(option.length,
                                      (optionIndex) {
                                    final optionItem = option[optionIndex];
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'SURVEY_COMPONENT_COMP_MultiSelect_ON_TAP');
                                        _model.updateSurveyStruct(
                                          (e) => e
                                            ..selectedoptions = functions
                                                .appendStringToList(
                                                    _model
                                                        .survey!.selectedoptions
                                                        .toList(),
                                                    optionItem)
                                                .toList(),
                                        );
                                        safeSetState(() {});
                                      },
                                      text: optionItem,
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.6,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: _model.survey!.selectedoptions
                                                .contains(optionItem)
                                            ? valueOrDefault<Color>(
                                                FFAppState()
                                                    .theme
                                                    .backgroudPrimaryColor,
                                                Color(0xFFE3F8FF),
                                              )
                                            : FlutterFlowTheme.of(context)
                                                .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: _model.survey!.selectedoptions
                                                  .contains(optionItem)
                                              ? valueOrDefault<Color>(
                                                  FFAppState()
                                                      .theme
                                                      .primaryColor,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                )
                                              : Color(0xFFEEEEEE),
                                          width: _model.survey!.selectedoptions
                                                  .contains(optionItem)
                                              ? 2.0
                                              : 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      showLoadingIndicator: false,
                                    );
                                  }).divide(SizedBox(height: 15.0)),
                                );
                              },
                            ),
                          if (_model.survey?.type == 'freeText')
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: TextFormField(
                                    controller: _model.answerTextController,
                                    focusNode: _model.answerFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Write down how are feeling',
                                      labelStyle: FlutterFlowTheme.of(context)
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
                                      alignLabelWithHint: true,
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
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
                                    textAlign: TextAlign.start,
                                    maxLines: 10,
                                    validator: _model
                                        .answerTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          if (_model.survey?.type == 'singleSelect')
                            Builder(
                              builder: (context) {
                                final singleSelectionvalue = (((_model
                                                            .surveyResponse
                                                            ?.jsonBody ??
                                                        '')
                                                    .toList()
                                                    .map<SurveyModelStruct?>(
                                                        SurveyModelStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<SurveyModelStruct?>)
                                            .withoutNulls
                                            .elementAtOrNull(_model.index))
                                        ?.options
                                        .toList() ??
                                    [];

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(singleSelectionvalue.length,
                                          (singleSelectionvalueIndex) {
                                    final singleSelectionvalueItem =
                                        singleSelectionvalue[
                                            singleSelectionvalueIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SURVEY_COMPONENT_Container_fb4bzt8u_ON_T');
                                        _model.updateSurveyStruct(
                                          (e) => e
                                            ..selectedoptions =
                                                (String option) {
                                              return [option];
                                            }(singleSelectionvalueItem)
                                                    .toList(),
                                        );
                                        safeSetState(() {});
                                        _model.singleSlectionSelectedIndex =
                                            singleSelectionvalueIndex;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.6,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                          border: Border.all(
                                            color: singleSelectionvalueIndex ==
                                                    _model
                                                        .singleSlectionSelectedIndex
                                                ? valueOrDefault<Color>(
                                                    FFAppState()
                                                        .theme
                                                        .primaryColor,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  )
                                                : Color(0xFFEEEEEE),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.lens_rounded,
                                                color: _model
                                                            .singleSlectionSelectedIndex ==
                                                        singleSelectionvalueIndex
                                                    ? valueOrDefault<Color>(
                                                        FFAppState()
                                                            .theme
                                                            .primaryColor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      )
                                                    : Color(0xFFD9D9D9),
                                                size: 12.0,
                                              ),
                                              Text(
                                                singleSelectionvalueItem,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Nevermind',
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Nevermind'),
                                                    ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).divide(SizedBox(height: 10.0)),
                                );
                              },
                            ),
                        ]
                            .divide(SizedBox(height: 20.0))
                            .addToStart(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: _model.disableAction
                          ? null
                          : () async {
                              logFirebaseEvent(
                                  'SURVEY_COMPONENT_COMP_NEXT__BTN_ON_TAP');
                              if (_model.survey?.type == 'freeText') {
                                _model.updateSurveyStruct(
                                  (e) => e
                                    ..selectedoptions = (String text) {
                                      return [text];
                                    }(_model.answerTextController.text)
                                        .toList(),
                                );
                                safeSetState(() {});
                              }
                              if (_model.index == 0) {
                                _model.insertAtIndexInAnsweredSurveys(
                                    0, _model.survey!);
                                safeSetState(() {});
                              } else {
                                _model.addToAnsweredSurveys(_model.survey!);
                                safeSetState(() {});
                              }

                              if (_model.index == 3) {
                                await widget.nextCallback?.call(
                                  functions.createSurveyRequest(
                                      _model.answeredSurveys.toList(),
                                      widget.doctorId!),
                                  false,
                                );
                                _model.answeredSurveys = [];
                                _model.disableAction = true;
                                safeSetState(() {});
                              } else {
                                _model.index = _model.index + 1;
                                safeSetState(() {});
                                _model.survey = ((_model
                                                    .surveyResponse?.jsonBody ??
                                                '')
                                            .toList()
                                            .map<SurveyModelStruct?>(
                                                SurveyModelStruct.maybeFromMap)
                                            .toList()
                                        as Iterable<SurveyModelStruct?>)
                                    .withoutNulls
                                    .elementAtOrNull(_model.index);
                                safeSetState(() {});
                              }

                              safeSetState(() {
                                _model.answerTextController?.clear();
                              });
                              _model.singleSlectionSelectedIndex = null;
                              safeSetState(() {});
                            },
                      text: 'Next >>',
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
                        disabledColor: Color(0x575D6A85),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: FFButtonWidget(
                      onPressed: _model.disableAction
                          ? null
                          : () async {
                              logFirebaseEvent(
                                  'SURVEY_COMPONENT_SKIP_SURVEY_BTN_ON_TAP');
                              _model.disableAction = true;
                              safeSetState(() {});
                              await widget.nextCallback?.call(
                                functions.createSurveyRequest(
                                    _model.answeredSurveys.toList(),
                                    widget.doctorId!),
                                true,
                              );
                              _model.index = 0;
                              _model.singleSlectionSelectedIndex = null;
                              safeSetState(() {});
                            },
                      text: 'Skip Survey',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00FFFFFF),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: valueOrDefault<Color>(
                                FFAppState().theme.primaryColor,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleSmallFamily),
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                        disabledTextColor: Color(0x7C5D6A85),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
