import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/file_upload_component/file_upload_component_widget.dart';
import '/pages/components/higher_order_components/list_file_component/list_file_component_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'file_upload_page_model.dart';
export 'file_upload_page_model.dart';

class FileUploadPageWidget extends StatefulWidget {
  const FileUploadPageWidget({super.key});

  static String routeName = 'FileUploadPage';
  static String routePath = '/fileUploadPage';

  @override
  State<FileUploadPageWidget> createState() => _FileUploadPageWidgetState();
}

class _FileUploadPageWidgetState extends State<FileUploadPageWidget> {
  late FileUploadPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FileUploadPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FILE_UPLOAD_FileUploadPage_ON_INIT_STATE');
      _model.isFirstChild = true;
      _model.isSecondChild = false;
      safeSetState(() {});
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
          child: Stack(
            children: [
              if (_model.isFirstChild)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('FILE_UPLOAD_Container_5c1uzt2d_ON_TAP');

                    safeSetState(() {});
                  },
                  child: wrapWithModel(
                    model: _model.listFileComponentModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ListFileComponentWidget(
                      navigateBack: () async {
                        logFirebaseEvent(
                            'FILE_UPLOAD_Container_5c1uzt2d_CALLBACK');

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
                      addCallback: () async {
                        logFirebaseEvent(
                            'FILE_UPLOAD_Container_5c1uzt2d_CALLBACK');
                        _model.isFirstChild = false;
                        _model.isSecondChild = true;
                        safeSetState(() {});
                      },
                    ),
                  ),
                ),
              if (_model.isSecondChild)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.fileUploadComponentModel,
                    updateCallback: () => safeSetState(() {}),
                    child: FileUploadComponentWidget(
                      isFromTask: false,
                      allowDocumentDropDown: true,
                      onBackPress: () async {
                        logFirebaseEvent(
                            'FILE_UPLOAD_Container_mz5mzlfl_CALLBACK');
                        _model.isFirstChild = true;
                        _model.isSecondChild = false;
                        safeSetState(() {});
                      },
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
