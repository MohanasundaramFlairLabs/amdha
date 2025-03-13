import '';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/option_component/option_component_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_of_files_model.dart';
export 'list_of_files_model.dart';

class ListOfFilesWidget extends StatefulWidget {
  const ListOfFilesWidget({
    super.key,
    String? fileName,
    String? date,
    this.path,
    this.id,
  })  : this.fileName = fileName ?? 'Name',
        this.date = date ?? 'date';

  final String fileName;
  final String date;
  final String? path;
  final String? id;

  @override
  State<ListOfFilesWidget> createState() => _ListOfFilesWidgetState();
}

class _ListOfFilesWidgetState extends State<ListOfFilesWidget> {
  late ListOfFilesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfFilesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(1.0, 1.0),
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('LIST_OF_FILES_Container_r0yspghn_ON_TAP');
            _model.isOption = false;
            safeSetState(() {});
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.insert_drive_file,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.fileName.maybeHandleOverflow(
                            maxChars: 25,
                            replacement: '…',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Text(
                          'Uploaded ${widget.date}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ),
                ),
                if (false)
                  FlutterFlowIconButton(
                    borderWidth: 1.0,
                    icon: Icon(
                      Icons.download,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'LIST_OF_FILES_COMP_download_ICN_ON_TAP');
                      await launchURL(widget.path!);
                    },
                  ),
                AlignedTooltip(
                  content: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Container(
                      height: 60.0,
                      child: OptionComponentWidget(
                        id: widget.id,
                        path: widget.path,
                      ),
                    ),
                  ),
                  offset: 0.0,
                  preferredDirection: AxisDirection.left,
                  borderRadius: BorderRadius.circular(0.0),
                  elevation: 0.0,
                  tailBaseWidth: 0.0,
                  tailLength: 0.0,
                  waitDuration: Duration(milliseconds: 100),
                  showDuration: Duration(milliseconds: 0),
                  triggerMode: TooltipTriggerMode.tap,
                  child: Icon(
                    FFIcons.ksolarMenuDotsBold,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
              ].addToEnd(SizedBox(width: 10.0)),
            ),
          ),
        ),
        if (_model.isOption)
          Container(
            decoration: BoxDecoration(),
            child: wrapWithModel(
              model: _model.optionComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: OptionComponentWidget(
                id: widget.id,
                path: widget.path,
              ),
            ),
          ),
      ],
    );
  }
}
