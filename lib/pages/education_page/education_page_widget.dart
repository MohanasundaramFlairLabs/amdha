import '/components/higher_order_components/education_component/education_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'education_page_model.dart';
export 'education_page_model.dart';

class EducationPageWidget extends StatefulWidget {
  const EducationPageWidget({super.key});

  @override
  State<EducationPageWidget> createState() => _EducationPageWidgetState();
}

class _EducationPageWidgetState extends State<EducationPageWidget> {
  late EducationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EducationPageModel());

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
            model: _model.educationComponentModel,
            updateCallback: () => setState(() {}),
            child: const EducationComponentWidget(),
          ),
        ),
      ),
    );
  }
}
