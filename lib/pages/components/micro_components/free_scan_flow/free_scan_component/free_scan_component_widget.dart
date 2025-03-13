import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/free_next_component/free_next_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'free_scan_component_model.dart';
export 'free_scan_component_model.dart';

class FreeScanComponentWidget extends StatefulWidget {
  const FreeScanComponentWidget({super.key});

  @override
  State<FreeScanComponentWidget> createState() =>
      _FreeScanComponentWidgetState();
}

class _FreeScanComponentWidgetState extends State<FreeScanComponentWidget> {
  late FreeScanComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreeScanComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Container(
            width: double.infinity,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _model.pageViewController ??=
                  PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/pic7.png',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/pic4.png',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/pic5.png',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/pic6.png',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/pic3.png',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            height: 240.0,
            decoration: BoxDecoration(
              color: Color(0x8C333333),
            ),
            child: wrapWithModel(
              model: _model.freeNextComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: FreeNextComponentWidget(
                feature: FFAppState()
                    .ListOfFeature
                    .elementAtOrNull(_model.pageViewCurrentIndex)
                    ?.feature,
                detail: FFAppState()
                    .ListOfFeature
                    .elementAtOrNull(_model.pageViewCurrentIndex)
                    ?.detail,
                index: _model.pageViewCurrentIndex,
                callbackNextPage: () async {
                  logFirebaseEvent('FREE_SCAN_COMPONENT_Container_0xlqrb2b_C');
                  await _model.pageViewController?.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
