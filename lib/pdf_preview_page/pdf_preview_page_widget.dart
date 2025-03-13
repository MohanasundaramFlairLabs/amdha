import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pdf_preview_page_model.dart';
export 'pdf_preview_page_model.dart';

class PdfPreviewPageWidget extends StatefulWidget {
  const PdfPreviewPageWidget({
    super.key,
    this.pdfuri,
    this.title,
    bool? isFromTask,
    this.task,
  }) : this.isFromTask = isFromTask ?? false;

  final String? pdfuri;
  final String? title;
  final bool isFromTask;
  final TasksStruct? task;

  static String routeName = 'PdfPreviewPage';
  static String routePath = '/pdfPreviewPage';

  @override
  State<PdfPreviewPageWidget> createState() => _PdfPreviewPageWidgetState();
}

class _PdfPreviewPageWidgetState extends State<PdfPreviewPageWidget> {
  late PdfPreviewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfPreviewPageModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 56.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PDF_PREVIEW_Container_0d706q2q_ON_TAP');
                            if (widget.isFromTask) {
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
                                }.withoutNulls,
                              );
                            } else {
                              context.safePop();
                            }
                          },
                          child: Container(
                            width: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.75,
                          decoration: BoxDecoration(),
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              widget.title,
                              '-',
                            ),
                            minFontSize: 10.0,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ].divide(SizedBox(width: 0.0)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: custom_widgets.PdfViewer(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              pdfpath: widget.pdfuri!,
                              isNetwork: true,
                            ),
                          ),
                          if (widget.isFromTask)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Mark as read',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue ??= false,
                                      onChanged: _model.isTaskCompleted
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .checkboxValue = newValue!);
                                              if (newValue!) {
                                                logFirebaseEvent(
                                                    'PDF_PREVIEW_Checkbox_l16apfxm_ON_TOGGLE_');
                                                if (widget.isFromTask) {
                                                  _model.submitTask =
                                                      await TaskGroup
                                                          .submittaskCall
                                                          .call(
                                                    userId: FFAppState().userId,
                                                    baseurl:
                                                        FFAppState().baseUrl,
                                                    jsonJson: functions
                                                        .createtaskResponse(
                                                            widget
                                                                .task?.taskType,
                                                            widget.task?.config
                                                                .educationId,
                                                            widget.task!.id),
                                                  );

                                                  if ((_model.submitTask
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.isTaskCompleted =
                                                        true;
                                                    safeSetState(() {});
                                                  }
                                                }

                                                safeSetState(() {});
                                              }
                                            },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      checkColor: _model.isTaskCompleted
                                          ? null
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
