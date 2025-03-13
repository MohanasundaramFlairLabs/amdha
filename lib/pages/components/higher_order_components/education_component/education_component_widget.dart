import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/education_preview_component/education_preview_component_widget.dart';
import '/pages/components/micro_components/education_components/education_list_component/education_list_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'education_component_model.dart';
export 'education_component_model.dart';

class EducationComponentWidget extends StatefulWidget {
  const EducationComponentWidget({
    super.key,
    required this.callback,
    bool? isFromMenu,
  }) : this.isFromMenu = isFromMenu ?? false;

  final Future Function(bool? isHide)? callback;
  final bool isFromMenu;

  @override
  State<EducationComponentWidget> createState() =>
      _EducationComponentWidgetState();
}

class _EducationComponentWidgetState extends State<EducationComponentWidget> {
  late EducationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EducationComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDUCATION_COMPONENT_EducationComponent_O');
      _model.updateSelectedEducationStruct(
        (e) => e
          ..title = null
          ..description = null
          ..contentType = null
          ..addedBy = null
          ..uri = null,
      );
      safeSetState(() {});
      _model.isFirstChild = true;
      safeSetState(() {});
      await widget.callback?.call(
        false,
      );
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

    return Stack(
      children: [
        if (_model.isFirstChild == true)
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height -
                FFAppState().statusBarHeight -
                FFAppState().navBarHeight,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.isFromMenu)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'EDUCATION_COMPONENT_Container_pi8vkpyu_O');
                              context.safePop();
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
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                widget.isFromMenu ? 0.0 : 20.0,
                                0.0,
                              ),
                              0.0,
                              0.0,
                              0.0),
                          child: Text(
                            'Education',
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
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        wrapWithModel(
                          model: _model.educationListComponentModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: EducationListComponentWidget(
                            isFromPP: false,
                            callbackEducationLIst: (selectedValue) async {
                              logFirebaseEvent(
                                  'EDUCATION_COMPONENT_Container_p08ftbpq_C');
                              _model.selectedEducation = selectedValue;
                              _model.isFirstChild = false;
                              _model.updatePage(() {});
                              await widget.callback?.call(
                                true,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (_model.isFirstChild == false)
          wrapWithModel(
            model: _model.educationPreviewComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: EducationPreviewComponentWidget(
              education: _model.selectedEducation!,
              callbackEducationPreview: () async {
                logFirebaseEvent('EDUCATION_COMPONENT_Container_69iaize5_C');
                _model.isFirstChild = true;
                safeSetState(() {});
                await widget.callback?.call(
                  false,
                );
              },
            ),
          ),
      ],
    );
  }
}
