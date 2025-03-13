import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/book_consultation_component_widget.dart';
import '/components/booking_confirmation_component_widget.dart';
import '/components/consultation_history_widget.dart';
import '/components/doctor_profile_component_widget.dart';
import '/components/doctors_list_component_widget.dart';
import '/components/survey_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'connections_component_model.dart';
export 'connections_component_model.dart';

class ConnectionsComponentWidget extends StatefulWidget {
  const ConnectionsComponentWidget({
    super.key,
    this.callbackNavbar,
    bool? isFromReschedule,
    this.backCallback,
    this.rescheduledoctor,
    this.rescheduleConsulationId,
    bool? isFromFollowUpOrTask,
    bool? isFromTask,
    this.taskId,
  })  : this.isFromReschedule = isFromReschedule ?? false,
        this.isFromFollowUpOrTask = isFromFollowUpOrTask ?? false,
        this.isFromTask = isFromTask ?? false;

  final Future Function(bool? isHide)? callbackNavbar;
  final bool isFromReschedule;
  final Future Function()? backCallback;
  final DoctorModelStruct? rescheduledoctor;
  final String? rescheduleConsulationId;
  final bool isFromFollowUpOrTask;
  final bool isFromTask;
  final String? taskId;

  @override
  State<ConnectionsComponentWidget> createState() =>
      _ConnectionsComponentWidgetState();
}

