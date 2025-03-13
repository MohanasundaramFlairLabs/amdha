import '/backend/schema/structs/index.dart';
import '/components/questionnaire_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'heart_age_questionarie_model.dart';
export 'heart_age_questionarie_model.dart';

class HeartAgeQuestionarieWidget extends StatefulWidget {
  const HeartAgeQuestionarieWidget({
    super.key,
    this.task,
  });

  final TasksStruct? task;

  static String routeName = 'HeartAgeQuestionarie';
  static String routePath = '/heartAgeQuestionarie';

  @override
  State<HeartAgeQuestionarieWidget> createState() =>
      _HeartAgeQuestionarieWidgetState();
}

class _HeartAgeQuestionarieWidgetState
    extends State<HeartAgeQuestionarieWidget> {
  late HeartAgeQuestionarieModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeartAgeQuestionarieModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              title: 'Heart Health Assessment',
              questions: widget.task?.config.questions,
              subTitle: 'Discover Your Heart’s Age',
              goBack: () async {
                logFirebaseEvent('HEART_AGE_QUESTIONARIE_Container_ljv5o61');
                context.safePop();
              },
              successCallback: () async {
                logFirebaseEvent('HEART_AGE_QUESTIONARIE_Container_ljv5o61');

                context.pushNamed(
                  HeartAgeCompleteMessageWidget.routeName,
                  queryParameters: {
                    'taskId': serializeParam(
                      widget.task?.id,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
