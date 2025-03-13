import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/file_upload_component/file_upload_component_widget.dart';
import '/pages/components/higher_order_components/list_file_component/list_file_component_widget.dart';
import '/pages/components/micro_components/menu_components/menu_card/menu_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'more_item_component_model.dart';
export 'more_item_component_model.dart';

class MoreItemComponentWidget extends StatefulWidget {
  const MoreItemComponentWidget({
    super.key,
    required this.callbackMoreItems,
  });

  final Future Function(String? selectedIndex)? callbackMoreItems;

  @override
  State<MoreItemComponentWidget> createState() =>
      _MoreItemComponentWidgetState();
}

class _MoreItemComponentWidgetState extends State<MoreItemComponentWidget> {
  late MoreItemComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreItemComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MORE_ITEM_COMPONENT_MoreItemComponent_ON');
      _model.isFirstChild = true;
      _model.isAddFile = false;
      safeSetState(() {});
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
    return Stack(
      children: [
        if (_model.isFirstChild == true)
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 56.0,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'More Items',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
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
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      decoration: BoxDecoration(),
                      child: Text(
                        'Menu',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MORE_ITEM_COMPONENT_Container_8r4luz2i_O');
                        await widget.callbackMoreItems?.call(
                          'filesList',
                        );
                        _model.isFirstChild = false;
                        _model.selectedIndex = 'filesList';
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuCardWidget(
                          menuName: 'Health Files',
                          menuIcon: Icon(
                            Icons.insert_drive_file,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MORE_ITEM_COMPONENT_Container_92n7t9uh_O');
                        await widget.callbackMoreItems?.call(
                          '1',
                        );
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuCardWidget(
                          menuName: 'Scan History',
                          menuIcon: Icon(
                            Icons.qr_code_scanner_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MORE_ITEM_COMPONENT_Container_6oef0pqh_O');
                        await widget.callbackMoreItems?.call(
                          '2',
                        );
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuCardWidget(
                          menuName: 'Consent',
                          menuIcon: FaIcon(
                            FontAwesomeIcons.check,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 20.0))
                      .addToStart(SizedBox(height: 20.0))
                      .addToEnd(SizedBox(height: 20.0)),
                ),
              ],
            ),
          ),
        if (_model.selectedIndex == 'filesList')
          wrapWithModel(
            model: _model.listFileComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: ListFileComponentWidget(
              navigateBack: () async {
                logFirebaseEvent('MORE_ITEM_COMPONENT_Container_opznkarg_C');
                _model.isAddFile = true;
                _model.isFirstChild = false;
                safeSetState(() {});
              },
              addCallback: () async {},
            ),
          ),
        if (_model.isAddFile ?? true)
          wrapWithModel(
            model: _model.fileUploadComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: FileUploadComponentWidget(
              onBackPress: () async {
                logFirebaseEvent('MORE_ITEM_COMPONENT_Container_9yn2h6ps_C');
                _model.isFirstChild = true;
                _model.isAddFile = false;
                safeSetState(() {});
              },
            ),
          ),
      ],
    );
  }
}