class _ConnectionsComponentWidgetState
    extends State<ConnectionsComponentWidget> {
  late ConnectionsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectionsComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONNECTIONS_COMPONENT_ConnectionsCompone');
      if (widget.isFromReschedule) {
        _model.thirdPage = true;
        _model.doctor = widget.rescheduledoctor;
        _model.firstPage = false;
        safeSetState(() {});
      } else {
        if (widget.isFromFollowUpOrTask || widget.isFromTask) {
          _model.thirdPage = true;
          _model.doctor = widget.rescheduledoctor;
          _model.consentStatus = true;
          _model.firstPage = false;
          safeSetState(() {});
        } else {
          _model.firstPage = true;
          safeSetState(() {});
        }
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

    return Container(
      height: MediaQuery.sizeOf(context).height -
          FFAppState().statusBarHeight -
          FFAppState().navBarHeight,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (_model.firstPage)
            Expanded(
              child: wrapWithModel(
                model: _model.doctorsListComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: DoctorsListComponentWidget(
                  callback: (model) async {
                    logFirebaseEvent(
                        'CONNECTIONS_COMPONENT_Container_q9p7sqpe');
                    _model.doctor = model;
                    safeSetState(() {});
                    _model.firstPage = false;
                    _model.secondPage = true;
                    _model.updatePage(() {});
                    await widget.callbackNavbar?.call(
                      true,
                    );
                  },
                ),
              ),
            ),
          if (_model.secondPage)
            Expanded(
              child: wrapWithModel(
                model: _model.doctorProfileComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: DoctorProfileComponentWidget(
                  doctor: _model.doctor,
                  bookAppointmentAction: () async {
                    logFirebaseEvent(
                        'CONNECTIONS_COMPONENT_Container_m3yalve0');
                    _model.consentResponse =
                        await ConnectionsGroup.getConsentCall.call(
                      doctorId: _model.doctor?.userId,
                      userId: FFAppState().userId,
                      baseurl: FFAppState().baseUrl,
                    );

                    if ((_model.consentResponse?.succeeded ?? true)) {
                      _model.consentStatus = getJsonField(
                        (_model.consentResponse?.jsonBody ?? ''),
                        r'''$.hasConsent''',
                      );
                      safeSetState(() {});
                      _model.secondPage = false;
                      _model.thirdPage = true;
                      safeSetState(() {});
                      await widget.callbackNavbar?.call(
                        true,
                      );
                    } else {
                      await action_blocks.sessionExpired(
                        context,
                        statusCode: (_model.consentResponse?.statusCode ?? 200),
                      );
                    }

                    safeSetState(() {});
                  },
                  backCallback: () async {
                    logFirebaseEvent(
                        'CONNECTIONS_COMPONENT_Container_m3yalve0');
                    _model.firstPage = true;
                    _model.secondPage = false;
                    _model.updatePage(() {});
                    await widget.callbackNavbar?.call(
                      false,
                    );
                  },
                  historyCallback: (history) async {
                    logFirebaseEvent(
                        'CONNECTIONS_COMPONENT_Container_m3yalve0');
                    _model.sixPage = true;
                    _model.secondPage = false;
                    _model.history = history;
                    safeSetState(() {});
                  },
                ),
              ),
            ),
          if (_model.thirdPage)
            Expanded(
              child: wrapWithModel(
                model: _model.bookConsultationComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: BookConsultationComponentWidget(
                  model: _model.doctor!,
                  consentStatus: _model.consentStatus,
                  isReschedule: widget.isFromReschedule,
                  isTask: widget.isFromTask,
                  isFollowup: widget.isFromFollowUpOrTask,
                  backCallback: () async {
                    logFirebaseEvent(
                        'CONNECTIONS_COMPONENT_Container_6nywi6gj');
                    if (widget.isFromReschedule) {
                      await widget.backCallback?.call();
                    } else {
                      if (widget.isFromTask || widget.isFromFollowUpOrTask) {
                        await widget.backCallback?.call();
                      } else {
                        _model.secondPage = true;
                        _model.thirdPage = false;
                        _model.updatePage(() {});
                      }
                    }
                  },
                  bookCallback:
                      (slot, consent, consultationType, reason) async {
                    logFirebaseEvent(
                        'CONNECTIONS_COMPONENT_Container_6nywi6gj');
                    if (widget.isFromReschedule) {
                      _model.slot = slot;
                      _model.newConsentStatus = consent;
                      safeSetState(() {});
                      _model.apiResult35u =
                          await ConnectionsGroup.rescheduleConsultCall.call(
                        userId: FFAppState().userId,
                        baseurl: FFAppState().baseUrl,
                        startTime: functions
                            .convertStringToDate(_model.slot!.start)
                            .millisecondsSinceEpoch
                            .toString(),
                        endTime: functions
                            .convertStringToDate(_model.slot!.end)
                            .millisecondsSinceEpoch
                            .toString(),
                        appointmentId: widget.rescheduleConsulationId,
                        reason: reason,
                      );

                      if ((_model.apiResult35u?.succeeded ?? true)) {
                        await widget.backCallback?.call();
                      } else {
                        await action_blocks.sessionExpired(
                          context,
                          statusCode: (_model.apiResult35u?.statusCode ?? 200),
                        );
                      }
                    } else {
                      _model.slot = slot;
                      _model.newConsentStatus = consent;
                      _model.consultationType = consultationType;
                      safeSetState(() {});
                      _model.thirdPage = false;
                      _model.fourPage = true;
                      _model.updatePage(() {});
                    }

                    safeSetState(() {});
                  },
                ),
              ),
            ),
          if (_model.fourPage)
            Expanded(
              child: wrapWithModel(
                model: _model.surveyComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: SurveyComponentWidget(
                  doctorId: _model.doctor?.userId,
                  backCallback: () async {
                    logFirebaseEvent(
                        'CONNECTIONS_COMPONENT_Container_5svc66ra');
                    _model.fourPage = false;
                    _model.thirdPage = true;
                    _model.updatePage(() {});
                  },
                  nextCallback: (data, isSkipSurvey) async {
                    logFirebaseEvent(
                        'CONNECTIONS_COMPONENT_Container_5svc66ra');
                    _model.apiResultrcy =
                        await ConnectionsGroup.bookConsultCall.call(
                      startTime: functions
                          .convertStringToDate(_model.slot!.start)
                          .millisecondsSinceEpoch
                          .toString(),
                      endTime: functions
                          .convertStringToDate(_model.slot!.end)
                          .millisecondsSinceEpoch
                          .toString(),
                      notes: _model.slot?.reason,
                      reason: _model.slot?.reason,
                      doctorId: _model.doctor?.userId,
                      userId: FFAppState().userId,
                      baseurl: FFAppState().baseUrl,
                      consultationType: _model.consultationType,
                      taskId: widget.taskId != null && widget.taskId != ''
                          ? widget.taskId
                          : (""),
                    );

                    if ((_model.apiResultrcy?.succeeded ?? true)) {
                      await Future.wait([
                        Future(() async {
                          if (_model.consentStatus) {
                            _model.fourPage = false;
                            _model.fivePage = true;
                            _model.updatePage(() {});
                          } else {
                            if (_model.newConsentStatus) {
                              _model.apiResulttto =
                                  await ConnectionsGroup.submitConsentCall.call(
                                doctorId: _model.doctor?.userId,
                                status: _model.newConsentStatus,
                                userId: FFAppState().userId,
                                baseurl: FFAppState().baseUrl,
                              );

                              if ((_model.apiResulttto?.succeeded ?? true)) {
                                _model.fourPage = false;
                                _model.fivePage = true;
                                _model.updatePage(() {});
                              } else {
                                await action_blocks.sessionExpired(
                                  context,
                                  statusCode:
                                      (_model.apiResulttto?.statusCode ?? 200),
                                );
                              }
                            } else {
                              _model.fourPage = false;
                              _model.fivePage = true;
                              _model.updatePage(() {});
                            }
                          }
                        }),
                        Future(() async {
                          if (!isSkipSurvey) {
                            _model.apiResultoxa =
                                await ConnectionsGroup.submitSurveyCall.call(
                              dataJson: data,
                              doctorId: _model.doctor?.userId,
                              userId: FFAppState().userId,
                              baseurl: FFAppState().baseUrl,
                              consultationId: getJsonField(
                                (_model.apiResultrcy?.jsonBody ?? ''),
                                r'''$.data.consultationId''',
                              ).toString(),
                            );
                          }
                        }),
                      ]);
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text(getJsonField(
                              (_model.apiResultrcy?.jsonBody ?? ''),
                              r'''$.message''',
                            ).toString()),
                            content: Text('Please try again.'),
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
                      _model.thirdPage = true;
                      _model.fourPage = false;
                      safeSetState(() {});
                      await action_blocks.sessionExpired(
                        context,
                        statusCode: (_model.apiResultrcy?.statusCode ?? 200),
                      );
                    }

                    safeSetState(() {});
                  },
                ),
              ),
            ),
          if (_model.fivePage)
            Expanded(
              child: wrapWithModel(
                model: _model.bookingConfirmationComponentModel,
                updateCallback: () => safeSetState(() {}),
                child: BookingConfirmationComponentWidget(
                  date: functions.convertStringToDate(_model.slot!.start),
                  isFromTaskFollowUp: widget.isFromFollowUpOrTask,
                  isFromTask: widget.isFromTask,
                  callback: () async {
                    logFirebaseEvent(
                        'CONNECTIONS_COMPONENT_Container_9x0xmfna');
                    await Future.wait([
                      Future(() async {
                        if (widget.isFromFollowUpOrTask) {
                          await widget.backCallback?.call();
                          _model.firstPage = true;
                          _model.fivePage = false;
                          safeSetState(() {});
                        } else {
                          if (widget.isFromTask) {
                            unawaited(
                              () async {
                                _model.apiResultc3s =
                                    await TaskGroup.submittaskCall.call(
                                  jsonJson: functions.createtaskResponse(
                                      '', '', widget.taskId!),
                                  userId: FFAppState().userId,
                                  baseurl: FFAppState().baseUrl,
                                );
                              }(),
                            );
                            await widget.backCallback?.call();
                            _model.firstPage = true;
                            _model.fivePage = false;
                            safeSetState(() {});
                          } else {
                            await widget.callbackNavbar?.call(
                              false,
                            );
                            _model.fivePage = false;
                            _model.firstPage = true;
                            _model.updatePage(() {});
                          }
                        }
                      }),
                    ]);

                    safeSetState(() {});
                  },
                ),
              ),
            ),
          if (_model.sixPage)
            Expanded(
              child: wrapWithModel(
                model: _model.consultationHistoryModel,
                updateCallback: () => safeSetState(() {}),
                child: ConsultationHistoryWidget(
                  consultationHistory: _model.history,
                  backCallback: () async {
                    logFirebaseEvent(
                        'CONNECTIONS_COMPONENT_Container_bbzg1tdp');
                    _model.secondPage = true;
                    _model.sixPage = false;
                    safeSetState(() {});
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
