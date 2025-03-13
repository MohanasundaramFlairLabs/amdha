import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/ocr_card_widget.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'o_c_r_result_page_model.dart';
export 'o_c_r_result_page_model.dart';

class OCRResultPageWidget extends StatefulWidget {
  const OCRResultPageWidget({
    super.key,
    required this.fileUrl,
    required this.reportId,
    this.documentType,
  });

  final String? fileUrl;
  final String? reportId;
  final String? documentType;

  static String routeName = 'OCRResultPage';
  static String routePath = '/oCRResultPage';

  @override
  State<OCRResultPageWidget> createState() => _OCRResultPageWidgetState();
}

class _OCRResultPageWidgetState extends State<OCRResultPageWidget> {
  late OCRResultPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OCRResultPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('O_C_R_RESULT_OCRResultPage_ON_INIT_STATE');
      _model.apiResultzu0 = await HocGroup.oCRResultCall.call(
        baseurl: FFAppState().baseUrl,
        reportId: widget.reportId,
        userId: FFAppState().userId,
      );

      if ((_model.apiResultzu0?.succeeded ?? true)) {
        _model.resultQueries = OcrResultStruct.maybeFromMap(getJsonField(
          (_model.apiResultzu0?.jsonBody ?? ''),
          r'''$.data''',
        ));
        safeSetState(() {});
      } else {
        _model.resultQueries = OcrResultStruct.maybeFromMap(getJsonField(
          (_model.apiResultzu0?.jsonBody ?? ''),
          r'''$.data''',
        ));
        safeSetState(() {});
      }
    });

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'O_C_R_RESULT_Icon_c6cz1egw_ON_TAP');
                                                  context.safePop();
                                                },
                                                child: Icon(
                                                  Icons.chevron_left,
                                                  color: Color(0xFF242E49),
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.documentType,
                                              'Dual Marker Test',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: Color(0xFF242E49),
                                                  fontSize: 20.0,
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
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height:
                                        _model.resultQueries?.enabled == false
                                            ? 690.0
                                            : 350.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: FlutterFlowPdfViewer(
                                        networkPath: widget.fileUrl!,
                                        width: 500.0,
                                        horizontalScroll: false,
                                      ),
                                    ),
                                  ),
                                  if (false)
                                    Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/2vqf7_',
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Builder(
                                builder: (context) {
                                  if ((_model.resultQueries?.ocrStatus ==
                                          'COMPLETED') &&
                                      (_model.resultQueries?.enabled == true)) {
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Builder(
                                          builder: (context) {
                                            final list = _model.resultQueries
                                                    ?.ocrScanResult
                                                    .toList() ??
                                                [];

                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: List.generate(
                                                    list.length, (listIndex) {
                                                  final listItem =
                                                      list[listIndex];
                                                  return OcrCardWidget(
                                                    key: Key(
                                                        'Keylui_${listIndex}_of_${list.length}'),
                                                    parameter1: listItem.label,
                                                    parameter2:
                                                        listItem.value.result,
                                                    parameter3:
                                                        listItem.value.unit,
                                                    callBack: (value) async {
                                                      logFirebaseEvent(
                                                          'O_C_R_RESULT_Container_luikqi55_CALLBACK');
                                                      _model
                                                          .updateResultQueriesStruct(
                                                        (e) => e
                                                          ..updateOcrScanResult(
                                                            (e) => e[listIndex]
                                                              ..updateValue(
                                                                (e) => e
                                                                  ..result =
                                                                      value,
                                                              ),
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                  );
                                                }).divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              if ((_model.resultQueries
                                                          ?.enabled ==
                                                      true) &&
                                                  (_model.resultQueries
                                                          ?.ocrStatus ==
                                                      'PROCESSING')) {
                                                return Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.45,
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Opacity(
                                                        opacity: 0.3,
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x66000000),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width: 287.0,
                                                          height: 207.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Lottie.asset(
                                                                  'assets/jsons/File_loading_animation_1.json',
                                                                  width: 249.0,
                                                                  height: 63.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  animate: true,
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'We’re in the process of fetching data',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              Color(0xFF242E49),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      16.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_model.resultQueries?.enabled == true)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: FFButtonWidget(
                                  onPressed: (_model.resultQueries?.ocrStatus !=
                                          'COMPLETED')
                                      ? null
                                      : () async {
                                          logFirebaseEvent(
                                              'O_C_R_RESULT_PAGE_PAGE_SAVE_BTN_ON_TAP');
                                          _model.apiResult7ha = await HocGroup
                                              .submitOCRResultCall
                                              .call(
                                            userId: FFAppState().userId,
                                            baseurl: FFAppState().baseUrl,
                                            ocrScanResultJson:
                                                functions.convertOCRDataToJson(
                                                    _model.resultQueries
                                                        ?.ocrJobId,
                                                    _model.resultQueries
                                                        ?.ocrScanResult
                                                        .toList()),
                                            ocrJobId:
                                                _model.resultQueries?.ocrJobId,
                                          );

                                          if ((_model.apiResult7ha?.succeeded ??
                                              true)) {
                                            context.safePop();
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Unable to Submit'),
                                                  content: Text((_model
                                                              .apiResult7ha
                                                              ?.jsonBody ??
                                                          '')
                                                      .toString()),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                  text: 'Save',
                                  options: FFButtonOptions(
                                    height: 42.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: valueOrDefault<Color>(
                                      _model.resultQueries?.ocrStatus ==
                                              'COMPLETED'
                                          ? Color(0xFF008080)
                                          : Color(0xFFEEEEEE),
                                      Color(0xFF008080),
                                    ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: valueOrDefault<Color>(
                                            _model.resultQueries?.ocrStatus ==
                                                    'COMPLETED'
                                                ? FlutterFlowTheme.of(context)
                                                    .info
                                                : Color(0xFF949494),
                                            FlutterFlowTheme.of(context).info,
                                          ),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
