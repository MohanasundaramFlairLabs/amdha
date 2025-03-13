import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/questionnaire_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'w_h_o_questionarie_model.dart';
export 'w_h_o_questionarie_model.dart';

class WHOQuestionarieWidget extends StatefulWidget {
  const WHOQuestionarieWidget({
    super.key,
    this.task,
  });

  final TasksStruct? task;

  static String routeName = 'WHOQuestionarie';
  static String routePath = '/wHOQuestionarie';

  @override
  State<WHOQuestionarieWidget> createState() => _WHOQuestionarieWidgetState();
}

class _WHOQuestionarieWidgetState extends State<WHOQuestionarieWidget> {
  late WHOQuestionarieModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WHOQuestionarieModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.questionnaireModel,
            updateCallback: () => safeSetState(() {}),
            child: QuestionnaireWidget(
              taskId: widget.task?.id,
              type: widget.task?.config.type,
              title: 'Mental Wellness Assessment',
              subTitle:
                  'Please respond to each question by selecting one option regarding how you felt about it in the past two weeks.',
              questions: widget.task?.config.questions,
              goBack: () async {
                logFirebaseEvent('W_H_O_QUESTIONARIE_Container_dqh93tba_CA');
                context.safePop();
              },
              successCallback: () async {
                logFirebaseEvent('W_H_O_QUESTIONARIE_Container_dqh93tba_CA');
                _model.apiResultiv1 =
                    await TaskGroup.getRecommendationCall.call(
                  taskId: widget.task?.id,
                  userId: FFAppState().userId,
                  baseurl: FFAppState().baseUrl,
                );

                if ((_model.apiResultiv1?.succeeded ?? true)) {
                  context.pushNamed(
                    WHORecommendationsWidget.routeName,
                    queryParameters: {
                      'score': serializeParam(
                        getJsonField(
                          (_model.apiResultiv1?.jsonBody ?? ''),
                          r'''$.additionalData.riskCategory''',
                        ).toString(),
                        ParamType.String,
                      ),
                      'recommendations': serializeParam(
                        (getJsonField(
                          (_model.apiResultiv1?.jsonBody ?? ''),
                          r'''$.recommendations''',
                          true,
                        )
                                ?.toList()
                                .map<RecommendationStruct?>(
                                    RecommendationStruct.maybeFromMap)
                                .toList() as Iterable<RecommendationStruct?>)
                            .withoutNulls,
                        ParamType.DataStruct,
                        isList: true,
                      ),
                    }.withoutNulls,
                  );
                }

                safeSetState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
