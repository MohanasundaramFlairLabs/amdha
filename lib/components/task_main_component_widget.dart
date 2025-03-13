import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/task_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_main_component_model.dart';
export 'task_main_component_model.dart';

class TaskMainComponentWidget extends StatefulWidget {
  const TaskMainComponentWidget({
    super.key,
    this.doActionCallback,
    this.isFromNotification,
    this.taskId,
    this.actionForResetNotification,
  });

  final Future Function(TasksStruct task)? doActionCallback;
  final bool? isFromNotification;
  final String? taskId;
  final Future Function()? actionForResetNotification;

  @override
  State<TaskMainComponentWidget> createState() =>
      _TaskMainComponentWidgetState();
}

class _TaskMainComponentWidgetState extends State<TaskMainComponentWidget> {
  late TaskMainComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskMainComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TASK_MAIN_COMPONENT_TaskMainComponent_ON');
      _model.fetchMessage = 'Fetching Task...';
      safeSetState(() {});
      _model.tasksResult = await TaskGroup.getTaskCall.call(
        userId: FFAppState().userId,
        baseurl: FFAppState().baseUrl,
        startDate: functions
            .previousMorningDate(getCurrentTimestamp)
            .millisecondsSinceEpoch
            .toString(),
      );

      if ((_model.tasksResult?.succeeded ?? true)) {
        _model.taskFound =
            TaskModelStruct.maybeFromMap((_model.tasksResult?.jsonBody ?? ''))!
                .tasks
                .isNotEmpty;
        _model.isLoaded = true;
        _model.criticalTaskFound =
            TaskModelStruct.maybeFromMap((_model.tasksResult?.jsonBody ?? ''))!
                .tasks
                .where((e) => e.config.critical == true)
                .toList()
                .isNotEmpty;
        safeSetState(() {});
        _model.filteredTasks =
            TaskModelStruct.maybeFromMap((_model.tasksResult?.jsonBody ?? ''))!
                .tasks
                .where((e) =>
                    (e.status == 'pending') &&
                    functions.isToday(
                        functions.convertStringToDate(e.startDate),
                        functions.convertStringToDate(e.endDate)))
                .toList()
                .toList()
                .cast<TasksStruct>();
        safeSetState(() {});
        safeSetState(() {
          _model.dropDownValueController?.reset();
        });
        if (widget.isFromNotification!) {
          await widget.doActionCallback?.call(
            TaskModelStruct.maybeFromMap((_model.tasksResult?.jsonBody ?? ''))!
                .tasks
                .where((e) => e.id == widget.taskId)
                .toList()
                .firstOrNull!,
          );
          await widget.actionForResetNotification?.call();
        }
      } else {
        _model.fetchMessage = 'Can\'t fetch your task at the moment.';
        safeSetState(() {});
        await action_blocks.sessionExpired(
          context,
          statusCode: (_model.tasksResult?.statusCode ?? 200),
        );
      }
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

