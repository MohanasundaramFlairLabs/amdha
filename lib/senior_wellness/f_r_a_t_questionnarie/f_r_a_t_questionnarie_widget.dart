import '/backend/schema/structs/index.dart';
import '/components/questionnaire_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'f_r_a_t_questionnarie_model.dart';
export 'f_r_a_t_questionnarie_model.dart';

class FRATQuestionnarieWidget extends StatefulWidget {
  const FRATQuestionnarieWidget({
    super.key,
    this.task,
  });

  final TasksStruct? task;

  static String routeName = 'FRATQuestionnarie';
  static String routePath = '/fRATQuestionnarie';

  @override
  State<FRATQuestionnarieWidget> createState() =>
      _FRATQuestionnarieWidgetState();
}

class _FRATQuestionnarieWidgetState extends State<FRATQuestionnarieWidget> {
  late FRATQuestionnarieModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FRATQuestionnarieModel());

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
              title: 'Falls Risk Assessment',
              questions: widget.task?.config.questions,
              goBack: () async {
                logFirebaseEvent('F_R_A_T_QUESTIONNARIE_Container_7m1v3jis');
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
                logFirebaseEvent('F_R_A_T_QUESTIONNARIE_Container_7m1v3jis');

                context.goNamed(
                  FRATThankYouPageWidget.routeName,
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
