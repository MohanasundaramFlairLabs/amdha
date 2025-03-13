import '';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_nav_bar_model.dart';
export 'custom_nav_bar_model.dart';

class CustomNavBarWidget extends StatefulWidget {
  const CustomNavBarWidget({
    super.key,
    required this.selectedIndex,
    int? initialIndex,
    this.navBarHeight,
  }) : this.initialIndex = initialIndex ?? 0;

  final Future Function(int index)? selectedIndex;
  final int initialIndex;
  final double? navBarHeight;

  @override
  State<CustomNavBarWidget> createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  late CustomNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomNavBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CUSTOM_NAV_BAR_CustomNavBar_ON_INIT_STAT');
      _model.selectedIndex = widget.initialIndex;
      _model.updatePage(() {});
    });

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Divider(
          height: 0.0,
          thickness: 0.5,
          color: Color(0xFFDFDFDF),
        ),
        Container(
          height: widget.navBarHeight,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CUSTOM_NAV_BAR_Container_tq3xojh5_ON_TAP');
                  _model.selectedIndex = 0;
                  safeSetState(() {});
                  await widget.selectedIndex?.call(
                    0,
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      if ((widget.initialIndex == 0) &&
                          (FFAppState().theme.primaryColor ==
                              FlutterFlowTheme.of(context).primary))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/indicator.svg',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 200.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                FFIcons.khomeIcon,
                                color: widget.initialIndex == 0
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0x7F5D6A85),
                                size: 25.0,
                              ),
                              AutoSizeText(
                                'Home',
                                minFontSize: 10.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nevermind',
                                      color: widget.initialIndex == 0
                                          ? valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            )
                                          : Color(0x7F5D6A85),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Nevermind'),
                                    ),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CUSTOM_NAV_BAR_Container_zf9bv8xd_ON_TAP');
                  _model.selectedIndex = 1;
                  safeSetState(() {});
                  await widget.selectedIndex?.call(
                    1,
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      if ((widget.initialIndex == 1) &&
                          (FFAppState().theme.primaryColor ==
                              FlutterFlowTheme.of(context).primary))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/indicator.svg',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 200.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.ktaskIcon,
                                color: widget.initialIndex == 1
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0x7F5D6A85),
                                size: 25.0,
                              ),
                              AutoSizeText(
                                'Activities',
                                minFontSize: 10.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nevermind',
                                      color: widget.initialIndex == 1
                                          ? valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            )
                                          : Color(0x7F5D6A85),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Nevermind'),
                                    ),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CUSTOM_NAV_BAR_Container_ogv8tov7_ON_TAP');
                  _model.apiResultwza =
                      await SubscriptionGroup.featuresCall.call(
                    userId: FFAppState().userId,
                    baseurl: FFAppState().baseUrl,
                    feature: 'medication_reminders',
                  );

                  if ((_model.apiResultwza?.succeeded ?? true)) {
                    if (FeatureModelStruct.maybeFromMap(
                                (_model.apiResultwza?.jsonBody ?? ''))
                            ?.available ==
                        true) {
                      _model.selectedIndex = 2;
                      safeSetState(() {});
                      await widget.selectedIndex?.call(
                        2,
                      );
                    } else {
                      await action_blocks.doSubscription(
                        context,
                        parameterIds: FFAppState().planIds,
                      );
                    }
                  }

                  safeSetState(() {});
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      if ((widget.initialIndex == 2) &&
                          (FFAppState().theme.primaryColor ==
                              FlutterFlowTheme.of(context).primary))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/indicator.svg',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 200.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.kmedicationIcon,
                                color: widget.initialIndex == 2
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0x7F5D6A85),
                                size: 25.0,
                              ),
                              AutoSizeText(
                                'Medications',
                                minFontSize: 10.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nevermind',
                                      color: widget.initialIndex == 2
                                          ? valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            )
                                          : Color(0x7F5D6A85),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Nevermind'),
                                    ),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CUSTOM_NAV_BAR_Container_fbbrknqe_ON_TAP');
                  _model.selectedIndex = 3;
                  safeSetState(() {});
                  await widget.selectedIndex?.call(
                    3,
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      if ((widget.initialIndex == 3) &&
                          (FFAppState().theme.primaryColor ==
                              FlutterFlowTheme.of(context).primary))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/indicator.svg',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 200.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.kconnectionIcon,
                                color: widget.initialIndex == 3
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0x7F5D6A85),
                                size: 25.0,
                              ),
                              AutoSizeText(
                                'Connections',
                                minFontSize: 10.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nevermind',
                                      color: widget.initialIndex == 3
                                          ? valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            )
                                          : Color(0x7F5D6A85),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Nevermind'),
                                    ),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CUSTOM_NAV_BAR_Container_0vd7t3ej_ON_TAP');
                  _model.selectedIndex = 4;
                  safeSetState(() {});
                  await widget.selectedIndex?.call(
                    4,
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      if ((widget.initialIndex == 4) &&
                          (FFAppState().theme.primaryColor ==
                              FlutterFlowTheme.of(context).primary))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/indicator.svg',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 200.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FFIcons.kactivitiesIcon,
                                color: widget.initialIndex == 4
                                    ? valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )
                                    : Color(0x7F5D6A85),
                                size: 25.0,
                              ),
                              AutoSizeText(
                                'Vitals',
                                minFontSize: 10.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nevermind',
                                      color: widget.initialIndex == 4
                                          ? valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            )
                                          : Color(0x7F5D6A85),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Nevermind'),
                                    ),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
