import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/appoitment_cancel_popup_widget.dart';
import '/components/connections_component_widget.dart';
import '/components/consultation_card_component_widget.dart';
import '/components/reschedule_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upcoming_consultation_page_model.dart';
export 'upcoming_consultation_page_model.dart';

class UpcomingConsultationPageWidget extends StatefulWidget {
  const UpcomingConsultationPageWidget({super.key});

  static String routeName = 'UpcomingConsultationPage';
  static String routePath = '/upcomingConsultationPage';

  @override
  State<UpcomingConsultationPageWidget> createState() =>
      _UpcomingConsultationPageWidgetState();
}

class _UpcomingConsultationPageWidgetState
    extends State<UpcomingConsultationPageWidget>
    with TickerProviderStateMixin {
  late UpcomingConsultationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpcomingConsultationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('UPCOMING_CONSULTATION_UpcomingConsultati');
      await Future.wait([
        Future(() async {
          _model.firstPage = true;
          safeSetState(() {});
          FFAppState().navBarHeight = 0.0;
          safeSetState(() {});
          _model.upcomingApi =
              await ConnectionsGroup.getUpcomingConnectionsCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.upcomingApi?.succeeded ?? true)) {
            _model.connections = ((_model.upcomingApi?.jsonBody ?? '')
                    .toList()
                    .map<ConnectionsModelStruct?>(
                        ConnectionsModelStruct.maybeFromMap)
                    .toList() as Iterable<ConnectionsModelStruct?>)
                .withoutNulls
                .toList()
                .cast<ConnectionsModelStruct>();
            _model.isDataFetched = true;
            safeSetState(() {});
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.upcomingApi?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {
          _model.settings = await GetSettingsCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );
        }),
      ]);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_model.firstPage)
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.94,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 57.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'UPCOMING_CONSULTATION_Container_pw6aa7lf');

                                      context.goNamed(
                                        HomePageWidget.routeName,
                                        queryParameters: {
                                          'index': serializeParam(
                                            0,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Consultations',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                if (false)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 26.0,
                                        height: 26.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            FFAppState().theme.primaryColor,
                                            Color(0xFFF6861F),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(13.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            false.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontSize: 14.0,
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
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 0.0,
                            thickness: 0.25,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          if (!_model.isDataFetched)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Fetching Appoitments...',
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
                                  ),
                                ),
                              ),
                            ),
                          if (_model.isDataFetched)
                            Expanded(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      unselectedLabelStyle: FlutterFlowTheme.of(
                                              context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      indicatorColor: valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      tabs: [
                                        Tab(
                                          text: 'Upcoming',
                                        ),
                                        Tab(
                                          text: 'Missed',
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (_model.connections
                                                      .where((e) =>
                                                          (functions.timeToGo(
                                                                  functions
                                                                      .convertStringToDate(e
                                                                          .startTime),
                                                                  functions
                                                                      .convertStringToDate(e
                                                                          .endTime)) !=
                                                              'completed') &&
                                                          (e.status ==
                                                              'Scheduled'))
                                                      .toList()
                                                      .length !=
                                                  0)
                                                Builder(
                                                  builder: (context) {
                                                    final item = _model
                                                        .connections
                                                        .toList();
                                                    if (item.isEmpty) {
                                                      return NoDataComponentWidget(
                                                        name:
                                                            'Upcoming Consultation',
                                                      );
                                                    }

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            item.length,
                                                            (itemIndex) {
                                                          final itemItem =
                                                              item[itemIndex];
                                                          return Visibility(
                                                            visible: (functions.timeToGo(
                                                                        functions.convertStringToDate(itemItem
                                                                            .startTime),
                                                                        functions.convertStringToDate(itemItem
                                                                            .endTime)) !=
                                                                    'completed') &&
                                                                (itemItem
                                                                        .status ==
                                                                    'Scheduled'),
                                                            child: Builder(
                                                              builder: (context) =>
                                                                  ConsultationCardComponentWidget(
                                                                key: Key(
                                                                    'Key0zu_${itemIndex}_of_${item.length}'),
                                                                model: itemItem,
                                                                graceTime:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  getJsonField(
                                                                    (_model.settings
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.settings.consultations.graceTime''',
                                                                  )?.toString(),
                                                                  '5',
                                                                ),
                                                                waitTime:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  getJsonField(
                                                                    (_model.settings
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.settings.consultations.waitTime''',
                                                                  )?.toString(),
                                                                  '5',
                                                                ),
                                                                action:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'UPCOMING_CONSULTATION_Upcoming_CALLBACK');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              RescheduleBottomSheetWidget(
                                                                            rescheduleCallback:
                                                                                () async {
                                                                              Navigator.pop(context);
                                                                              _model.selectedConnection = itemItem;
                                                                              safeSetState(() {});
                                                                              _model.firstPage = false;
                                                                              _model.secondPage = true;
                                                                              safeSetState(() {});
                                                                            },
                                                                            deletedCalback:
                                                                                () async {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: AppoitmentCancelPopupWidget(
                                                                                        cancelCallback: () async {
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                        proceedCallback: (reason) async {
                                                                                          _model.apiResult43i = await ConnectionsGroup.cancelConsultationCall.call(
                                                                                            consultationId: itemItem.id,
                                                                                            userId: FFAppState().userId,
                                                                                            baseurl: FFAppState().baseUrl,
                                                                                            reason: reason,
                                                                                          );

                                                                                          if ((_model.apiResult43i?.succeeded ?? true)) {
                                                                                            _model.removeAtIndexFromConnections(itemIndex);
                                                                                            safeSetState(() {});
                                                                                          }
                                                                                          Navigator.pop(context);
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                startConsultation:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'UPCOMING_CONSULTATION_Upcoming_CALLBACK');
                                                                  _model.apiResultmka1 =
                                                                      await ConnectionsGroup
                                                                          .connectVideoCallCall
                                                                          .call(
                                                                    consultationId:
                                                                        itemItem
                                                                            .id,
                                                                    participantName:
                                                                        FFAppState()
                                                                            .userDetails
                                                                            .firstName,
                                                                    userId: FFAppState()
                                                                        .userId,
                                                                    baseurl:
                                                                        FFAppState()
                                                                            .baseUrl,
                                                                  );

                                                                  if ((_model
                                                                          .apiResultmka1
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    await requestPermission(
                                                                        cameraPermission);
                                                                    await requestPermission(
                                                                        microphonePermission);

                                                                    context
                                                                        .pushNamed(
                                                                      VideoCallWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'videoLink':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            (_model.apiResultmka1?.jsonBody ??
                                                                                ''),
                                                                            r'''$.data''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'connectionsModel':
                                                                            serializeParam(
                                                                          itemItem,
                                                                          ParamType
                                                                              .DataStruct,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              if (_model.connections
                                                      .where((e) =>
                                                          (functions.timeToGo(
                                                                  functions
                                                                      .convertStringToDate(e
                                                                          .startTime),
                                                                  functions
                                                                      .convertStringToDate(e
                                                                          .endTime)) !=
                                                              'completed') &&
                                                          (e.status ==
                                                              'Scheduled'))
                                                      .toList()
                                                      .length ==
                                                  0)
                                                Expanded(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .noDataComponentModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        NoDataComponentWidget(
                                                      name:
                                                          'Upcoming Consultation',
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final item2 =
                                                _model.connections.toList();
                                            if (item2.isEmpty) {
                                              return NoDataComponentWidget(
                                                name: 'Upcoming Consultation',
                                              );
                                            }

                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    item2.length, (item2Index) {
                                                  final item2Item =
                                                      item2[item2Index];
                                                  return Visibility(
                                                    visible: (functions.timeToGo(
                                                                functions.convertStringToDate(
                                                                    item2Item
                                                                        .startTime),
                                                                functions.convertStringToDate(
                                                                    item2Item
                                                                        .endTime)) ==
                                                            'completed') &&
                                                        (item2Item.status ==
                                                            'Scheduled'),
                                                    child: Builder(
                                                      builder: (context) =>
                                                          ConsultationCardComponentWidget(
                                                        key: Key(
                                                            'Keyq31_${item2Index}_of_${item2.length}'),
                                                        model: item2Item,
                                                        graceTime:
                                                            valueOrDefault<
                                                                String>(
                                                          getJsonField(
                                                            (_model.settings
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.settings.consultations.graceTime''',
                                                          )?.toString(),
                                                          '5',
                                                        ),
                                                        waitTime:
                                                            valueOrDefault<
                                                                String>(
                                                          getJsonField(
                                                            (_model.settings
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.settings.consultations.waitTime''',
                                                          )?.toString(),
                                                          '5',
                                                        ),
                                                        action: () async {
                                                          logFirebaseEvent(
                                                              'UPCOMING_CONSULTATION_Missed_CALLBACK');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      RescheduleBottomSheetWidget(
                                                                    rescheduleCallback:
                                                                        () async {
                                                                      Navigator.pop(
                                                                          context);
                                                                      _model.selectedConnection =
                                                                          item2Item;
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.firstPage =
                                                                          false;
                                                                      _model.secondPage =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    deletedCalback:
                                                                        () async {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: AppoitmentCancelPopupWidget(
                                                                                cancelCallback: () async {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                proceedCallback: (reason) async {
                                                                                  _model.apiResult422 = await ConnectionsGroup.cancelConsultationCall.call(
                                                                                    consultationId: item2Item.id,
                                                                                    userId: FFAppState().userId,
                                                                                    baseurl: FFAppState().baseUrl,
                                                                                    reason: reason,
                                                                                  );

                                                                                  if ((_model.apiResult422?.succeeded ?? true)) {
                                                                                    _model.removeAtIndexFromConnections(item2Index);
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                  Navigator.pop(context);
                                                                                },
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          safeSetState(() {});
                                                        },
                                                        startConsultation:
                                                            () async {
                                                          logFirebaseEvent(
                                                              'UPCOMING_CONSULTATION_Missed_CALLBACK');
                                                          _model.videocallapi =
                                                              await ConnectionsGroup
                                                                  .connectVideoCallCall
                                                                  .call(
                                                            consultationId:
                                                                item2Item.id,
                                                            participantName:
                                                                FFAppState()
                                                                    .userDetails
                                                                    .firstName,
                                                            userId: FFAppState()
                                                                .userId,
                                                            baseurl:
                                                                FFAppState()
                                                                    .baseUrl,
                                                          );

                                                          if ((_model
                                                                  .videocallapi
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await requestPermission(
                                                                cameraPermission);
                                                            await requestPermission(
                                                                microphonePermission);
                                                            if (isAndroid &&
                                                                isiOS) {
                                                              await requestPermission(
                                                                  bluetoothPermission);
                                                            }

                                                            context.pushNamed(
                                                              VideoCallWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'videoLink':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    (_model.videocallapi
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.data''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'connectionsModel':
                                                                    serializeParam(
                                                                  item2Item,
                                                                  ParamType
                                                                      .DataStruct,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                if (_model.secondPage)
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
                          isFromReschedule: true,
                          rescheduledoctor: DoctorModelStruct(
                            firstName: getJsonField(
                              _model.selectedConnection?.doctorDetails.toMap(),
                              r'''$.firstName''',
                            ).toString(),
                            qualification: getJsonField(
                              _model.selectedConnection?.doctorDetails.toMap(),
                              r'''$.qualification''',
                            ).toString(),
                            userId: getJsonField(
                              _model.selectedConnection?.doctorDetails.toMap(),
                              r'''$.id''',
                            ).toString(),
                            profileImageUri: getJsonField(
                              _model.selectedConnection?.doctorDetails.toMap(),
                              r'''$.profileImageUri''',
                            ).toString(),
                          ),
                          rescheduleConsulationId:
                              _model.selectedConnection?.id,
                          isFromFollowUpOrTask: false,
                          isFromTask: false,
                          callbackNavbar: (isHide) async {},
                          backCallback: () async {
                            logFirebaseEvent(
                                'UPCOMING_CONSULTATION_Container_zniqjdpi');
                            _model.firstPage = true;
                            _model.secondPage = false;
                            _model.isDataFetched = false;
                            safeSetState(() {});
                            _model.apiResultw1s = await ConnectionsGroup
                                .getUpcomingConnectionsCall
                                .call(
                              userId: FFAppState().userId,
                              baseurl: FFAppState().baseUrl,
                            );

                            if ((_model.apiResultw1s?.succeeded ?? true)) {
                              _model.connections =
                                  ((_model.apiResultw1s?.jsonBody ?? '')
                                              .toList()
                                              .map<ConnectionsModelStruct?>(
                                                  ConnectionsModelStruct
                                                      .maybeFromMap)
                                              .toList()
                                          as Iterable<ConnectionsModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<ConnectionsModelStruct>();
                              _model.isDataFetched = true;
                              safeSetState(() {});
                            }

                            safeSetState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
