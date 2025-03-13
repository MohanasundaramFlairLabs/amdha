import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/add_medication_component/add_medication_component_widget.dart';
import '/pages/components/micro_components/medication_components/medication_card/medication_card_widget.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/pages/components/shimmer_components/medication_shimmer/medication_shimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medication_component_model.dart';
export 'medication_component_model.dart';

class MedicationComponentWidget extends StatefulWidget {
  const MedicationComponentWidget({
    super.key,
    this.listOfMedication,
    this.callback,
  });

  final List<MedicationModelStruct>? listOfMedication;
  final Future Function(bool isHideNavBar)? callback;

  @override
  State<MedicationComponentWidget> createState() =>
      _MedicationComponentWidgetState();
}

class _MedicationComponentWidgetState extends State<MedicationComponentWidget> {
  late MedicationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicationComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MEDICATION_COMPONENT_MedicationComponent');
      _model.isMedication = true;
      _model.selectedItem = null;
      _model.updatePage(() {});
      _model.medicationResponse = await HocGroup.medicationCall.call(
        userId: FFAppState().userId,
        baseurl: FFAppState().baseUrl,
      );

      if ((_model.medicationResponse?.succeeded ?? true)) {
        _model.medicationList = MedicationsStruct.maybeFromMap(
            (_model.medicationResponse?.jsonBody ?? ''));
        safeSetState(() {});
        _model.isDataLoaded = true;
        safeSetState(() {});
        if (_model.medicationList!.medication.length > 0) {
          _model.remaindersList = await actions.getRemainderDates(
            _model.medicationList!.medication.toList(),
          );
          await actions.registerForLocalNotification(
            _model.remaindersList!.toList(),
          );
        }
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Stack(
      alignment: AlignmentDirectional(1.0, 1.0),
      children: [
        if (_model.isMedication == true)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('MEDICATION_COMPONENT_Container_buipk3hu_');
              _model.focusChnage = !_model.focusChnage;
              safeSetState(() {});
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height -
                  FFAppState().statusBarHeight -
                  (0.08 * MediaQuery.sizeOf(context).height),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
              ),
              child: Stack(
                alignment: AlignmentDirectional(1.0, 1.0),
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 56.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Medications',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Divider(
                        height: 0.0,
                        thickness: 0.25,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          decoration: BoxDecoration(),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (false)
                                  Container(
                                    height: 40.0,
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
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
                                        hintText: 'Search',
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
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
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
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                if (_model.isDataLoaded)
                                  Builder(
                                    builder: (context) {
                                      final medication = _model
                                              .medicationList?.medication
                                              .toList() ??
                                          [];
                                      if (medication.isEmpty) {
                                        return Center(
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.7,
                                            child: NoDataComponentWidget(
                                              name: 'Medications',
                                            ),
                                          ),
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          70.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: medication.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 10.0),
                                        itemBuilder:
                                            (context, medicationIndex) {
                                          final medicationItem =
                                              medication[medicationIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'MEDICATION_COMPONENT_Container_7ngy3n16_');
                                              _model.isMedication = false;
                                              _model.selectedItem =
                                                  medicationItem;
                                              _model.edit = true;
                                              _model.updatePage(() {});
                                            },
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 85.0,
                                              decoration: BoxDecoration(),
                                              child: MedicationCardWidget(
                                                key: Key(
                                                    'Keyse5_${medicationIndex}_of_${medication.length}'),
                                                medicineName:
                                                    medicationItem.name,
                                                isActive:
                                                    medicationItem.autoReminder,
                                                endDate: dateTimeFormat(
                                                  "d-M-y",
                                                  functions.convertStringToDate(
                                                      medicationItem.endDate),
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                dosage: medicationItem.dosage,
                                                isSos: medicationItem.time
                                                    .contains("SOS"),
                                                id: medicationItem.id,
                                                unit: medicationItem.units,
                                                focusChanged: false,
                                                isDeleteSelected:
                                                    medicationIndex ==
                                                        _model
                                                            .deleteSelctedIndex,
                                                deletedAction: () async {
                                                  logFirebaseEvent(
                                                      'MEDICATION_COMPONENT_Container_se5x56b5_');
                                                  _model.isDataLoaded = false;
                                                  _model.deleteSelctedIndex =
                                                      null;
                                                  safeSetState(() {});
                                                  _model.medicationResponseDelete =
                                                      await HocGroup
                                                          .medicationCall
                                                          .call(
                                                    userId: FFAppState().userId,
                                                    baseurl:
                                                        FFAppState().baseUrl,
                                                  );

                                                  if ((_model
                                                          .medicationResponseDelete
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.medicationList =
                                                        MedicationsStruct
                                                            .maybeFromMap((_model
                                                                    .medicationResponseDelete
                                                                    ?.jsonBody ??
                                                                ''));
                                                    safeSetState(() {});
                                                    _model.isDataLoaded = true;
                                                    safeSetState(() {});
                                                  }

                                                  safeSetState(() {});
                                                },
                                                deleteSelectedIndex: () async {
                                                  logFirebaseEvent(
                                                      'MEDICATION_COMPONENT_Container_se5x56b5_');
                                                  _model.deleteSelctedIndex =
                                                      medicationIndex;
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                if (!_model.isDataLoaded)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.95,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.8,
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.medicationShimmerModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: MedicationShimmerWidget(),
                                    ),
                                  ),
                              ].addToStart(SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 20.0),
                    child: FlutterFlowIconButton(
                      borderColor: valueOrDefault<Color>(
                        FFAppState().theme.primaryColor,
                        FlutterFlowTheme.of(context).primary,
                      ),
                      borderRadius: 288.0,
                      borderWidth: 1.0,
                      buttonSize: 56.0,
                      fillColor: valueOrDefault<Color>(
                        FFAppState().theme.primaryColor,
                        FlutterFlowTheme.of(context).primary,
                      ),
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 32.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'MEDICATION_COMPONENT_COMP_add_ICN_ON_TAP');
                        await widget.callback?.call(
                          true,
                        );
                        _model.isMedication = false;
                        _model.selectedItem = null;
                        _model.edit = false;
                        _model.updatePage(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (_model.isMedication == false)
          wrapWithModel(
            model: _model.addMedicationComponentModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: AddMedicationComponentWidget(
              medication: _model.selectedItem,
              isEdit: _model.edit,
              callbackAddMedication: () async {
                logFirebaseEvent('MEDICATION_COMPONENT_Container_u3eu57ce_');
                _model.isMedication = !_model.isMedication;
                _model.updatePage(() {});
                await widget.callback?.call(
                  false,
                );
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
                    'isFromNotification': serializeParam(
                      false,
                      ParamType.bool,
                    ),
                    'doScan': serializeParam(
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
            ),
          ),
      ],
    );
  }
}
