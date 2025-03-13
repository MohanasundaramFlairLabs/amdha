import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'file_upload_component_model.dart';
export 'file_upload_component_model.dart';

class FileUploadComponentWidget extends StatefulWidget {
  const FileUploadComponentWidget({
    super.key,
    this.onBackPress,
    bool? isFromTask,
    this.taskId,
    this.category,
    this.documentType,
    bool? allowDocumentDropDown,
  })  : this.isFromTask = isFromTask ?? false,
        this.allowDocumentDropDown = allowDocumentDropDown ?? false;

  final Future Function()? onBackPress;
  final bool isFromTask;
  final String? taskId;
  final String? category;
  final String? documentType;
  final bool allowDocumentDropDown;

  @override
  State<FileUploadComponentWidget> createState() =>
      _FileUploadComponentWidgetState();
}

class _FileUploadComponentWidgetState extends State<FileUploadComponentWidget> {
  late FileUploadComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FileUploadComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FILE_UPLOAD_COMPONENT_FileUploadComponen');
      _model.file = null;
      _model.isFileSelected = false;
      _model.selectedCategory = widget.category;
      safeSetState(() {});
      safeSetState(() {
        _model.categoryDropDownValueController?.reset();
        _model.documentDropDownValueController?.reset();
      });
      safeSetState(() {
        _model.notesTextController?.clear();
      });
      _model.dou = getCurrentTimestamp;
      safeSetState(() {});
      _model.reportsResponse = await HocGroup.getReportTypeCall.call(
        userId: FFAppState().userId,
        baseurl: FFAppState().baseUrl,
      );

