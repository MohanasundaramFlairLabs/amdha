import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'careplix_webview_model.dart';
export 'careplix_webview_model.dart';

class CareplixWebviewWidget extends StatefulWidget {
  const CareplixWebviewWidget({
    super.key,
    this.weight,
    this.height,
    this.posture,
    this.dob,
    this.gender,
    this.scanType,
  });

  final double? weight;
  final double? height;
  final String? posture;
  final String? dob;
  final String? gender;
  final String? scanType;

  static String routeName = 'CareplixWebview';
  static String routePath = '/careplixWebview';

  @override
  State<CareplixWebviewWidget> createState() => _CareplixWebviewWidgetState();
}

class _CareplixWebviewWidgetState extends State<CareplixWebviewWidget> {
  late CareplixWebviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CareplixWebviewModel());

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
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          child: custom_widgets.CustomWebView(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            scanType: widget.scanType,
            userWeight: widget.weight,
            userHeight: widget.height,
            dob: widget.dob,
            posture: widget.posture,
            gender: widget.gender,
            userId: FFAppState().userId,
            freeScan: FFAppState().isFreeScanAvailable,
            successCallback: () async {},
            errorCallback: () async {},
          ),
        ),
      ),
    );
  }
}
