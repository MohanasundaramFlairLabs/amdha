import '';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/micro_components/delete_dialog_box/delete_dialog_box_widget.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/pages/components/shimmer_components/medication_shimmer/medication_shimmer_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_file_component_model.dart';
export 'list_file_component_model.dart';

class ListFileComponentWidget extends StatefulWidget {
  const ListFileComponentWidget({
    super.key,
    required this.navigateBack,
    required this.addCallback,
  });

  final Future Function()? navigateBack;
  final Future Function()? addCallback;

  @override
  State<ListFileComponentWidget> createState() =>
      _ListFileComponentWidgetState();
}

class _ListFileComponentWidgetState extends State<ListFileComponentWidget> {
  late ListFileComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListFileComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LIST_FILE_COMPONENT_ListFileComponent_ON');
      FFAppState().clearFetchListFileQueryCache();
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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('LIST_FILE_COMPONENT_Container_pidzmfhl_O');
        _model.selectedIndex = null;
        safeSetState(() {});
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                                  'LIST_FILE_COMPONENT_Container_oqdsz44c_O');
                              await widget.navigateBack?.call();
                            },
                            child: Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.chevron_left,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Health Files',
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
                      ],
                    ),
                  ),
                  Divider(
                    height: 0.0,
                    thickness: 0.25,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.95,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState().fetchListFileQuery(
                            requestFn: () => ListOfFilesCall.call(
                              userId: FFAppState().userId,
                              baseurl: FFAppState().baseUrl,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return MedicationShimmerWidget();
                            }
                            final columnListOfFilesResponse = snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final file = functions
                                    .groupReportsByType(getJsonField(
                                      columnListOfFilesResponse.jsonBody,
                                      r'''$.data''',
                                    ))
                                    .toList();
                                if (file.isEmpty) {
                                  return Center(
                                    child: NoDataComponentWidget(
                                      name: 'Files',
                                    ),
                                  );
                                }

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(file.length, (fileIndex) {
                                      final fileItem = file[fileIndex];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getJsonField(
                                                fileItem,
                                                r'''$.category''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                            Builder(
                                              builder: (context) {
                                                final iii = getJsonField(
                                                  fileItem,
                                                  r'''$.list''',
                                                ).toList();

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      iii.length, (iiiIndex) {
                                                    final iiiItem =
                                                        iii[iiiIndex];
                                                    return Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      children: [
                                                        InkWell(
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
                                                                'LIST_FILE_COMPONENT_Container_swd5rie3_O');
                                                            _model.selectedIndex =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 60.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF5F5F5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'LIST_FILE_COMPONENT_Row_7oyprbh8_ON_TAP');

                                                                context
                                                                    .pushNamed(
                                                                  OCRResultPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'fileUrl':
                                                                        serializeParam(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        ListofFilesModelStruct.maybeFromMap(iiiItem)
                                                                            ?.path,
                                                                        '-',
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'reportId':
                                                                        serializeParam(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        ListofFilesModelStruct.maybeFromMap(iiiItem)
                                                                            ?.id,
                                                                        '\"\"',
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'documentType':
                                                                        serializeParam(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        ListofFilesModelStruct.maybeFromMap(iiiItem)
                                                                            ?.documentType,
                                                                        'Dual Marker Test',
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          35.0,
                                                                      height:
                                                                          35.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFE0E0E0),
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .insert_drive_file,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              ListofFilesModelStruct.maybeFromMap(iiiItem)?.name,
                                                                              '-',
                                                                            ).maybeHandleOverflow(
                                                                              maxChars: 25,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            'Uploaded ${dateTimeFormat(
                                                                              "d-M-y",
                                                                              functions.convertStringToDate(ListofFilesModelStruct.maybeFromMap(iiiItem)!.uploadDate),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            )}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 5.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'LIST_FILE_COMPONENT_Icon_a3o1hwco_ON_TAP');
                                                                      _model.selectedIndex =
                                                                          iiiIndex;
                                                                      _model.selectedParentIndex =
                                                                          fileIndex;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .ksolarMenuDotsBold,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ].addToEnd(
                                                                    SizedBox(
                                                                        width:
                                                                            10.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if ((_model.selectedIndex ==
                                                                iiiIndex) &&
                                                            (_model.selectedParentIndex ==
                                                                fileIndex))
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Container(
                                                                  width: 80.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'LIST_FILE_COMPONENT_COMP_VIEW_BTN_ON_TAP');
                                                                      _model.selectedIndex =
                                                                          null;
                                                                      safeSetState(
                                                                          () {});
                                                                      await launchURL(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        ListofFilesModelStruct.maybeFromMap(iiiItem)
                                                                            ?.path,
                                                                        '-',
                                                                      ));
                                                                    },
                                                                    text:
                                                                        'View',
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .fileAlt,
                                                                      size:
                                                                          12.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          80.0,
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(4.0),
                                                                        topRight:
                                                                            Radius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    showLoadingIndicator:
                                                                        false,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 80.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'LIST_FILE_COMPONENT_DELETE_BTN_ON_TAP');
                                                                        await showDialog(
                                                                          barrierDismissible:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: Container(
                                                                                height: 200.0,
                                                                                width: 320.0,
                                                                                child: DeleteDialogBoxWidget(
                                                                                  fileId: valueOrDefault<String>(
                                                                                    ListofFilesModelStruct.maybeFromMap(iiiItem)?.id,
                                                                                    '-',
                                                                                  ),
                                                                                  type: ' ',
                                                                                  message: 'Are you sure you want to delete this File?',
                                                                                  deleteAction: (id, type) async {
                                                                                    _model.apiResultne7 = await HocGroup.deleteHealthFileCall.call(
                                                                                      id: id,
                                                                                      path: ListofFilesModelStruct.maybeFromMap(iiiItem)?.path,
                                                                                      userId: FFAppState().userId,
                                                                                      baseurl: FFAppState().baseUrl,
                                                                                    );

                                                                                    if ((_model.apiResultne7?.succeeded ?? true)) {
                                                                                      _model.updatePage(() {});
                                                                                      Navigator.pop(context);
                                                                                      FFAppState().clearFetchListFileQueryCache();
                                                                                      FFAppState().refresh = !(FFAppState().refresh ?? true);
                                                                                      FFAppState().update(() {});
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Something went wrong...',
                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 3000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        _model.selectedIndex =
                                                                            null;
                                                                        safeSetState(
                                                                            () {});

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Delete',
                                                                      icon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kdelete,
                                                                        size:
                                                                            15.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(4.0),
                                                                          bottomRight:
                                                                              Radius.circular(4.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    );
                                                  }).divide(
                                                      SizedBox(height: 10.0)),
                                                );
                                              },
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      );
                                    })
                                            .divide(SizedBox(height: 10.0))
                                            .addToStart(SizedBox(height: 20.0))
                                            .addToEnd(SizedBox(height: 70.0)),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 20.0),
                child: FlutterFlowIconButton(
                  borderColor: valueOrDefault<Color>(
                    FFAppState().theme.primaryColor,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  borderRadius: 28.0,
                  borderWidth: 1.0,
                  buttonSize: 56.0,
                  fillColor: valueOrDefault<Color>(
                    FFAppState().theme.primaryColor,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  icon: Icon(
                    Icons.add_rounded,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 32.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'LIST_FILE_COMPONENT_add_rounded_ICN_ON_T');
                    await widget.addCallback?.call();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
