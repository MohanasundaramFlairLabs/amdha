import '/backend/schema/structs/index.dart';
import '/components/questionnaire_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'onboarding_questionarie_model.dart';
export 'onboarding_questionarie_model.dart';

class OnboardingQuestionarieWidget extends StatefulWidget {
  const OnboardingQuestionarieWidget({
    super.key,
    this.task,
  });

  final TasksStruct? task;

  static String routeName = 'OnboardingQuestionarie';
  static String routePath = '/onboardingQuestionarie';

  @override
  State<OnboardingQuestionarieWidget> createState() =>
      _OnboardingQuestionarieWidgetState();
}

class _OnboardingQuestionarieWidgetState
    extends State<OnboardingQuestionarieWidget> {
  late OnboardingQuestionarieModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingQuestionarieModel());

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
              questions: widget.task?.config.questions,
              goBack: () async {
                logFirebaseEvent('ONBOARDING_QUESTIONARIE_Container_5rdxwm');
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed(
                  HomePageWidget.routeName,
                  queryParameters: {
                    'index': serializeParam(
                      1,
                      ParamType.int,
                    ),
                    'doScan': serializeParam(
                      false,
                      ParamType.bool,
                    ),
                    'isFromNotification': serializeParam(
                      false,
                      ParamType.bool,
                    ),
                    'taskId': serializeParam(
                      '',
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              successCallback: () async {
                logFirebaseEvent('ONBOARDING_QUESTIONARIE_Container_5rdxwm');

                context.pushNamed(
                  OnboardingCompleteMessageWidget.routeName,
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
