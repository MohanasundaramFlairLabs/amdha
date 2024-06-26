import '/components/higher_order_components/vital_component/vital_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'vitals_page_model.dart';
export 'vitals_page_model.dart';

class VitalsPageWidget extends StatefulWidget {
  const VitalsPageWidget({super.key});

  @override
  State<VitalsPageWidget> createState() => _VitalsPageWidgetState();
}

class _VitalsPageWidgetState extends State<VitalsPageWidget> {
  late VitalsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VitalsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.vitalComponentModel,
            updateCallback: () => setState(() {}),
            child: const VitalComponentWidget(),
          ),
        ),
      ),
    );
  }
}
