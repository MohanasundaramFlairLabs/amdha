import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/shimmer_components/circular_dark_shimmer/circular_dark_shimmer_widget.dart';
import '/pages/components/shimmer_components/dark_shimmer_component/dark_shimmer_component_widget.dart';
import '/pages/components/shimmer_components/shimmer_component/shimmer_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard_shimmer_component_model.dart';
export 'dashboard_shimmer_component_model.dart';

class DashboardShimmerComponentWidget extends StatefulWidget {
  const DashboardShimmerComponentWidget({super.key});

  @override
  State<DashboardShimmerComponentWidget> createState() =>
      _DashboardShimmerComponentWidgetState();
}

class _DashboardShimmerComponentWidgetState
    extends State<DashboardShimmerComponentWidget> {
  late DashboardShimmerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardShimmerComponentModel());

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

    return Container(
      height: MediaQuery.sizeOf(context).height -
          FFAppState().statusBarHeight -
          (0.08 * MediaQuery.sizeOf(context).height),
      decoration: BoxDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                wrapWithModel(
                  model: _model.shimmerComponentModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: ShimmerComponentWidget(
                    width: MediaQuery.sizeOf(context).width,
                    height: 70.0,
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 70.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        wrapWithModel(
                          model: _model.darkShimmerComponentModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: DarkShimmerComponentWidget(
                            width: 24.0,
                            height: 24.0,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.darkShimmerComponentModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: DarkShimmerComponentWidget(
                            width: 160.0,
                            height: 30.0,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.darkShimmerComponentModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: DarkShimmerComponentWidget(
                            width: 60.0,
                            height: 26.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.95,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      wrapWithModel(
                        model: _model.shimmerComponentModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: ShimmerComponentWidget(
                          height: 76.0,
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 76.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              wrapWithModel(
                                model: _model.darkShimmerComponentModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: DarkShimmerComponentWidget(
                                  width: 150.0,
                                  height: 53.0,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.circularDarkShimmerModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CircularDarkShimmerWidget(
                                  width: 60.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  wrapWithModel(
                    model: _model.shimmerComponentModel3,
                    updateCallback: () => safeSetState(() {}),
                    child: ShimmerComponentWidget(
                      height: 120.0,
                    ),
                  ),
                  Stack(
                    children: [
                      wrapWithModel(
                        model: _model.shimmerComponentModel4,
                        updateCallback: () => safeSetState(() {}),
                        child: ShimmerComponentWidget(
                          height: 120.0,
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 125.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.darkShimmerComponentModel5,
                                updateCallback: () => safeSetState(() {}),
                                child: DarkShimmerComponentWidget(
                                  width: 70.0,
                                  height: 19.0,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: wrapWithModel(
                                    model: _model.darkShimmerComponentModel6,
                                    updateCallback: () => safeSetState(() {}),
                                    child: DarkShimmerComponentWidget(
                                      height: 68.0,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: wrapWithModel(
                                    model: _model.darkShimmerComponentModel7,
                                    updateCallback: () => safeSetState(() {}),
                                    child: DarkShimmerComponentWidget(
                                      height: 68.0,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: wrapWithModel(
                                    model: _model.darkShimmerComponentModel8,
                                    updateCallback: () => safeSetState(() {}),
                                    child: DarkShimmerComponentWidget(
                                      height: 68.0,
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(width: 8.0))
                                  .addToStart(SizedBox(width: 8.0))
                                  .addToEnd(SizedBox(width: 8.0)),
                            ),
                          ]
                              .divide(SizedBox(height: 14.0))
                              .addToStart(SizedBox(height: 10.0))
                              .addToEnd(SizedBox(height: 10.0)),
                        ),
                      ),
                    ],
                  ),
                  wrapWithModel(
                    model: _model.darkShimmerComponentModel9,
                    updateCallback: () => safeSetState(() {}),
                    child: DarkShimmerComponentWidget(
                      height: 72.0,
                    ),
                  ),
                  Stack(
                    children: [
                      wrapWithModel(
                        model: _model.shimmerComponentModel5,
                        updateCallback: () => safeSetState(() {}),
                        child: ShimmerComponentWidget(
                          height: 337.0,
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.darkShimmerComponentModel10,
                                updateCallback: () => safeSetState(() {}),
                                child: DarkShimmerComponentWidget(
                                  width: 170.0,
                                  height: 19.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.darkShimmerComponentModel11,
                                    updateCallback: () => safeSetState(() {}),
                                    child: DarkShimmerComponentWidget(
                                      height: 90.0,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.darkShimmerComponentModel12,
                                    updateCallback: () => safeSetState(() {}),
                                    child: DarkShimmerComponentWidget(
                                      height: 90.0,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.darkShimmerComponentModel13,
                                    updateCallback: () => safeSetState(() {}),
                                    child: DarkShimmerComponentWidget(
                                      height: 90.0,
                                    ),
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 14.0))
                              .addToStart(SizedBox(height: 10.0)),
                        ),
                      ),
                    ],
                  ),
                ]
                    .divide(SizedBox(height: 16.0))
                    .addToStart(SizedBox(height: 16.0))
                    .addToEnd(SizedBox(height: 16.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
