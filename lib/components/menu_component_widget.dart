import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/menu_components/menu_card/menu_card_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_component_model.dart';
export 'menu_component_model.dart';

class MenuComponentWidget extends StatefulWidget {
  const MenuComponentWidget({super.key});

  @override
  State<MenuComponentWidget> createState() => _MenuComponentWidgetState();
}

class _MenuComponentWidgetState extends State<MenuComponentWidget> {
  late MenuComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuComponentModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80.0,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    child: custom_widgets.ProfileAvatar(
                      width: 40.0,
                      height: 40.0,
                      firstName: FFAppState().userDetails.firstName,
                      lastName: FFAppState().userDetails.lastName,
                      backgroundColor: valueOrDefault<Color>(
                        FFAppState().theme.primaryColor,
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${FFAppState().userDetails.firstName}  ${FFAppState().userDetails.lastName}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Text(
                          '${functions.calculateAge(functions.convertStringToDate(FFAppState().userDetails.dob)).toString()}, ${FFAppState().userDetails.gender}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MENU_COMPONENT_COMP_Icon_5iwx8m9q_ON_TAP');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 10.0))
                    .addToStart(SizedBox(width: 20.0))
                    .addToEnd(SizedBox(width: 20.0)),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Divider(
                    height: 0.0,
                    thickness: 0.25,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  if (FFAppState().isSignOut)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MENU_COMPONENT_Container_fwtpkok1_ON_TAP');

                        context.pushNamed(UserProfileWidget.routeName);

                        Navigator.pop(context);
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuCardWidget(
                          menuName: 'Profile',
                          menuIcon: Icon(
                            Icons.manage_accounts_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MENU_COMPONENT_Container_337gfvk2_ON_TAP');
                      if (FFAppState().quotas.quotas.addVitals > 0) {
                        context.pushNamed(FileUploadPageWidget.routeName);

                        Navigator.pop(context);
                      } else {
                        await action_blocks.doSubscription(
                          context,
                          parameterIds: FFAppState().planIds,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: wrapWithModel(
                      model: _model.menuCardModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuCardWidget(
                        menuName: 'Health Files',
                        menuIcon: Icon(
                          FFIcons.kfilesIcon,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                  if (FFAppState().settings.healthDevice.sync &&
                      (isAndroid || isiOS))
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MENU_COMPONENT_Container_uos7yv8p_ON_TAP');

                        context.pushNamed(HealthConnectWidget.routeName);

                        Navigator.pop(context);
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuCardWidget(
                          menuName: 'Health Devices',
                          menuIcon: Icon(
                            FFIcons.khealthdevice,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MENU_COMPONENT_Container_iaca638n_ON_TAP');

                      context.pushNamed(ScanHistoryWidget.routeName);

                      Navigator.pop(context);
                    },
                    child: wrapWithModel(
                      model: _model.menuCardModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuCardWidget(
                        menuName: 'Scan History',
                        menuIcon: Icon(
                          FFIcons.klayer12,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MENU_COMPONENT_Container_ywi4bi1a_ON_TAP');
                      if (FFAppState().quotas.quotas.addVitals > 0) {
                        context.pushNamed(EducationPageWidget.routeName);

                        Navigator.pop(context);
                      } else {
                        await action_blocks.doSubscription(
                          context,
                          parameterIds: FFAppState().planIds,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: wrapWithModel(
                      model: _model.menuCardModel5,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuCardWidget(
                        menuName: 'Education',
                        menuIcon: Icon(
                          FFIcons.keducationIcon,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MENU_COMPONENT_Container_asdk7vee_ON_TAP');
                      if (FFAppState().quotas.quotas.addVitals > 0) {
                        context.pushNamed(JournalHomePageWidget.routeName);

                        Navigator.pop(context);
                      } else {
                        await action_blocks.doSubscription(
                          context,
                          parameterIds: FFAppState().planIds,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: wrapWithModel(
                      model: _model.menuCardModel6,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuCardWidget(
                        menuName: 'Journal',
                        menuIcon: Icon(
                          FFIcons.kjournal,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MENU_COMPONENT_Container_t2tkollm_ON_TAP');

                      context.pushNamed(AllConsultationHistoryWidget.routeName);

                      Navigator.pop(context);
                    },
                    child: wrapWithModel(
                      model: _model.menuCardModel7,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuCardWidget(
                        menuName: 'Consultation History',
                        menuIcon: Icon(
                          Icons.access_time_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MENU_COMPONENT_Container_qlopoil2_ON_TAP');

                      context.pushNamed(PlanDetailsWidget.routeName);

                      Navigator.pop(context);
                    },
                    child: wrapWithModel(
                      model: _model.menuCardModel8,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuCardWidget(
                        menuName: 'Subscriptions',
                        menuIcon: Icon(
                          FFIcons.ksubscribe,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MENU_COMPONENT_Container_wxwmc2mx_ON_TAP');

                      context.pushNamed(OrganDonationWidget.routeName);

                      Navigator.pop(context);
                    },
                    child: wrapWithModel(
                      model: _model.menuCardModel9,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuCardWidget(
                        menuName: 'Organ Donation',
                        menuIcon: Icon(
                          FFIcons.korgandonation,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MENU_COMPONENT_Container_3dggmae4_ON_TAP');

                      context.pushNamed(FaqPageWidget.routeName);

                      Navigator.pop(context);
                    },
                    child: wrapWithModel(
                      model: _model.menuCardModel10,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuCardWidget(
                        menuName: 'Frequently asked questions',
                        menuIcon: Icon(
                          FFIcons.klayer11,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MENU_COMPONENT_Container_81c6prm1_ON_TAP');

                      context.pushNamed(
                        ConsentScreenWidget.routeName,
                        queryParameters: {
                          'isFromMenu': serializeParam(
                            true,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );

                      Navigator.pop(context);
                    },
                    child: wrapWithModel(
                      model: _model.menuCardModel11,
                      updateCallback: () => safeSetState(() {}),
                      child: MenuCardWidget(
                        menuName: 'Consent',
                        menuIcon: Icon(
                          Icons.check_circle_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                  if (FFAppState().isSignOut)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MENU_COMPONENT_Container_8a4vf9hu_ON_TAP');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text(
                                      'Are you sure you want to delete your account? This action is irreversible, and all your data will be permanently removed.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          _model.apiResultb3s = await DeleteAccountCall.call(
                            baseUrl: FFAppState().baseUrl,
                            userId: FFAppState().userId,
                          );

                          if ((_model.apiResultb3s?.succeeded ?? true)) {
                            FFAppState().refreshToken = '';
                            FFAppState().userId = '';
                            safeSetState(() {});
                            await action_blocks.clearallquery(context);
                            _model.envresponses = await actions.getEnv();
                            if (isAndroid || isiOS) {
                              context.goNamed(
                                LoginWidget.routeName,
                                queryParameters: {
                                  'loginurl': serializeParam(
                                    _model.envresponses?.loginUrl,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              await actions.doLogOut();
                            }

                            Navigator.pop(context);
                          }
                        } else {
                          Navigator.pop(context);
                        }

                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel12,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuCardWidget(
                          menuName: 'Delete my account',
                          menuIcon: Icon(
                            Icons.delete_forever_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().isSignOut)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MENU_COMPONENT_Container_5wutygbp_ON_TAP');
                        _model.clearToken = await DeleteFcmTokenCall.call(
                          baseurl: FFAppState().baseUrl,
                          authToken: FFAppState().userId,
                        );

                        if ((_model.clearToken?.succeeded ?? true)) {
                          FFAppState().refreshToken = '';
                          FFAppState().userId = '';
                          FFAppState().mealList =
                              FoodTrackerStruct.fromSerializableMap(jsonDecode(
                                  '{\"meals\":\"[\\\"{\\\\\\\"mealType\\\\\\\":\\\\\\\"Breakfast\\\\\\\",\\\\\\\"mealTime\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"items\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\",\\\"{\\\\\\\"mealType\\\\\\\":\\\\\\\"Lunch\\\\\\\",\\\\\\\"mealTime\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"items\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\",\\\"{\\\\\\\"mealType\\\\\\\":\\\\\\\"Snacks\\\\\\\",\\\\\\\"mealTime\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"items\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\",\\\"{\\\\\\\"mealType\\\\\\\":\\\\\\\"Dinner\\\\\\\",\\\\\\\"mealTime\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"items\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\"]\"}'));
                          safeSetState(() {});
                          unawaited(
                            () async {
                              await actions.deregisterNotifications();
                            }(),
                          );
                          FFAppState().theme = ThemeConfigStruct(
                            primaryColor: FlutterFlowTheme.of(context).primary,
                            secondaryColor:
                                FlutterFlowTheme.of(context).secondary,
                          );
                          FFAppState().userDetails = ProfileModelStruct();
                          safeSetState(() {});
                          unawaited(
                            () async {
                              await action_blocks.clearallquery(context);
                            }(),
                          );
                          _model.envresponse = await actions.getEnv();
                          Navigator.pop(context);
                          if (isiOS || isAndroid) {
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              LoginWidget.routeName,
                              queryParameters: {
                                'loginurl': serializeParam(
                                  _model.envresponses?.loginUrl,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            await actions.doLogOut();
                          }
                        }

                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel13,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuCardWidget(
                          menuName: 'Sign Out',
                          menuIcon: Icon(
                            Icons.lock_clock,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                  if (!FFAppState().isSignOut)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MENU_COMPONENT_Container_6ix6g86x_ON_TAP');
                        FFAppState().refreshToken = '';
                        FFAppState().userId = '';
                        safeSetState(() {});
                        await actions.goBackHome();
                      },
                      child: wrapWithModel(
                        model: _model.menuCardModel14,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuCardWidget(
                          menuName: 'Go back to Home',
                          menuIcon: Icon(
                            Icons.home_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: Text(
                'Version 1.2.2',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ),
        ].addToEnd(SizedBox(height: 20.0)),
      ),
    );
  }
}
