import '/components/vital_home_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'scan_result_model.dart';
export 'scan_result_model.dart';

class ScanResultWidget extends StatefulWidget {
  const ScanResultWidget({super.key});

  static String routeName = 'ScanResult';
  static String routePath = '/scanResult';

  @override
  State<ScanResultWidget> createState() => _ScanResultWidgetState();
}

class _ScanResultWidgetState extends State<ScanResultWidget> {
  late ScanResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanResultModel());

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
            model: _model.vitalHomeComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: VitalHomeComponentWidget(
              isScanResult: true,
              callback: (isScanVital, iSAddVital) async {},
              editCallback: (vitalToEdit) async {},
            ),
          ),
        ),
      ),
    );
  }
}