      if ((_model.reportsResponse?.succeeded ?? true)) {
        _model.allCategoryList = ((_model.reportsResponse?.jsonBody ?? '')
                .toList()
                .map<ReportCategoryStruct?>(ReportCategoryStruct.maybeFromMap)
                .toList() as Iterable<ReportCategoryStruct?>)
            .withoutNulls
            .toList()
            .cast<ReportCategoryStruct>();
        safeSetState(() {});
        if (widget.isFromTask) {
          _model.selectedCategory = widget.category;
          safeSetState(() {});
          _model.documentType = _model.allCategoryList
              .where((e) => e.reportType == widget.category)
              .toList()
              .firstOrNull!
              .documentType
              .toList()
              .cast<String>();
          safeSetState(() {});
          _model.selectedDocument = widget.documentType;
          safeSetState(() {});
          safeSetState(() {
            _model.categoryDropDownValueController?.value = widget.category!;
          });
          safeSetState(() {
            _model.documentDropDownValueController?.value =
                widget.documentType!;
          });
        } else {
          _model.selectedCategory =
              _model.allCategoryList.firstOrNull?.reportType;
          safeSetState(() {});
          _model.documentType = _model.allCategoryList.firstOrNull!.documentType
              .toList()
              .cast<String>();
          safeSetState(() {});
          _model.selectedDocument = _model.documentDropDownValue;
          safeSetState(() {});
        }
      }
    });

    _model.notesTextController ??= TextEditingController();
    _model.notesFocusNode ??= FocusNode();

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
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 56.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'FILE_UPLOAD_COMPONENT_Container_i19uprnn');
                    await widget.onBackPress?.call();
                  },
                  child: Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Add File',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0.0,
            thickness: 0.5,
            color: Color(0x805D6A85),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Category',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
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
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            color: Color(0xFFF56363),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        )
                                      ],
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
                                  ),
                                  FlutterFlowDropDown<String>(
                                    controller: _model
                                            .categoryDropDownValueController ??=
                                        FormFieldController<String>(
                                      _model
                                          .categoryDropDownValue ??= widget
                                              .isFromTask
                                          ? widget.category
                                          : ((_model.reportsResponse
                                                              ?.jsonBody ??
                                                          '')
                                                      .toList()
                                                      .map<ReportCategoryStruct?>(
                                                          ReportCategoryStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      ReportCategoryStruct?>)
                                              .withoutNulls
                                              .firstOrNull
                                              ?.reportType,
                                    ),
                                    options: widget.isFromTask
                                        ? ((String reportType) {
                                            return [reportType];
                                          }(widget.category!))
                                        : ((_model.reportsResponse?.jsonBody ??
                                                        '')
                                                    .toList()
                                                    .map<ReportCategoryStruct?>(
                                                        ReportCategoryStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<
                                                    ReportCategoryStruct?>)
                                            .withoutNulls
                                            .map((e) => e.reportType)
                                            .toList(),
                                    onChanged: (val) async {
                                      safeSetState(() =>
                                          _model.categoryDropDownValue = val);
                                      logFirebaseEvent(
                                          'FILE_UPLOAD_COMPONENT_CategoryDropDown_O');
                                      safeSetState(() {
                                        _model.documentDropDownValueController
                                            ?.reset();
                                      });
                                      _model.selectedCategory =
                                          _model.categoryDropDownValue;
                                      _model.documentType = ((_model
                                                          .reportsResponse
                                                          ?.jsonBody ??
                                                      '')
                                                  .toList()
                                                  .map<ReportCategoryStruct?>(
                                                      ReportCategoryStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  ReportCategoryStruct?>)
                                          .withoutNulls
                                          .where((e) =>
                                              e.reportType ==
                                              _model.selectedCategory)
                                          .toList()
                                          .firstOrNull!
                                          .documentType
                                          .toList()
                                          .cast<String>();
                                      _model.selectedDocument = null;
                                      safeSetState(() {});
                                    },
                                    height: 40.0,
                                    maxHeight:
                                        MediaQuery.sizeOf(context).height * 0.5,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Color(0x7F5D6A85),
                                    borderWidth: 1.0,
                                    borderRadius: 4.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 4.0, 10.0, 4.0),
                                    hidesUnderline: true,
                                    disabled: widget.category != null &&
                                        widget.category != '',
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                            ].divide(SizedBox(height: 20.0)),
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Document',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
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
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            color: Color(0xFFF56363),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        )
                                      ],
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
                                  ),
                                  FlutterFlowDropDown<String>(
                                    controller: _model
                                            .documentDropDownValueController ??=
                                        FormFieldController<String>(
                                      _model.documentDropDownValue ??=
                                          (widget.isFromTask
                                                  ? ((String document) {
                                                      return [document];
                                                    }(widget.documentType!))
                                                  : ([]))
                                              .firstOrNull,
                                    ),
                                    options: _model.documentType,
                                    onChanged: (val) async {
                                      safeSetState(() =>
                                          _model.documentDropDownValue = val);
                                      logFirebaseEvent(
                                          'FILE_UPLOAD_COMPONENT_DocumentDropDown_O');
                                      _model.selectedDocument = null;
                                      safeSetState(() {});
                                      _model.selectedDocument =
                                          _model.documentDropDownValue;
                                      safeSetState(() {});
                                    },
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Color(0x7F5D6A85),
                                    borderWidth: 1.0,
                                    borderRadius: 4.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 4.0, 10.0, 4.0),
                                    hidesUnderline: true,
                                    disabled: widget.isFromTask &&
                                        !widget.allowDocumentDropDown,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Report Date',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
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
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'FILE_UPLOAD_COMPONENT_Container_5jox0j21');
                                  final _datePickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: getCurrentTimestamp,
                                    builder: (context, child) {
                                      return wrapInMaterialDatePickerTheme(
                                        context,
                                        child!,
                                        headerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        headerForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        headerTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .headlineLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily,
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLargeFamily),
                                            ),
                                        pickerBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        pickerForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        selectedDateTimeBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        selectedDateTimeForegroundColor:
                                            FlutterFlowTheme.of(context).info,
                                        actionButtonForegroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        iconSize: 24.0,
                                      );
                                    },
                                  );

                                  if (_datePickedDate != null) {
                                    safeSetState(() {
                                      _model.datePicked = DateTime(
                                        _datePickedDate.year,
                                        _datePickedDate.month,
                                        _datePickedDate.day,
                                      );
                                    });
                                  } else if (_model.datePicked != null) {
                                    safeSetState(() {
                                      _model.datePicked = getCurrentTimestamp;
                                    });
                                  }
                                  if (_model.datePicked != null) {
                                    _model.dou = _model.datePicked;
                                    safeSetState(() {});
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                      color: Color(0x80242E49),
                                      width: 1.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          dateTimeFormat(
                                            "d-M-y",
                                            _model.dou,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.calendar_today,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                    ]
                                        .addToStart(SizedBox(width: 10.0))
                                        .addToEnd(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'File Description',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
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
                              Container(
                                height: 150.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(
                                    color: Color(0x805D6A85),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.notesTextController,
                                    focusNode: _model.notesFocusNode,
                                    autofocus: false,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      hintText: 'Add your description here...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
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
                                    maxLines: 20,
                                    validator: _model
                                        .notesTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ),
                        if (!_model.isFileSelected!)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Upload',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Click on upload file/document',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      child:
                                          custom_widgets.UploadDocumentWidget(
                                        width: 70.0,
                                        height: 70.0,
                                        isPermissionGranted: false,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        isFromProfileUpdate: false,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondary,
                                        setPermissionGranted: () async {},
                                        successCallback:
                                            (selectedFiles, fileName) async {
                                          logFirebaseEvent(
                                              'FILE_UPLOAD_COMPONENT_Container_2d7v2qdv');
                                          _model.file = selectedFiles;
                                          _model.isFileSelected = true;
                                          _model.fileName = fileName;
                                          _model.updatePage(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        if (_model.isFileSelected ?? true)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 58.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 32.0,
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE0E0E0),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.insert_drive_file,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                _model.fileName,
                                                'name',
                                              ).maybeHandleOverflow(
                                                maxChars: 20,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              'Uploaded now',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 10.0,
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
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 0.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'FILE_UPLOAD_COMPONENT_close_ICN_ON_TAP');
                                              _model.isFileSelected = false;
                                              _model.updatePage(() {});
                                              _model.file = null;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 15.0))
                          .addToStart(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: FFButtonWidget(
                onPressed: !((_model.file != null &&
                            (_model.file?.bytes?.isNotEmpty ?? false)) &&
                        (_model.categoryDropDownValue != null &&
                            _model.categoryDropDownValue != '') &&
                        (_model.selectedDocument != null &&
                            _model.selectedDocument != ''))
                    ? null
                    : () async {
                        logFirebaseEvent(
                            'FILE_UPLOAD_COMPONENT_UPLOAD_A_FILE_DOCU');
                        _model.validated = true;
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          safeSetState(() => _model.validated = false);
                          return;
                        }
                        if (_model.categoryDropDownValue == null) {
                          _model.validated = false;
                          safeSetState(() {});
                          return;
                        }
                        if (_model.documentDropDownValue == null) {
                          _model.validated = false;
                          safeSetState(() {});
                          return;
                        }
                        if (_model.validated!) {
                          _model.apiResultqs3 = await FileUploadCall.call(
                            file: _model.file,
                            userId: FFAppState().userId,
                            baseurl: FFAppState().baseUrl,
                            taskId:
                                widget.taskId != null && widget.taskId != ''
                                    ? widget.taskId
                                    : (""),
                            documentType: _model.selectedDocument,
                            reportType: _model.selectedCategory,
                            date:
                                functions.convertLocalDateTimeToUtcMilliseconds(
                                    _model.dou!),
                          );

                          if ((_model.apiResultqs3?.succeeded ?? true)) {
                            FFAppState().clearFetchListFileQueryCache();
                            if (widget.isFromTask) {
                              await widget.onBackPress?.call();
                            } else {
                              await widget.onBackPress?.call();
                            }
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Failed'),
                                  content: Text(
                                      'Error on uploading document. Please try again.'),
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
                          }
                        }

                        safeSetState(() {});
                      },
                text: 'Upload a file/document',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: (_model.file != null &&
                                    (_model.file?.bytes?.isNotEmpty ??
                                        false)) &&
                                (_model.categoryDropDownValue != null &&
                                    _model.categoryDropDownValue != '')
                            ? FlutterFlowTheme.of(context).secondary
                            : Color(0xFF242E49),
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                  disabledColor: Color(0xFFF5F5F5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
