import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/education_preview_component/education_preview_component_widget.dart';
import 'package:flutter/material.dart';
import 'education_preview_model.dart';
export 'education_preview_model.dart';

class EducationPreviewWidget extends StatefulWidget {
  const EducationPreviewWidget({
    super.key,
    this.education,
  });

  final ItemsStruct? education;

  static String routeName = 'EducationPreview';
  static String routePath = '/educationPreview';

  @override
  State<EducationPreviewWidget> createState() => _EducationPreviewWidgetState();
}

class _EducationPreviewWidgetState extends State<EducationPreviewWidget> {
  late EducationPreviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EducationPreviewModel());

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
            model: _model.educationPreviewComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: EducationPreviewComponentWidget(
              education: widget.education!,
              callbackEducationPreview: () async {
                logFirebaseEvent('EDUCATION_PREVIEW_Container_44e6qfg6_CAL');
                context.safePop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
