import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/education_component/education_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'education_page_model.dart';
export 'education_page_model.dart';

class EducationPageWidget extends StatefulWidget {
  const EducationPageWidget({super.key});

  static String routeName = 'EducationPage';
  static String routePath = '/educationPage';

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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDUCATION_EducationPage_ON_INIT_STATE');
      FFAppState().navBarHeight = 0.0;
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
    context.watch<FFAppState>();

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
            model: _model.educationComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: EducationComponentWidget(
              isFromMenu: true,
              callback: (isHide) async {},
            ),
          ),
        ),
      ),
    );
  }
}
