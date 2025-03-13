import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/medication_components/upcoming_medication_card/upcoming_medication_card_widget.dart';
import '/pages/components/micro_components/not_found_component/not_found_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upcoming_medication_component_model.dart';
export 'upcoming_medication_component_model.dart';

class UpcomingMedicationComponentWidget extends StatefulWidget {
  const UpcomingMedicationComponentWidget({super.key});

  @override
  State<UpcomingMedicationComponentWidget> createState() =>
      _UpcomingMedicationComponentWidgetState();
}

class _UpcomingMedicationComponentWidgetState
    extends State<UpcomingMedicationComponentWidget> {
  late UpcomingMedicationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpcomingMedicationComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('UPCOMING_MEDICATION_COMPONENT_UpcomingMe');
      if (!isWeb) {
        _model.medicationList = await HocGroup.upcomingMedicationCall.call(
          userId: FFAppState().userId,
          timestamp: getCurrentTimestamp.toString(),
          baseurl: FFAppState().baseUrl,
        );

        if ((_model.medicationList?.succeeded ?? true)) {
          _model.medications = (getJsonField(
            (_model.medicationList?.jsonBody ?? ''),
            r'''$.data''',
            true,
          )!
                  .toList()
                  .map<MedicationModelStruct?>(
                      MedicationModelStruct.maybeFromMap)
                  .toList() as Iterable<MedicationModelStruct?>)
              .withoutNulls
              .toList()
              .cast<MedicationModelStruct>();
          safeSetState(() {});
          if (_model.medications.length > 0) {
            _model.remainderMedications = await actions.getRemainderDates(
              _model.medications.toList(),
            );
            await actions.registerForLocalNotification(
              _model.remainderMedications!.toList(),
            );
          }
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

    return FutureBuilder<ApiCallResponse>(
      future: FFAppState().fetchUpcomingMedication(
        requestFn: () => HocGroup.upcomingMedicationCall.call(
          userId: FFAppState().userId,
          baseurl: FFAppState().baseUrl,
          timestamp: getCurrentTimestamp.toString(),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final containerUpcomingMedicationResponse = snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: Color(0x145D6A85),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Upcoming Medications',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      if ((getJsonField(
                            containerUpcomingMedicationResponse.jsonBody,
                            r'''$.data''',
                          )
                                  .toList()
                                  .map<MedicationModelStruct?>(
                                      MedicationModelStruct.maybeFromMap)
                                  .toList() as Iterable<MedicationModelStruct?>)
                              .withoutNulls
                              .length >
                          0)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'UPCOMING_MEDICATION_COMPONENT_Row_cj4u56');
                            if (FFAppState().quotas.quotas.medicationReminders >
                                0) {
                              context.pushNamed(
                                HomePageWidget.routeName,
                                queryParameters: {
                                  'index': serializeParam(
                                    2,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              await action_blocks.doSubscription(context);
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'View all',
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
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.angleRight,
                                color: valueOrDefault<Color>(
                                  FFAppState().theme.primaryColor,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                size: 14.0,
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                    ],
                  ),
                ),
                Builder(
                  builder: (context) {
                    final medication = (getJsonField(
                          containerUpcomingMedicationResponse.jsonBody,
                          r'''$.data''',
                          true,
                        )
                                ?.toList()
                                .map<MedicationModelStruct?>(
                                    MedicationModelStruct.maybeFromMap)
                                .toList() as Iterable<MedicationModelStruct?>)
                            .withoutNulls
                            .toList() ??
                        [];
                    if (medication.isEmpty) {
                      return NotFoundComponentWidget(
                        isGoal: false,
                        subTitle: 'No medications has been added',
                        buttonTitle: 'Add medication',
                      );
                    }

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(medication.length, (medicationIndex) {
                        final medicationItem = medication[medicationIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'UPCOMING_MEDICATION_COMPONENT_Container_');
                            _model.apiResultwl9 =
                                await HocGroup.getMedicationByIdCall.call(
                              id: medicationItem.id,
                              userId: FFAppState().userId,
                              baseurl: FFAppState().baseUrl,
                            );

                            if ((_model.apiResultwl9?.succeeded ?? true)) {
                              context.pushNamed(
                                EditMedicationWidget.routeName,
                                queryParameters: {
                                  'medication': serializeParam(
                                    MedicationModelStruct.maybeFromMap(
                                        getJsonField(
                                      (_model.apiResultwl9?.jsonBody ?? ''),
                                      r'''$.medication''',
                                    )),
                                    ParamType.DataStruct,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Something went wrong...',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                          child: UpcomingMedicationCardWidget(
                            key: Key(
                                'Key7dd_${medicationIndex}_of_${medication.length}'),
                            medicationName: medicationItem.name,
                            note: medicationItem.instruction,
                            autoReminder: medicationItem.autoReminder,
                            frequency: (List<String> list, int index) {
                              return list[index];
                            }(
                                (getJsonField(
                                  containerUpcomingMedicationResponse.jsonBody,
                                  r'''$.data[:].time''',
                                  true,
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList(),
                                medicationIndex),
                          ),
                        );
                      }).divide(SizedBox(height: 8.0)),
                    );
                  },
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        );
      },
    );
  }
}
