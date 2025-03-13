import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/connections_component_widget.dart';
import '/components/menu_component_widget.dart';
import '/components/task_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/education_component/education_component_widget.dart';
import '/pages/components/higher_order_components/medication_component/medication_component_widget.dart';
import '/pages/components/higher_order_components/vital_component/vital_component_widget.dart';
import '/pages/components/journal_component/journal_component_widget.dart';
import '/pages/custom_nav_bar/custom_nav_bar_widget.dart';
import '/pages/intro_screens/home_component/home_component_widget.dart';
import '/pages/open_health_settings/open_health_settings_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    int? index,
    bool? doScan,
    this.isFromNotification,
    this.taskId,
  })  : this.index = index ?? 0,
        this.doScan = doScan ?? false;

  final int index;
  final bool doScan;
  final bool? isFromNotification;
  final String? taskId;

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      await Future.wait([
        Future(() async {
          _model.isHideNavBar = false;
          safeSetState(() {});
          _model.doScan = widget.doScan;
          _model.selectedIndex = widget.index;
          safeSetState(() {});
          if (widget.doScan) {
            _model.isHideNavBar = true;
            safeSetState(() {});
            FFAppState().navBarHeight = _model.isHideNavBar
                ? 0.0
                : (MediaQuery.sizeOf(context).height * 0.08);
            safeSetState(() {});
            await Future.delayed(const Duration(milliseconds: 1000));
            _model.doScan = false;
            safeSetState(() {});
          }
        }),
        Future(() async {
          _model.subscriptionResponse =
              await SubscriptionGroup.getUserSubscriptionCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.subscriptionResponse?.succeeded ?? true)) {
            _model.subscriptionStatus = getJsonField(
              (_model.subscriptionResponse?.jsonBody ?? ''),
              r'''$.subscription.status''',
            ).toString().toString();
            safeSetState(() {});

            safeSetState(() {});
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.subscriptionResponse?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {
          _model.sendtoken = await SendFcmTokenCall.call(
            fcmtoken: FFAppState().FcmToken,
            baseurl: FFAppState().baseUrl,
            authToken: FFAppState().userId,
          );
        }),
        Future(() async {
          _model.programResponse = await ProgramGroup.getProgramCall.call(
            baseurl: FFAppState().baseUrl,
            userId: FFAppState().userId,
          );

          if ((_model.programResponse?.succeeded ?? true)) {
            if ((ProgramModelStruct.maybeFromMap(
                        (_model.programResponse?.jsonBody ?? ''))!
                    .programs
                    .where((e) => e.programName == 'Pregnancy')
                    .toList()
                    .isNotEmpty) &&
                (ProgramModelStruct.maybeFromMap(
                            (_model.programResponse?.jsonBody ?? ''))
                        ?.programs
                        .where((e) => e.programName == 'Pregnancy')
                        .toList()
                        .firstOrNull
                        ?.paymentStatus ==
                    true)) {
              FFAppState().theme = ThemeConfigStruct(
                primaryColor: Color(0xFFEF668A),
                secondaryColor: FlutterFlowTheme.of(context).secondary,
                backgroudPrimaryColor: Color(0xFFFEF3F6),
                darkSecondaryColor: Color(0xFFEF668A),
              );
              safeSetState(() {});
            } else {
              if ((ProgramModelStruct.maybeFromMap(
                          (_model.programResponse?.jsonBody ?? ''))!
                      .programs
                      .where((e) => e.programName == 'Senior Wellness')
                      .toList()
                      .isNotEmpty) &&
                  (ProgramModelStruct.maybeFromMap(
                              (_model.programResponse?.jsonBody ?? ''))
                          ?.programs
                          .where((e) => e.programName == 'Senior Wellness')
                          .toList()
                          .firstOrNull
                          ?.paymentStatus ==
                      true)) {
                FFAppState().theme = ThemeConfigStruct(
                  primaryColor: Color(0xFF008080),
                  secondaryColor: FlutterFlowTheme.of(context).secondary,
                  backgroudPrimaryColor: Color(0xFFE9FDFD),
                  darkSecondaryColor: Color(0xFFEF668A),
                );
                safeSetState(() {});
              } else {
                FFAppState().theme = ThemeConfigStruct(
                  primaryColor: FlutterFlowTheme.of(context).primary,
                  secondaryColor: FlutterFlowTheme.of(context).secondary,
                  backgroudPrimaryColor: Color(0xFFE3F8FF),
                );
                safeSetState(() {});
              }
            }

            _model.program = ProgramModelStruct.maybeFromMap(
                    (_model.programResponse?.jsonBody ?? ''))
                ?.programs
                .firstOrNull;
            safeSetState(() {});
            _model.userprofile = await HocGroup.getProfileCall.call(
              userId: FFAppState().userId,
              baseurl: FFAppState().baseUrl,
            );

            if ((_model.userprofile?.succeeded ?? true)) {
              FFAppState().userDetails =
                  ProfileModelStruct.maybeFromMap(getJsonField(
                (_model.userprofile?.jsonBody ?? ''),
                r'''$.data''',
              ))!;
              safeSetState(() {});
            } else {
              await action_blocks.sessionExpired(
                context,
                statusCode: (_model.userprofile?.statusCode ?? 200),
              );
            }

            _model.isdataLoaded = true;
            safeSetState(() {});
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.programResponse?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {
          _model.apiResultp5k = await GetSettingsCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.apiResultp5k?.succeeded ?? true)) {
            FFAppState().settings = SettingsStruct.maybeFromMap(getJsonField(
              (_model.apiResultp5k?.jsonBody ?? ''),
              r'''$.settings''',
            ))!;
            safeSetState(() {});
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.apiResultp5k?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {
          _model.isFromPushnotification = widget.isFromNotification!;
          safeSetState(() {});
        }),
        Future(() async {
          _model.apiResultbzt = await HocGroup.medicationCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );
        }),
        Future(() async {
          _model.quotaResponseHome = await SubscriptionGroup.getQuotasCall.call(
            userId: FFAppState().userId,
            baseurl: FFAppState().baseUrl,
          );

          if ((_model.quotaResponseHome?.succeeded ?? true)) {
            FFAppState().quotas = QuotaModelStruct.maybeFromMap(
                (_model.quotaResponseHome?.jsonBody ?? ''))!;
            safeSetState(() {});
            if (FFAppState().settings.healthDevice.sync &&
                (isAndroid || isiOS) &&
                !FFAppState().permissionsAsked) {
              if (!widget.doScan) {
                await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(dialogContext).unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Container(
                          height: 200.0,
                          width: 300.0,
                          child: OpenHealthSettingsWidget(),
                        ),
                      ),
                    );
                  },
                );
              }
            }
          } else {
            await action_blocks.sessionExpired(
              context,
              statusCode: (_model.quotaResponseHome?.statusCode ?? 200),
            );
          }
        }),
        Future(() async {
          if (FFAppState().settings.healthDevice.sync &&
              (isAndroid || isiOS) &&
              !FFAppState().permissionsAsked) {
            if (!widget.doScan) {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(dialogContext).unfocus();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Container(
                        height: 200.0,
                        width: 300.0,
                        child: OpenHealthSettingsWidget(),
                      ),
                    ),
                  );
                },
              );
            }
          }
        }),
      ]);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_DISPOSE');
      _model.isdataLoaded = false;
      safeSetState(() {});
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            appBar: _model.selectedIndex == 0
                ? AppBar(
                    backgroundColor: valueOrDefault<Color>(
                      FFAppState().theme.backgroudPrimaryColor,
                      FlutterFlowTheme.of(context).secondary,
                    ),
                    automaticallyImplyLeading: false,
                    actions: [],
                    flexibleSpace: FlexibleSpaceBar(
                      background: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                isiOS || isAndroid ? 25.0 : 0.0,
                                0.0,
                              ),
                              0.0,
                              0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                FFAppState().theme.backgroudPrimaryColor,
                                FlutterFlowTheme.of(context).secondary,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Welcome Back,',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            Color(0xFF949494),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFAppState()
                                                        .userDetails
                                                        .firstName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: valueOrDefault<
                                                              Color>(
                                                            FFAppState()
                                                                .theme
                                                                .primaryColor,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/emaji.png',
                                                      width: 20.0,
                                                      height: 20.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      height: 56.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Stack(
                                            children: [
                                              badges.Badge(
                                                badgeContent: Text(
                                                  '1',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                                ),
                                                showBadge: true,
                                                shape: badges.BadgeShape.circle,
                                                badgeColor: Color(0xFFF6861F),
                                                elevation: 4.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                position: badges.BadgePosition
                                                    .topEnd(),
                                                animationType: badges
                                                    .BadgeAnimationType.scale,
                                                toAnimate: true,
                                                child: Icon(
                                                  FFIcons.knotificationpopup,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 25.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HOME_PAGE_PAGE_Container_1lseoxpo_ON_TAP');
                                      await showDialog(
                                        barrierColor: Color(0x27242E49),
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    1.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                child: MenuComponentWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 56.0,
                                      height: 56.0,
                                      decoration: BoxDecoration(),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.dehaze,
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme.primaryColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ].addToEnd(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Builder(
                builder: (context) {
                  if (_model.isdataLoaded) {
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            FFAppState().statusBarHeight,
                            0.0,
                          ),
                          0.0,
                          0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 0.0,
                            height: 0.0,
                            child: custom_widgets.StatusBarHeightWidget(
                              width: 0.0,
                              height: 0.0,
                              onHeightChanged: (height) async {
                                logFirebaseEvent(
                                    'HOME_Container_bp8ij1yd_CALLBACK');
                                FFAppState().statusBarHeight = height;
                                FFAppState().update(() {});
                              },
                            ),
                          ),
                          if (_model.selectedIndex == 4)
                            Expanded(
                              child: wrapWithModel(
                                model: _model.vitalComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: VitalComponentWidget(
                                  doOpenScan: _model.doScan,
                                  isPP: (_model.program?.programName ==
                                          'Pregnancy') &&
                                      (_model.program?.paymentStatus == true),
                                  callback: (isHide) async {
                                    logFirebaseEvent(
                                        'HOME_Container_n1e6acxj_CALLBACK');
                                    _model.isHideNavBar = isHide;
                                    safeSetState(() {});
                                    FFAppState().navBarHeight = _model
                                            .isHideNavBar
                                        ? 0.0
                                        : (MediaQuery.sizeOf(context).height *
                                            0.08);
                                    safeSetState(() {});
                                  },
                                  goHomeCallback: () async {
                                    logFirebaseEvent(
                                        'HOME_Container_n1e6acxj_CALLBACK');
                                    _model.selectedIndex = 0;
                                    _model.isHideNavBar = false;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                          if (_model.selectedIndex == 0)
                            Expanded(
                              child: wrapWithModel(
                                model: _model.homeComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: HomeComponentWidget(
                                  program: _model.program,
                                  doScan: () async {
                                    logFirebaseEvent(
                                        'HOME_Container_w0y2jy7p_CALLBACK');
                                    _model.selectedIndex = 4;
                                    _model.doScan = true;
                                    _model.isHideNavBar = true;
                                    safeSetState(() {});
                                    FFAppState().navBarHeight = _model
                                            .isHideNavBar
                                        ? 0.0
                                        : (MediaQuery.sizeOf(context).height *
                                            0.08);
                                    safeSetState(() {});
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));
                                    _model.doScan = false;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                          if (_model.selectedIndex == 2)
                            Expanded(
                              child: wrapWithModel(
                                model: _model.medicationComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: MedicationComponentWidget(
                                  callback: (isHideNavBar) async {
                                    logFirebaseEvent(
                                        'HOME_Container_1d307oa1_CALLBACK');
                                    _model.isHideNavBar = isHideNavBar;
                                    safeSetState(() {});
                                    FFAppState().navBarHeight = _model
                                            .isHideNavBar
                                        ? 0.0
                                        : (MediaQuery.sizeOf(context).height *
                                            0.08);
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                          if (_model.selectedIndex == -1)
                            Expanded(
                              child: wrapWithModel(
                                model: _model.educationComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: EducationComponentWidget(
                                  callback: (isHide) async {
                                    logFirebaseEvent(
                                        'HOME_Container_737o5hmx_CALLBACK');
                                    _model.isHideNavBar = isHide!;
                                    safeSetState(() {});
                                    FFAppState().navBarHeight = _model
                                            .isHideNavBar
                                        ? 0.0
                                        : (MediaQuery.sizeOf(context).height *
                                            0.08);
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                          if (_model.selectedIndex == -2)
                            Expanded(
                              child: wrapWithModel(
                                model: _model.journalComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: JournalComponentWidget(
                                  backAction: () async {},
                                ),
                              ),
                            ),
                          if (_model.selectedIndex == 3)
                            Expanded(
                              child: wrapWithModel(
                                model: _model.connectionsComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: ConnectionsComponentWidget(
                                  isFromReschedule: false,
                                  isFromFollowUpOrTask: false,
                                  isFromTask: false,
                                  callbackNavbar: (isHide) async {
                                    logFirebaseEvent(
                                        'HOME_Container_n07a6qib_CALLBACK');
                                    _model.isHideNavBar = isHide!;
                                    safeSetState(() {});
                                    FFAppState().navBarHeight = _model
                                            .isHideNavBar
                                        ? 0.0
                                        : (MediaQuery.sizeOf(context).height *
                                            0.08);
                                    safeSetState(() {});
                                  },
                                  backCallback: () async {},
                                ),
                              ),
                            ),
                          if (_model.selectedIndex == 1)
                            Expanded(
                              child: wrapWithModel(
                                model: _model.taskComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: TaskComponentWidget(
                                  isFromNotification:
                                      _model.isFromPushnotification,
                                  taskId: widget.taskId,
                                  isHideNavBar: (isHide) async {
                                    logFirebaseEvent(
                                        'HOME_Container_w85t5chd_CALLBACK');
                                    _model.isHideNavBar = isHide;
                                    safeSetState(() {});
                                  },
                                  callbackToResetNotification: () async {
                                    logFirebaseEvent(
                                        'HOME_Container_w85t5chd_CALLBACK');
                                    _model.isFromPushnotification = false;
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.customNavBarModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: CustomNavBarWidget(
                                initialIndex: _model.selectedIndex,
                                navBarHeight: _model.isHideNavBar
                                    ? 0.0
                                    : (MediaQuery.sizeOf(context).height *
                                        0.08),
                                selectedIndex: (index) async {
                                  logFirebaseEvent(
                                      'HOME_Container_ju40jd3f_CALLBACK');
                                  _model.selectedIndex = index;
                                  _model.initalIndexTab = 0;
                                  safeSetState(() {});
                                  if (_model.selectedIndex == 0) {
                                    FFAppState()
                                        .clearFetchUpcomingMedicationCache();
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Fetching your details..',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