    return Builder(
      builder: (context) {
        if (_model.isLoaded) {
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 56.0,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Activities',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      AlignedTooltip(
                        content: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Switch toggle on to view all interventions tasks',
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                          ),
                        ),
                        offset: 4.0,
                        preferredDirection: AxisDirection.down,
                        borderRadius: BorderRadius.circular(8.0),
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 4.0,
                        tailBaseWidth: 24.0,
                        tailLength: 12.0,
                        waitDuration: Duration(milliseconds: 100),
                        showDuration: Duration(milliseconds: 1500),
                        triggerMode: TooltipTriggerMode.tap,
                        child: Container(
                          width: 60.0,
                          height: 30.0,
                          child: custom_widgets.CustomToggleButton(
                            width: 60.0,
                            height: 30.0,
                            isIntervention: _model.isIntervention,
                            actioncallback: () async {
                              logFirebaseEvent(
                                  'TASK_MAIN_COMPONENT_Container_4ujs8p00_C');
                              _model.isIntervention = !_model.isIntervention;
                              safeSetState(() {});
                              if (_model.isIntervention) {
                                safeSetState(() {
                                  _model.dropDownValueController?.value =
                                      'Active';
                                });
                              }
                            },
                          ),
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
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        FFAppState().theme.backgroudPrimaryColor,
                        Color(0x2B3894B5),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.taskFound)
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (false)
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Task for today (${TaskModelStruct.maybeFromMap((_model.tasksResult?.jsonBody ?? ''))?.tasks.where((e) => (e.config.critical == false) && (functions.isToday(functions.convertStringToDate(e.startDate), functions.convertStringToDate(e.endDate)) && (e.status == 'pending'))).toList().length.toString()})',
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
                                              Builder(
                                                builder: (context) {
                                                  final todayTask = TaskModelStruct
                                                              .maybeFromMap((_model
                                                                      .tasksResult
                                                                      ?.jsonBody ??
                                                                  ''))
                                                          ?.tasks
                                                          .where((e) =>
                                                              e.config
                                                                  .critical ==
                                                              false)
                                                          .toList()
                                                          .toList() ??
                                                      [];

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        todayTask.length,
                                                        (todayTaskIndex) {
                                                      final todayTaskItem =
                                                          todayTask[
                                                              todayTaskIndex];
                                                      return Visibility(
                                                        visible: functions.isToday(
                                                                functions.convertStringToDate(
                                                                    todayTaskItem
                                                                        .startDate),
                                                                functions.convertStringToDate(
                                                                    todayTaskItem
                                                                        .endDate)) &&
                                                            (todayTaskItem
                                                                    .status ==
                                                                'pending'),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'TASK_MAIN_COMPONENT_Container_ym3ipbkq_O');
                                                            if (todayTaskItem
                                                                    .status ==
                                                                'pending') {
                                                              await widget
                                                                  .doActionCallback
                                                                  ?.call(
                                                                todayTaskItem,
                                                              );
                                                            }
                                                          },
                                                          child: TaskCardWidget(
                                                            key: Key(
                                                                'Keyym3_${todayTaskIndex}_of_${todayTask.length}'),
                                                            task: todayTaskItem,
                                                          ),
                                                        ),
                                                      );
                                                    }).divide(
                                                      SizedBox(height: 15.0),
                                                      filterFn:
                                                          (todayTaskIndex) {
                                                        final todayTaskItem =
                                                            todayTask[
                                                                todayTaskIndex];
                                                        return functions.isToday(
                                                                functions.convertStringToDate(
                                                                    todayTaskItem
                                                                        .startDate),
                                                                functions.convertStringToDate(
                                                                    todayTaskItem
                                                                        .endDate)) &&
                                                            (todayTaskItem
                                                                    .status ==
                                                                'pending');
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ]
                                                .divide(SizedBox(height: 10.0))
                                                .addToStart(
                                                    SizedBox(height: 10.0))
                                                .addToEnd(
                                                    SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    'All Activities (${_model.filteredTasks.where((e) => _model.isIntervention ? (e.config.critical == true) : true).toList().length.toString()})',
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
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0xFF313131),
                                                      width: 0.5,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.filter_list,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                      FlutterFlowDropDown<
                                                          String>(
                                                        controller: _model
                                                                .dropDownValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model.dropDownValue ??=
                                                              'Active',
                                                        ),
                                                        options: [
                                                          'Active',
                                                          'Completed',
                                                          'Expired'
                                                        ],
                                                        onChanged: (val) async {
                                                          safeSetState(() =>
                                                              _model.dropDownValue =
                                                                  val);
                                                          logFirebaseEvent(
                                                              'TASK_MAIN_COMPONENT_DropDown_1xuzlwky_ON');
                                                          await Future.wait([
                                                            Future(() async {
                                                              if (_model
                                                                      .dropDownValue ==
                                                                  'Completed') {
                                                                _model
                                                                    .filteredTasks = TaskModelStruct.maybeFromMap((_model
                                                                            .tasksResult
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tasks
                                                                    .where((e) =>
                                                                        e.status ==
                                                                        'completed')
                                                                    .toList()
                                                                    .cast<
                                                                        TasksStruct>();
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            }),
                                                            Future(() async {
                                                              if (_model
                                                                      .dropDownValue ==
                                                                  'Upcoming') {
                                                                _model
                                                                    .filteredTasks = TaskModelStruct.maybeFromMap((_model
                                                                            .tasksResult
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tasks
                                                                    .where((e) =>
                                                                        (e.status ==
                                                                            'pending') &&
                                                                        (functions.checkDateStatus(functions.convertStringToDate(e.endDate), e.status) ==
                                                                            'upcoming'))
                                                                    .toList()
                                                                    .cast<
                                                                        TasksStruct>();
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            }),
                                                            Future(() async {
                                                              if (_model
                                                                      .dropDownValue ==
                                                                  'Expired') {
                                                                _model
                                                                    .filteredTasks = TaskModelStruct.maybeFromMap((_model
                                                                            .tasksResult
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tasks
                                                                    .where((e) =>
                                                                        e.status ==
                                                                        'expired')
                                                                    .toList()
                                                                    .cast<
                                                                        TasksStruct>();
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            }),
                                                            Future(() async {
                                                              if (_model
                                                                      .dropDownValue ==
                                                                  'Active') {
                                                                _model
                                                                    .filteredTasks = TaskModelStruct.maybeFromMap((_model
                                                                            .tasksResult
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .tasks
                                                                    .where((e) =>
                                                                        (e.status ==
                                                                            'pending') &&
                                                                        functions.isToday(
                                                                            functions.convertStringToDate(e.startDate),
                                                                            functions.convertStringToDate(e.endDate)))
                                                                    .toList()
                                                                    .cast<TasksStruct>();
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            }),
                                                          ]);
                                                        },
                                                        width: 130.0,
                                                        height: 40.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final task = _model
                                                    .filteredTasks
                                                    .where((e) => _model
                                                            .isIntervention
                                                        ? (e.config.critical ==
                                                            true)
                                                        : true)
                                                    .toList();
                                                if (task.isEmpty) {
                                                  return NoDataComponentWidget(
                                                    name: () {
                                                      if (_model
                                                              .dropDownValue ==
                                                          'Completed') {
                                                        return ' Activities';
                                                      } else if (_model
                                                              .dropDownValue ==
                                                          'Expired') {
                                                        return 'Activities';
                                                      } else {
                                                        return 'Activities';
                                                      }
                                                    }(),
                                                  );
                                                }

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      task.length, (taskIndex) {
                                                    final taskItem =
                                                        task[taskIndex];
                                                    return InkWell(
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
                                                            'TASK_MAIN_COMPONENT_Container_h99wydmn_O');
                                                        if ((taskItem.status ==
                                                                'pending') &&
                                                            functions.isToday(
                                                                functions
                                                                    .convertStringToDate(
                                                                        taskItem
                                                                            .startDate),
                                                                functions
                                                                    .convertStringToDate(
                                                                        taskItem
                                                                            .endDate))) {
                                                          await widget
                                                              .doActionCallback
                                                              ?.call(
                                                            taskItem,
                                                          );
                                                        }
                                                      },
                                                      child: TaskCardWidget(
                                                        key: Key(
                                                            'Keyh99_${taskIndex}_of_${task.length}'),
                                                        task: taskItem,
                                                      ),
                                                    );
                                                  }).divide(
                                                      SizedBox(height: 15.0)),
                                                );
                                              },
                                            ),
                                          ]
                                              .divide(SizedBox(height: 10.0))
                                              .addToStart(
                                                  SizedBox(height: 10.0))
                                              .addToEnd(SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (!_model.taskFound)
                          Expanded(
                            child: wrapWithModel(
                              model: _model.noDataComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NoDataComponentWidget(
                                name: 'Activities',
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
        } else {
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.6,
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                _model.fetchMessage,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          );
        }
      },
    );
  }
}
