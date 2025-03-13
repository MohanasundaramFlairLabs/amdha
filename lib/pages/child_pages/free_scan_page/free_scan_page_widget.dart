import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/free_scan_flow/free_scan_component/free_scan_component_widget.dart';
import 'package:flutter/material.dart';
import 'free_scan_page_model.dart';
export 'free_scan_page_model.dart';

class FreeScanPageWidget extends StatefulWidget {
  const FreeScanPageWidget({super.key});

  static String routeName = 'FreeScanPage';
  static String routePath = '/freeScanPage';

  @override
  State<FreeScanPageWidget> createState() => _FreeScanPageWidgetState();
}

class _FreeScanPageWidgetState extends State<FreeScanPageWidget> {
  late FreeScanPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreeScanPageModel());

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
          child: wrapWithModel(
            model: _model.freeScanComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: FreeScanComponentWidget(),
          ),
        ),
      ),
    );
  }
}
