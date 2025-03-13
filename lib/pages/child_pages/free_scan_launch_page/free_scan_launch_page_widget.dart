import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/free_scan_flow/free_scan_launch/free_scan_launch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'free_scan_launch_page_model.dart';
export 'free_scan_launch_page_model.dart';

class FreeScanLaunchPageWidget extends StatefulWidget {
  const FreeScanLaunchPageWidget({super.key});

  static String routeName = 'freeScanLaunchPage';
  static String routePath = '/freeScanLaunchPage';

  @override
  State<FreeScanLaunchPageWidget> createState() =>
      _FreeScanLaunchPageWidgetState();
}

class _FreeScanLaunchPageWidgetState extends State<FreeScanLaunchPageWidget> {
  late FreeScanLaunchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreeScanLaunchPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FREE_SCAN_LAUNCH_freeScanLaunchPage_ON_I');
      FFAppState().isFreeScanAvailable = true;
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
            model: _model.freeScanLaunchModel,
            updateCallback: () => safeSetState(() {}),
            child: FreeScanLaunchWidget(),
          ),
        ),
      ),
    );
  }
}
