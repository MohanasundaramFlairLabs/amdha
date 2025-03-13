import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/why_it_matters_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'questionnaire_model.dart';
export 'questionnaire_model.dart';

class QuestionnaireWidget extends StatefulWidget {
  const QuestionnaireWidget({
    super.key,
    this.questions,
    this.goBack,
    this.taskId,
    this.successCallback,
    this.type,
    this.title,
    this.subTitle,
  });

  final List<QuestionnaireStruct>? questions;
  final Future Function()? goBack;
  final String? taskId;
  final Future Function()? successCallback;
  final String? type;
  final String? title;
  final String? subTitle;

  @override
  State<QuestionnaireWidget> createState() => _QuestionnaireWidgetState();
}

class _QuestionnaireWidgetState extends State<QuestionnaireWidget> {
  late QuestionnaireModel _model;

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
    _model = createModel(context, () => QuestionnaireModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUESTIONNAIRE_Questionnaire_ON_INIT_STAT');
      _model.index = 0;
      _model.question = widget.questions?.elementAtOrNull(0);
      _model.doSubmit = false;
      _model.answeredQuestions =
          widget.questions!.toList().cast<QuestionnaireStruct>();
      safeSetState(() {});
      _model.singleSlectionSelectedIndex = [];
      safeSetState(() {});
      safeSetState(() {
        _model.answerTextController?.clear();
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

    _model.answerTextController ??= TextEditingController();
    _model.answerFocusNode ??= FocusNode();
    _model.answerFocusNode!.addListener(
      () async {
        logFirebaseEvent('QUESTIONNAIRE_Answer_ON_FOCUS_CHANGE');
        _model.singleSlectionSelectedIndex = (int index) {
          return [index];
        }(0)
            .toList()
            .cast<int>();
        safeSetState(() {});
        _model.updateQuestionStruct(
          (e) => e
            ..selectedIndex = _model.singleSlectionSelectedIndex.toList()
            ..options = functions
                .convertToArrayofString(_model.answerTextController.text)
                .toList(),
        );
        _model.updateAnsweredQuestionsAtIndex(
          _model.index,
          (_) => _model.question!,
        );
        safeSetState(() {});
        if (_model.answeredQuestions.length == widget.questions?.length) {
          _model.canIsubmit2CopyyCopy = await actions.areAllQuestionsSelected(
            _model.answeredQuestions.toList(),
          );
          _model.doSubmit = _model.canIsubmit2CopyyCopy!;
          safeSetState(() {});
        }

        safeSetState(() {});
      },
    );
    _model.otherTextTextController ??= TextEditingController();
    _model.otherTextFocusNode ??= FocusNode();
    _model.otherTextFocusNode!.addListener(
      () async {
        logFirebaseEvent('QUESTIONNAIRE_OtherText_ON_FOCUS_CHANGE');
        _model.updateQuestionStruct(
          (e) => e..otherText = _model.otherTextTextController.text,
        );
        safeSetState(() {});
        _model.updateQuestionStruct(
          (e) => e..selectedIndex = _model.singleSlectionSelectedIndex.toList(),
        );
        _model.updateAnsweredQuestionsAtIndex(
          _model.index,
          (_) => _model.question!,
        );
        safeSetState(() {});
        if (_model.answeredQuestions.length == widget.questions?.length) {
          _model.canIsubmit444 = await actions.areAllQuestionsSelected(
            _model.answeredQuestions.toList(),
          );
          _model.doSubmit = _model.canIsubmit444!;
          safeSetState(() {});
        }

        safeSetState(() {});
      },
    );
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
          (0.08 * MediaQuery.sizeOf(context).height),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 56.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.title,
                          'Get Started',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'QUESTIONNAIRE_Container_t4bwrxh5_ON_TAP');
                        await widget.goBack?.call();
                      },
                      child: Container(
                        width: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.clear_sharp,
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
          ),
          Divider(
            height: 0.0,
            thickness: 0.25,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.subTitle != null && widget.subTitle != '')
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.subTitle,
                                '-',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Color(0xFF313131),
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final ques = widget.questions?.toList() ?? [];

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      List.generate(ques.length, (quesIndex) {
                                    final quesItem = ques[quesIndex];
                                    return Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'QUESTIONNAIRE_Container_tjgzder1_ON_TAP');
                                            await Future.wait([
                                              Future(() async {
                                                _model.index = quesIndex;
                                                safeSetState(() {});
                                                _model.question = widget
                                                    .questions
                                                    ?.elementAtOrNull(
                                                        _model.index);
                                                safeSetState(() {});
                                                if (_model.question!
                                                        .selectedIndex.length >
                                                    0) {
                                                  _model.singleSlectionSelectedIndex =
                                                      _model.question!
                                                          .selectedIndex
                                                          .toList()
                                                          .cast<int>();
                                                  safeSetState(() {});
                                                } else {
                                                  _model.singleSlectionSelectedIndex =
                                                      [];
                                                  safeSetState(() {});
                                                }
                                              }),
                                              Future(() async {
                                                _model.enableOtherText = false;
                                                safeSetState(() {});
                                                safeSetState(() {
                                                  _model.otherTextTextController
                                                      ?.clear();
                                                });
                                              }),
                                            ]);
                                          },
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color: quesItem
                                                      .selectedIndex.isNotEmpty
                                                  ? FFAppState()
                                                      .theme
                                                      .primaryColor
                                                  : FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              border: Border.all(
                                                color: quesItem.selectedIndex
                                                        .isNotEmpty
                                                    ? Color(0x00000000)
                                                    : Color(0x17949494),
                                                width: quesItem.selectedIndex
                                                        .isNotEmpty
                                                    ? 0.0
                                                    : 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          (quesIndex + 1).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: quesItem.selectedIndex
                                                        .isNotEmpty
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : Color(0xFF949494),
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
                                      ],
                                    );
                                  }).divide(SizedBox(width: 10.0)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: LinearPercentIndicator(
                              percent: functions.countTotalAnswers(
                                      _model.answeredQuestions.toList()) /
                                  widget.questions!.length,
                              lineHeight: 5.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor: valueOrDefault<Color>(
                                FFAppState().theme.primaryColor,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                              barRadius: Radius.circular(10.0),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          Text(
                            '${functions.countTotalAnswers(_model.answeredQuestions.toList()).toString()}/${widget.questions?.length.toString()}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: valueOrDefault<Color>(
                                    FFAppState().theme.primaryColor,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ].divide(SizedBox(width: 5.0)),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: Text(
                                    '${(int index) {
                                      return "${index + 1}";
                                    }(_model.index)}.  ${valueOrDefault<String>(
                                      _model.question?.question,
                                      'question',
                                    )}',
                                    textAlign: TextAlign.start,
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
                                ),
                              ),
                              if (_model.question?.type == 'multiSelect')
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: Text(
                                      '(Select multiple options )',
                                      textAlign: TextAlign.start,
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
                              if (_model.question?.type == 'singleSelect')
                                Builder(
                                  builder: (context) {
                                    final singleSelectionvalue =
                                        _model.question?.options.toList() ??
                                            [];

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          singleSelectionvalue.length,
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
                                                'QUESTIONNAIRE_Container_1ifnuvww_ON_TAP');
                                            _model.singleSlectionSelectedIndex =
                                                (int index) {
                                              return [index];
                                            }(singleSelectionvalueIndex)
                                                    .toList()
                                                    .cast<int>();
                                            safeSetState(() {});
                                            _model.updateQuestionStruct(
                                              (e) => e
                                                ..selectedIndex = _model
                                                    .singleSlectionSelectedIndex
                                                    .toList(),
                                            );
                                            _model
                                                .updateAnsweredQuestionsAtIndex(
                                              _model.index,
                                              (_) => _model.question!,
                                            );
                                            safeSetState(() {});
                                            if (_model
                                                    .answeredQuestions.length ==
                                                widget.questions?.length) {
                                              _model.canIsubmit2 = await actions
                                                  .areAllQuestionsSelected(
                                                _model.answeredQuestions
                                                    .toList(),
                                              );
                                              _model.doSubmit =
                                                  _model.canIsubmit2!;
                                              safeSetState(() {});
                                            }

                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: _model
                                                      .question!.selectedIndex
                                                      .contains(
                                                          singleSelectionvalueIndex)
                                                  ? FFAppState()
                                                      .theme
                                                      .backgroudPrimaryColor
                                                  : FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              border: Border.all(
                                                color: _model
                                                        .question!.selectedIndex
                                                        .contains(
                                                            singleSelectionvalueIndex)
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
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.7,
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      singleSelectionvalueItem
                                                          .text,
                                                      maxLines: 3,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nevermind',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nevermind'),
                                                          ),
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
                              if (_model.question?.type == 'freeText')
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      child: TextFormField(
                                        controller: _model.answerTextController,
                                        focusNode: _model.answerFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.answerTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            logFirebaseEvent(
                                                'QUESTIONNAIRE_Answer_ON_TEXTFIELD_CHANGE');
                                            await Future.wait([
                                              Future(() async {
                                                _model.singleSlectionSelectedIndex =
                                                    (int index) {
                                                  return [index];
                                                }(0)
                                                        .toList()
                                                        .cast<int>();
                                                safeSetState(() {});
                                                _model.updateQuestionStruct(
                                                  (e) => e
                                                    ..selectedIndex = _model
                                                        .singleSlectionSelectedIndex
                                                        .toList()
                                                    ..options = functions
                                                        .convertToArrayofString(
                                                            _model
                                                                .answerTextController
                                                                .text)
                                                        .toList(),
                                                );
                                                _model
                                                    .updateAnsweredQuestionsAtIndex(
                                                  _model.index,
                                                  (_) => _model.question!,
                                                );
                                                safeSetState(() {});
                                                if (_model.answeredQuestions
                                                        .length ==
                                                    widget.questions?.length) {
                                                  _model.canIsubmit2Copyy =
                                                      await actions
                                                          .areAllQuestionsSelected(
                                                    _model.answeredQuestions
                                                        .toList(),
                                                  );
                                                  _model.doSubmit =
                                                      _model.canIsubmit2Copyy!;
                                                  safeSetState(() {});
                                                }
                                              }),
                                            ]);

                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          labelText: 'Write down your answer',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          alignLabelWithHint: true,
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
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
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
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
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
                              if (_model.question?.type == 'multiSelect')
                                Builder(
                                  builder: (context) {
                                    final option =
                                        _model.question?.options.toList() ??
                                            [];

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(option.length,
                                          (optionIndex) {
                                        final optionItem = option[optionIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'QUESTIONNAIRE_Container_kcifchx9_ON_TAP');
                                            await Future.wait([
                                              Future(() async {
                                                if (!_model
                                                    .singleSlectionSelectedIndex
                                                    .contains(optionIndex)) {
                                                  if (!functions.isStringInList(
                                                      _model.question!,
                                                      optionItem.text)) {
                                                    _model
                                                        .addToSingleSlectionSelectedIndex(
                                                            optionIndex);
                                                    safeSetState(() {});
                                                    _model.updatedIndex =
                                                        await actions
                                                            .updateSelectedIndex(
                                                      _model.question!,
                                                      optionIndex,
                                                    );
                                                    _model.updateQuestionStruct(
                                                      (e) => e
                                                        ..selectedIndex = _model
                                                            .updatedIndex!
                                                            .toList(),
                                                    );
                                                    _model
                                                        .updateAnsweredQuestionsAtIndex(
                                                      _model.index,
                                                      (_) => _model.question!,
                                                    );
                                                    safeSetState(() {});
                                                    if (_model.answeredQuestions
                                                            .length ==
                                                        widget.questions
                                                            ?.length) {
                                                      _model.canIsubmit22244 =
                                                          await actions
                                                              .areAllQuestionsSelected(
                                                        _model.answeredQuestions
                                                            .toList(),
                                                      );
                                                      _model.doSubmit = _model
                                                          .canIsubmit22244!;
                                                      safeSetState(() {});
                                                    }
                                                  } else {
                                                    await Future.wait([
                                                      Future(() async {
                                                        _model.singleSlectionSelectedIndex =
                                                            (int index) {
                                                          return [index];
                                                        }(optionIndex)
                                                                .toList()
                                                                .cast<int>();
                                                        safeSetState(() {});
                                                        _model
                                                            .updateQuestionStruct(
                                                          (e) => e
                                                            ..selectedIndex = _model
                                                                .singleSlectionSelectedIndex
                                                                .toList(),
                                                        );
                                                        _model
                                                            .updateAnsweredQuestionsAtIndex(
                                                          _model.index,
                                                          (_) =>
                                                              _model.question!,
                                                        );
                                                        safeSetState(() {});
                                                        if (_model
                                                                .answeredQuestions
                                                                .length ==
                                                            widget.questions
                                                                ?.length) {
                                                          _model.canIsubmit2224455 =
                                                              await actions
                                                                  .areAllQuestionsSelected(
                                                            _model
                                                                .answeredQuestions
                                                                .toList(),
                                                          );
                                                          _model.doSubmit = _model
                                                              .canIsubmit2224455!;
                                                          safeSetState(() {});
                                                        }
                                                      }),
                                                    ]);
                                                  }
                                                } else {
                                                  await Future.wait([
                                                    Future(() async {
                                                      _model
                                                          .removeFromSingleSlectionSelectedIndex(
                                                              optionIndex);
                                                      _model.enableOtherText =
                                                          false;
                                                      safeSetState(() {});
                                                      _model
                                                          .updateQuestionStruct(
                                                        (e) => e
                                                          ..selectedIndex = _model
                                                              .singleSlectionSelectedIndex
                                                              .toList(),
                                                      );
                                                      _model
                                                          .updateAnsweredQuestionsAtIndex(
                                                        _model.index,
                                                        (_) => _model.question!,
                                                      );
                                                      safeSetState(() {});
                                                      if (_model
                                                              .answeredQuestions
                                                              .length ==
                                                          widget.questions
                                                              ?.length) {
                                                        _model.canIsubmit222 =
                                                            await actions
                                                                .areAllQuestionsSelected(
                                                          _model
                                                              .answeredQuestions
                                                              .toList(),
                                                        );
                                                        _model.doSubmit = _model
                                                            .canIsubmit222!;
                                                        safeSetState(() {});
                                                      }
                                                    }),
                                                  ]);
                                                }
                                              }),
                                            ]);
                                            if (functions.isOtherSelected(
                                                _model.question!)) {
                                              _model.enableOtherText = true;
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.otherTextTextController
                                                        ?.text =
                                                    _model.question!.otherText;
                                              });
                                            } else {
                                              _model.enableOtherText = false;
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model.otherTextTextController
                                                    ?.clear();
                                              });
                                            }

                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: _model
                                                      .singleSlectionSelectedIndex
                                                      .contains(optionIndex)
                                                  ? valueOrDefault<Color>(
                                                      FFAppState()
                                                          .theme
                                                          .backgroudPrimaryColor,
                                                      Color(0xFFE3F8FF),
                                                    )
                                                  : FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              border: Border.all(
                                                color: _model
                                                        .singleSlectionSelectedIndex
                                                        .contains(optionIndex)
                                                    ? valueOrDefault<Color>(
                                                        FFAppState()
                                                            .theme
                                                            .primaryColor,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      )
                                                    : Color(0xFFEEEEEE),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.7,
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      optionItem.text,
                                                      maxLines: 3,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nevermind',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Nevermind'),
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).divide(SizedBox(height: 15.0)),
                                    );
                                  },
                                ),
                              if (_model.enableOtherText)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    child: TextFormField(
                                      controller:
                                          _model.otherTextTextController,
                                      focusNode: _model.otherTextFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.otherTextTextController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          logFirebaseEvent(
                                              'QUESTIONNAIRE_OtherText_ON_TEXTFIELD_CHA');
                                          _model.updateQuestionStruct(
                                            (e) => e
                                              ..otherText = _model
                                                  .otherTextTextController.text,
                                          );
                                          safeSetState(() {});
                                          _model.updateQuestionStruct(
                                            (e) => e
                                              ..selectedIndex = _model
                                                  .singleSlectionSelectedIndex
                                                  .toList(),
                                          );
                                          _model.updateAnsweredQuestionsAtIndex(
                                            _model.index,
                                            (_) => _model.question!,
                                          );
                                          safeSetState(() {});
                                          if (_model.answeredQuestions.length ==
                                              widget.questions?.length) {
                                            _model.canIsubmit443 = await actions
                                                .areAllQuestionsSelected(
                                              _model.answeredQuestions.toList(),
                                            );
                                            _model.doSubmit =
                                                _model.canIsubmit443!;
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText: 'Write down your answer',
                                        labelStyle: FlutterFlowTheme.of(context)
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
                                        alignLabelWithHint: true,
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 0.5,
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
                                      validator: _model
                                          .otherTextTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                            ]
                                .divide(SizedBox(height: 20.0))
                                .addToStart(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 10.0))
                        .addToEnd(SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ),
          ),
          if (widget.type == 'falls_risk_assessment')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 20.0),
              child: wrapWithModel(
                model: _model.whyItMattersModel,
                updateCallback: () => safeSetState(() {}),
                child: WhyItMattersWidget(
                  title: (widget.questions?.elementAtOrNull(_model.index))
                      ?.additionalData
                      .title,
                  subTitle: (widget.questions?.elementAtOrNull(_model.index))
                      ?.additionalData
                      .description,
                ),
              ),
            ),
          if (!(isWeb
              ? MediaQuery.viewInsetsOf(context).bottom > 0
              : _isKeyboardVisible))
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FFButtonWidget(
                  onPressed: (_model.index == 0)
                      ? null
                      : () async {
                          logFirebaseEvent('QUESTIONNAIRE_COMP__BTN_ON_TAP');
                          _model.index = _model.index + -1;
                          _model.question =
                              widget.questions?.elementAtOrNull(_model.index);
                          safeSetState(() {});
                          if (_model.question!.selectedIndex.length > 0) {
                            _model.singleSlectionSelectedIndex = _model
                                .question!.selectedIndex
                                .toList()
                                .cast<int>();
                            safeSetState(() {});
                          } else {
                            _model.singleSlectionSelectedIndex = [];
                            safeSetState(() {});
                          }

                          _model.enableOtherText = false;
                          safeSetState(() {});
                          safeSetState(() {
                            _model.otherTextTextController?.clear();
                          });
                          if (functions.isOtherSelected(_model.question!)) {
                            _model.enableOtherText = true;
                            safeSetState(() {});
                            safeSetState(() {
                              _model.otherTextTextController?.text =
                                  _model.question!.otherText;
                            });
                          } else {
                            _model.enableOtherText = false;
                            safeSetState(() {});
                            safeSetState(() {
                              _model.otherTextTextController?.clear();
                            });
                          }
                        },
                  text: '',
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.12,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                    borderRadius: BorderRadius.circular(5.0),
                    disabledColor: Color(0xFFEEEEEE),
                  ),
                ),
                FFButtonWidget(
                  onPressed: !_model.doSubmit
                      ? null
                      : () async {
                          logFirebaseEvent(
                              'QUESTIONNAIRE_SUBMIT_QUESTIONNAIRE_BTN_O');
                          _model.apiResult864 =
                              await TaskGroup.submitQuestionsCall.call(
                            taskId: widget.taskId,
                            userId: FFAppState().userId,
                            baseurl: FFAppState().baseUrl,
                            questionnaireDataJson:
                                functions.createJsonForQuestionarrie(
                                    _model.answeredQuestions.toList()),
                            questionnaireType: widget.type,
                          );

                          if ((_model.apiResult864?.succeeded ?? true)) {
                            _model.apiResultccf =
                                await TaskGroup.submittaskCall.call(
                              jsonJson: functions.createtaskResponse(
                                  '', '', widget.taskId!),
                              userId: FFAppState().userId,
                              baseurl: FFAppState().baseUrl,
                            );

                            if ((_model.apiResultccf?.succeeded ?? true)) {
                              await widget.successCallback?.call();
                              _model.answeredQuestions = [];
                              _model.singleSlectionSelectedIndex = [];
                              _model.index = 0;
                              _model.doSubmit = false;
                              _model.question = null;
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Something went wrong.'),
                                    content: Text('Please try again'),
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
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text(
                                      (_model.apiResult864?.jsonBody ?? '')
                                          .toString()),
                                  content: Text('Please try again'),
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
                  text: widget.type == 'wellbeing'
                      ? 'Submit Questionnaire'
                      : 'Submit',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.55,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                    borderRadius: BorderRadius.circular(5.0),
                    disabledColor: Color(0xFFEEEEEE),
                  ),
                ),
                FFButtonWidget(
                  onPressed: ((_model.index >=
                              (widget.questions!.length - 1)) ||
                          _model.question!.selectedIndex.contains(-1))
                      ? null
                      : () async {
                          logFirebaseEvent('QUESTIONNAIRE_COMP__BTN_ON_TAP');
                          await Future.wait([
                            Future(() async {
                              if (_model.index <=
                                  (widget.questions!.length - 1)) {
                                _model.index = _model.index + 1;
                                safeSetState(() {});
                                _model.question = widget.questions
                                    ?.elementAtOrNull(_model.index);
                                safeSetState(() {});
                                if (_model.question!.selectedIndex.length > 0) {
                                  _model.singleSlectionSelectedIndex = _model
                                      .question!.selectedIndex
                                      .toList()
                                      .cast<int>();
                                  safeSetState(() {});
                                } else {
                                  _model.singleSlectionSelectedIndex = [];
                                  safeSetState(() {});
                                }
                              }
                              _model.enableOtherText = false;
                              safeSetState(() {});
                              safeSetState(() {
                                _model.otherTextTextController?.clear();
                              });
                              if (functions.isOtherSelected(_model.question!)) {
                                _model.enableOtherText = true;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.otherTextTextController?.text =
                                      _model.question!.otherText;
                                });
                              } else {
                                _model.enableOtherText = false;
                                safeSetState(() {});
                                safeSetState(() {
                                  _model.otherTextTextController?.clear();
                                });
                              }
                            }),
                            Future(() async {
                              if (_model.answeredQuestions.length ==
                                  widget.questions?.length) {
                                _model.canIsubmit1 =
                                    await actions.areAllQuestionsSelected(
                                  _model.answeredQuestions.toList(),
                                );
                                _model.doSubmit = _model.canIsubmit1!;
                                safeSetState(() {});
                              }
                            }),
                          ]);

                          safeSetState(() {});
                        },
                  text: '',
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.12,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                    borderRadius: BorderRadius.circular(5.0),
                    disabledColor: Color(0xFFEEEEEE),
                  ),
                ),
              ],
            ),
        ].addToEnd(SizedBox(height: 20.0)),
      ),
    );
  }
}
