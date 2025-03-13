import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_vitals_component_widget.dart';
import '/components/buy_credit_pop_up_widget.dart';
import '/components/connections_component_widget.dart';
import '/components/questionnaire_widget.dart';
import '/components/senior_instruction_widget.dart';
import '/components/task_main_component_widget.dart';
import '/components/test_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/add_medication_component/add_medication_component_widget.dart';
import '/pages/components/higher_order_components/file_upload_component/file_upload_component_widget.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'task_component_model.dart';
export 'task_component_model.dart';

class TaskComponentWidget extends StatefulWidget {
  const TaskComponentWidget({
    super.key,
    this.isHideNavBar,
    this.isFromNotification,
    this.taskId,
    this.callbackToResetNotification,
  });

  final Future Function(bool isHide)? isHideNavBar;
  final bool? isFromNotification;
  final String? taskId;
  final Future Function()? callbackToResetNotification;

  @override
  State<TaskComponentWidget> createState() => _TaskComponentWidgetState();
}

class _TaskComponentWidgetState extends State<TaskComponentWidget> {
  late TaskComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TASK_COMPONENT_TaskComponent_ON_INIT_STA');
      _model.mainPage = true;
      _model.isFromPushNotification = widget.isFromNotification!;
      safeSetState(() {});
    });

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
          (0.08 * MediaQuery.sizeOf(context).height),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (_model.mainPage)
            Expanded(
              child: Builder(
                builder: (context) => wrapWithModel(
                  model: _model.taskMainComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: TaskMainComponentWidget(
                    isFromNotification: _model.isFromPushNotification,
                    taskId: widget.taskId,
                    doActionCallback: (task) async {
                      logFirebaseEvent(
                          'TASK_COMPONENT_Container_bddgy5sn_CALLBA');
                      await Future.wait([
                        Future(() async {
                          if (task.taskType == 'questionnaire') {
                            await Future.wait([
                              Future(() async {}),
                              Future(() async {
                                if (task.config.type == 'wellness_onboarding') {
                                  context.pushNamed(
                                    OnboradingPageWidget.routeName,
                                    queryParameters: {
                                      'task': serializeParam(
                                        task,
                                        ParamType.DataStruct,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  if ((task.config.type ==
                                          'heart_age_calculator_male') ||
                                      (task.config.type ==
                                          'heart_age_calculator_female')) {
                                    context.pushNamed(
                                      HeartAgeLaunchPageWidget.routeName,
                                      queryParameters: {
                                        'task': serializeParam(
                                          task,
                                          ParamType.DataStruct,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    if (task.config.type ==
                                        'wellness_who_5_wellbeing') {
                                      context.pushNamed(
                                        WHOLaunchPageWidget.routeName,
                                        queryParameters: {
                                          'task': serializeParam(
                                            task,
                                            ParamType.DataStruct,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      if (task.config.type ==
                                          'falls_risk_assessment') {
                                        context.pushNamed(
                                          FRATLaunchPageWidget.routeName,
                                          queryParameters: {
                                            'task': serializeParam(
                                              task,
                                              ParamType.DataStruct,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        _model.mainPage = false;
                                        _model.questionPage = true;
                                        _model.task = task;
                                        safeSetState(() {});
                                        await widget.isHideNavBar?.call(
                                          true,
                                        );
                                      }
                                    }
                                  }
                                }
                              }),
                              Future(() async {}),
                              Future(() async {}),
                            ]);
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'medication_management') {
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              HomePageWidget.routeName,
                              queryParameters: {
                                'index': serializeParam(
                                  2,
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

                            _model.apiResultvfo =
                                await TaskGroup.submittaskCall.call(
                              userId: FFAppState().userId,
                              baseurl: FFAppState().baseUrl,
                              jsonJson: functions.createtaskResponse(
                                  task.taskType, '', task.id),
                            );
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'measurement') {
                            _model.mainPage = false;
                            _model.task = task;
                            _model.vitalPage = true;
                            safeSetState(() {});
                            await widget.isHideNavBar?.call(
                              true,
                            );
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'appointment_booking') {
                            _model.quotaResponsetask =
                                await SubscriptionGroup.getQuotasCall.call(
                              userId: FFAppState().userId,
                              baseurl: FFAppState().baseUrl,
                            );

                            if ((_model.quotaResponsetask?.succeeded ?? true)) {
                              if (QuotaModelStruct.maybeFromMap(
                                          (_model.quotaResponsetask?.jsonBody ??
                                              ''))!
                                      .quotas
                                      .videoCall >
                                  0) {
                                _model.mainPage = false;
                                _model.task = task;
                                _model.bookPage = true;
                                safeSetState(() {});
                                await widget.isHideNavBar?.call(
                                  true,
                                );
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        child: BuyCreditPopUpWidget(
                                          cancelCallback: () async {},
                                          acceptCallback: () async {
                                            await action_blocks
                                                .doSubscription(context);
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            }
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'report_upload') {
                            _model.task = task;
                            _model.fileUploadPage = true;
                            _model.mainPage = false;
                            safeSetState(() {});
                            await widget.isHideNavBar?.call(
                              true,
                            );
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'lab_test') {
                            _model.task = task;
                            safeSetState(() {});
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.25,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.85,
                                    child: TestPopUpWidget(
                                      title: 'Test location',
                                      subtitle:
                                          'Will you be conducting this test through an AMDHA health provider ?',
                                      taskId: task.id,
                                      bookAction: () async {
                                        _model.mainPage = false;
                                        _model.task = _model.task;
                                        _model.bookPage = true;
                                        safeSetState(() {});
                                        await widget.isHideNavBar?.call(
                                          true,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'symptom_tracker') {
                            context.pushNamed(
                              SymptomTrackerLaunchPageWidget.routeName,
                              queryParameters: {
                                'task': serializeParam(
                                  task,
                                  ParamType.DataStruct,
                                ),
                              }.withoutNulls,
                            );
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'education') {
                            _model.urlResult =
                                await HocGroup.getMediaUriCall.call(
                              userId: FFAppState().userId,
                              id: task.config.type,
                              baseurl: FFAppState().baseUrl,
                            );

                            if ((_model.urlResult?.succeeded ?? true)) {
                              if (MediaUrlStruct.maybeFromMap(
                                          (_model.urlResult?.jsonBody ?? ''))
                                      ?.contentType ==
                                  'video/mp4') {
                                context.pushNamed(
                                  VideoPreviewWidget.routeName,
                                  queryParameters: {
                                    'uri': serializeParam(
                                      getJsonField(
                                        (_model.urlResult?.jsonBody ?? ''),
                                        r'''$.url''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'title': serializeParam(
                                      task.config.configData.title,
                                      ParamType.String,
                                    ),
                                    'task': serializeParam(
                                      task,
                                      ParamType.DataStruct,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                context.pushNamed(
                                  PdfPreviewPageWidget.routeName,
                                  queryParameters: {
                                    'pdfuri': serializeParam(
                                      getJsonField(
                                        (_model.urlResult?.jsonBody ?? ''),
                                        r'''$.url''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'title': serializeParam(
                                      task.config.configData.title,
                                      ParamType.String,
                                    ),
                                    'isFromTask': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                    'task': serializeParam(
                                      task,
                                      ParamType.DataStruct,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                            }
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'instruction') {
                            if (task.config.type == 'goal_setting') {
                              context.pushNamed(
                                HomePageWidget.routeName,
                                queryParameters: {
                                  'index': serializeParam(
                                    4,
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

                              _model.apiResultopop =
                                  await TaskGroup.submittaskCall.call(
                                userId: FFAppState().userId,
                                baseurl: FFAppState().baseUrl,
                                jsonJson: functions.createtaskResponse(
                                    task.taskType, '', task.id),
                              );
                            } else {
                              if ((task.config.type == 'wellness_welcome') ||
                                  (task.config.type == 'wellness_end')) {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        child: SeniorInstructionWidget(
                                          task: task,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            }
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'mood_tracker') {
                            context.pushNamed(
                              MoodTrackerLaunchWidget.routeName,
                              queryParameters: {
                                'task': serializeParam(
                                  task,
                                  ParamType.DataStruct,
                                ),
                              }.withoutNulls,
                            );
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'affirmations') {
                            context.pushNamed(
                              AffirmationJournalLaunchWidget.routeName,
                              queryParameters: {
                                'title': serializeParam(
                                  'Boost Your Mindset with Positive Affirmations',
                                  ParamType.String,
                                ),
                                'subTitle': serializeParam(
                                  'Affirmations help shift your mindset and replace negativity with empowering beliefs.',
                                  ParamType.String,
                                ),
                                'secondaryTitle': serializeParam(
                                  'How to Practice:',
                                  ParamType.String,
                                ),
                                'listOfSuggetions': serializeParam(
                                  [
                                    "Find a quiet space.",
                                    "Repeat the affirmation 3-5 times (out loud or in your mind).",
                                    "Visualize its meaning as you say it."
                                  ],
                                  ParamType.String,
                                  isList: true,
                                ),
                                'buttonTitle': serializeParam(
                                  'Begin affirmations',
                                  ParamType.String,
                                ),
                                'task': serializeParam(
                                  task,
                                  ParamType.DataStruct,
                                ),
                              }.withoutNulls,
                            );
                          }
                        }),
                        Future(() async {
                          if (task.taskType == 'journal') {
                            context.pushNamed(
                              AffirmationJournalLaunchWidget.routeName,
                              queryParameters: {
                                'title': serializeParam(
                                  'Your Reflection Space for a Deeper Connection',
                                  ParamType.String,
                                ),
                                'subTitle': serializeParam(
                                  'Writing helps you process emotions, gain clarity, and track your pregnancy journey.',
                                  ParamType.String,
                                ),
                                'secondaryTitle': serializeParam(
                                  'How to Get Started',
                                  ParamType.String,
                                ),
                                'listOfSuggetions': serializeParam(
                                  [
                                    "Set a consistent time each week",
                                    "Read the weekly prompt and reflect on your experience.",
                                    "Write freely no need to worry about grammar or structure.",
                                    "Review your entry and notice key emotions or insights."
                                  ],
                                  ParamType.String,
                                  isList: true,
                                ),
                                'buttonTitle': serializeParam(
                                  'Start Journaling',
                                  ParamType.String,
                                ),
                                'task': serializeParam(
                                  task,
                                  ParamType.DataStruct,
                                ),
                              }.withoutNulls,
                            );
                          }
                        }),
                      ]);

                      safeSetState(() {});
                    },
                    actionForResetNotification: () async {
                      logFirebaseEvent(
                          'TASK_COMPONENT_Container_bddgy5sn_CALLBA');
                      _model.isFromPushNotification = false;
                      safeSetState(() {});
                      await widget.callbackToResetNotification?.call();
                    },
                  ),
                ),
              ),
            ),
          if (_model.questionPage)
            Expanded(
              child: wrapWithModel(
                model: _model.questionnaireModel,
                updateCallback: () => safeSetState(() {}),
                child: QuestionnaireWidget(
                  questions: _model.task?.config.questions,
                  taskId: _model.task?.id,
                  type: _model.task?.config.type,
                  title: valueOrDefault<String>(
                    _model.task?.config.configData.title,
                    'Get Started',
                  ),
                  subTitle:
                      'Please select one answer for each question that comes closest to how you have felt in the last 7 days. ',
                  goBack: () async {
                    logFirebaseEvent(
                        'TASK_COMPONENT_Container_f7xtzhy8_CALLBA');
                    _model.mainPage = true;
                    _model.questionPage = false;
                    safeSetState(() {});
                    await widget.isHideNavBar?.call(
                      false,
                    );
                  },
                  successCallback: () async {
                    logFirebaseEvent(
                        'TASK_COMPONENT_Container_f7xtzhy8_CALLBA');
                    _model.mainPage = true;
                    _model.questionPage = false;
                    safeSetState(() {});
                    await widget.isHideNavBar?.call(
                      false,
                    );
                  },
                ),
              ),
            ),
          if (_model.addmedicationPage)
            Expanded(
              child: wrapWithModel(
                model: _model.addMedicationComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: AddMedicationComponentWidget(
                  isEdit: false,
                  isUpcoming: false,
                  istask: true,
                  taskId: _model.task?.id,
                  callbackAddMedication: () async {
                    logFirebaseEvent(
                        'TASK_COMPONENT_Container_5k6790ut_CALLBA');
                    _model.addmedicationPage = false;
                    _model.mainPage = true;
                    safeSetState(() {});
                    await widget.isHideNavBar?.call(
                      false,
                    );
                  },
                ),
              ),
            ),
          if (_model.vitalPage)
            Expanded(
              child: wrapWithModel(
                model: _model.addVitalsComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: AddVitalsComponentWidget(
                  isEdit: false,
                  isAddFromGoal: false,
                  dateTime: getCurrentTimestamp,
                  isTask: true,
                  taskId: _model.task?.id,
                  vitalToEdit: VitalsStruct(
                    type: _model.task?.config.type,
                  ),
                  callback: (isNewVItalAdded, vitalName) async {
                    logFirebaseEvent(
                        'TASK_COMPONENT_Container_3cbsqc3x_CALLBA');
                    _model.mainPage = true;
                    _model.vitalPage = false;
                    safeSetState(() {});
                    await widget.isHideNavBar?.call(
                      false,
                    );
                  },
                  successCallbackToTask: () async {
                    logFirebaseEvent(
                        'TASK_COMPONENT_Container_3cbsqc3x_CALLBA');
                    _model.vitalPage = false;
                    _model.mainPage = true;
                    safeSetState(() {});
                    await widget.isHideNavBar?.call(
                      false,
                    );
                  },
                  bgCallback: () async {
                    logFirebaseEvent(
                        'TASK_COMPONENT_Container_3cbsqc3x_CALLBA');
                    _model.mainPage = true;
                    _model.vitalPage = false;
                    safeSetState(() {});
                    await widget.isHideNavBar?.call(
                      false,
                    );
                  },
                ),
              ),
            ),
          if (_model.noTaskPage)
            wrapWithModel(
              model: _model.noDataComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: NoDataComponentWidget(
                name: 'Task',
              ),
            ),
          if (_model.bookPage)
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.connectionsComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ConnectionsComponentWidget(
                    isFromReschedule: false,
                    isFromFollowUpOrTask: false,
                    rescheduledoctor: _model.task?.doctorData,
                    isFromTask: true,
                    taskId: _model.task?.id,
                    callbackNavbar: (isHide) async {},
                    backCallback: () async {
                      logFirebaseEvent(
                          'TASK_COMPONENT_Container_hz4gymol_CALLBA');
                      _model.mainPage = true;
                      _model.bookPage = false;
                      safeSetState(() {});
                      await widget.isHideNavBar?.call(
                        false,
                      );
                    },
                  ),
                ),
              ),
            ),
          if (_model.fileUploadPage)
            Expanded(
              child: wrapWithModel(
                model: _model.fileUploadComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: FileUploadComponentWidget(
                  isFromTask: true,
                  taskId: _model.task?.id,
                  category: _model.task?.config.configData.reportType,
                  documentType: _model.task?.config.configData.documentType,
                  allowDocumentDropDown:
                      _model.task?.config.configData.allowDropdown,
                  onBackPress: () async {
                    logFirebaseEvent(
                        'TASK_COMPONENT_Container_eroi1et4_CALLBA');
                    _model.mainPage = true;
                    _model.fileUploadPage = false;
                    safeSetState(() {});
                    await widget.isHideNavBar?.call(
                      false,
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
