import '/components/higher_order_components/list_file_component/list_file_component_widget.dart';
import '/components/micro_components/menu_components/menu_card/menu_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
      _model.isFirstChild = true;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                      decoration: const BoxDecoration(),
                      alignment: const AlignmentDirectional(-1.0, 0.0),
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
                      decoration: const BoxDecoration(),
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
                        await widget.callbackMoreItems?.call(
                          'filesList',
                        );
                        _model.isFirstChild = false;
                        _model.selectedIndex = 'filesList';
                        setState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel1,
                        updateCallback: () => setState(() {}),
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
                        await widget.callbackMoreItems?.call(
                          '1',
                        );
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel2,
                        updateCallback: () => setState(() {}),
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
                        await widget.callbackMoreItems?.call(
                          '2',
                        );
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel3,
                        updateCallback: () => setState(() {}),
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
                      .divide(const SizedBox(height: 20.0))
                      .addToStart(const SizedBox(height: 20.0))
                      .addToEnd(const SizedBox(height: 20.0)),
                ),
              ],
            ),
          ),
        if (_model.selectedIndex == 'filesList')
          wrapWithModel(
            model: _model.listFileComponentModel,
            updateCallback: () => setState(() {}),
            child: ListFileComponentWidget(
              callback: (isAddFile) async {},
            ),
          ),
      ],
    );
  }
}
