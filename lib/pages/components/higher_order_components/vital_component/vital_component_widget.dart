import '';
import '/components/add_vitals_component_widget.dart';
import '/components/vital_home_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/scan_form_two/scan_form_two_widget.dart';
import '/pages/components/higher_order_components/scan_posture_form_three/scan_posture_form_three_widget.dart';
import '/pages/components/micro_components/vitals_component/scan_results/scan_results_widget.dart';
import '/pages/components/scan_form/scan_form_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'vital_component_model.dart';
export 'vital_component_model.dart';

class VitalComponentWidget extends StatefulWidget {
  const VitalComponentWidget({
    super.key,
    required this.callback,
    required this.goHomeCallback,
    bool? doOpenScan,
    bool? isPP,
  })  : this.doOpenScan = doOpenScan ?? false,
        this.isPP = isPP ?? false;

  final Future Function(bool isHide)? callback;
  final Future Function()? goHomeCallback;
  final bool doOpenScan;
  final bool isPP;

  @override
  State<VitalComponentWidget> createState() => _VitalComponentWidgetState();
}

class _VitalComponentWidgetState extends State<VitalComponentWidget> {
  late VitalComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VitalComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VITAL_COMPONENT_VitalComponent_ON_INIT_S');
      _model.isFirstChild = !widget.doOpenScan;
      _model.isScanPage = widget.doOpenScan;
      _model.isEdit = false;
      _model.isFromHomePage = widget.doOpenScan;
      safeSetState(() {});
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

    return Stack(
      children: [
        if (_model.isFirstChild == true)
          wrapWithModel(
            model: _model.vitalHomeComponentModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: VitalHomeComponentWidget(
              isScanResult: false,
              isPP: widget.isPP,
              callback: (isScanVital, iSAddVital) async {
                logFirebaseEvent('VITAL_COMPONENT_Container_p6lzu0tf_CALLB');
                if (isScanVital!) {
                  _model.isFirstChild = false;
                  _model.isScanPage = true;
                  _model.isEdit = false;
                  _model.isHideNavBar = true;
                  safeSetState(() {});
                  await widget.callback?.call(
                    _model.isHideNavBar,
                  );
                } else {
                  if (iSAddVital!) {
                    _model.isFirstChild = false;
                    _model.isSecondChild = true;
                    _model.isEdit = false;
                    _model.isHideNavBar = true;
                    _model.updatePage(() {});
                    await widget.callback?.call(
                      _model.isHideNavBar,
                    );
                  }
                }
              },
              editCallback: (vitalToEdit) async {
                logFirebaseEvent('VITAL_COMPONENT_Container_p6lzu0tf_CALLB');
                _model.selectedVital = null;
                safeSetState(() {});
                _model.selectedVital = vitalToEdit;
                _model.updatePage(() {});
                _model.isEdit = true;
                _model.isFirstChild = false;
                _model.isSecondChild = true;
                _model.updatePage(() {});
                await widget.callback?.call(
                  true,
                );
              },
            ),
          ),
        if (_model.isSecondChild == true)
          wrapWithModel(
            model: _model.addVitalsComponentModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: AddVitalsComponentWidget(
              isEdit: _model.isEdit,
              vitalToEdit: _model.selectedVital,
              dateTime: _model.isEdit!
                  ? functions.convertStringToDate(_model.selectedVital!.date)
                  : getCurrentTimestamp,
              isAddFromGoal: false,
              isTask: false,
              isPP: widget.isPP,
              callback: (isNewVItalAdded, vitalName) async {
                logFirebaseEvent('VITAL_COMPONENT_Container_rb66xjfd_CALLB');
                if (isNewVItalAdded) {
                  FFAppState().clearFetchVitlHistoryQueryCache();

                  context.pushNamed(
                    SetgoalWidget.routeName,
                    queryParameters: {
                      'vitalName': serializeParam(
                        vitalName,
                        ParamType.String,
                      ),
                      'isFromGoal': serializeParam(
                        false,
                        ParamType.bool,
                      ),
                    }.withoutNulls,
                  );
                }
                _model.isFirstChild = true;
                _model.isSecondChild = false;
                _model.updatePage(() {});
                await widget.callback?.call(
                  false,
                );
              },
              successCallbackToTask: () async {},
              bgCallback: () async {
                logFirebaseEvent('VITAL_COMPONENT_Container_rb66xjfd_CALLB');
                _model.isFirstChild = true;
                _model.isSecondChild = false;
                safeSetState(() {});
                await widget.callback?.call(
                  false,
                );
              },
            ),
          ),
        if (_model.isScanPage == true)
          wrapWithModel(
            model: _model.scanFormModel,
            updateCallback: () => safeSetState(() {}),
            child: ScanFormWidget(
              callbackScanForm: (dob, height, weight, gender) async {
                logFirebaseEvent('VITAL_COMPONENT_Container_1fi2pm8l_CALLB');
                _model.dob = dob;
                _model.height = height;
                _model.weight = weight;
                _model.gender = gender;
                _model.isScanPage = false;
                _model.isScanSecondPage = true;
                safeSetState(() {});
              },
              backCallback: () async {
                logFirebaseEvent('VITAL_COMPONENT_Container_1fi2pm8l_CALLB');
                if (_model.isFromHomePage) {
                  await widget.goHomeCallback?.call();
                  _model.isFromHomePage = false;
                  safeSetState(() {});
                } else {
                  _model.isFirstChild = true;
                  _model.isScanPage = false;
                  _model.isHideNavBar = false;
                  _model.updatePage(() {});
                  await widget.callback?.call(
                    false,
                  );
                }
              },
            ),
          ),
        if (_model.isScanSecondPage == true)
          wrapWithModel(
            model: _model.scanFormTwoModel,
            updateCallback: () => safeSetState(() {}),
            child: ScanFormTwoWidget(
              isFingerScan: (_model.scanType == 'Finger Scan') ||
                  (_model.scanType == 'finger'),
              callbackScanFormTwo: (scanType) async {
                logFirebaseEvent('VITAL_COMPONENT_Container_z1sb6zyq_CALLB');
                _model.isScanThirdPage = true;
                _model.isScanSecondPage = false;
                _model.scanType = scanType;
                safeSetState(() {});
              },
              backCallbackFromTwo: () async {
                logFirebaseEvent('VITAL_COMPONENT_Container_z1sb6zyq_CALLB');
                _model.isScanPage = true;
                _model.isScanSecondPage = false;
                _model.updatePage(() {});
              },
            ),
          ),
        if (_model.isScanThirdPage == true)
          wrapWithModel(
            model: _model.scanPostureFormThreeModel,
            updateCallback: () => safeSetState(() {}),
            child: ScanPostureFormThreeWidget(
              isFingerScan: _model.scanType == 'Finger Scan' ? true : false,
              callbackScanFormThree: (posture) async {
                logFirebaseEvent('VITAL_COMPONENT_Container_ouh49gfh_CALLB');
                _model.posture = posture;
                safeSetState(() {});
                _model.posture = () {
                  if (_model.posture == 'Resting') {
                    return 'resting';
                  } else if (_model.posture == 'Standing') {
                    return 'standing';
                  } else if (_model.posture == 'After Walking') {
                    return 'walking';
                  } else {
                    return 'exercising';
                  }
                }();
                _model.scanType =
                    _model.scanType == 'Finger Scan' ? 'finger' : 'face';
                _model.updatePage(() {});
                if (isWeb) {
                  await actions.openUrl(
                    '${functions.getUri()}/views/careplix.html?scantype=${_model.scanType}&platform=web&posture=${_model.posture}&dob=${dateTimeFormat(
                      "y-M-d",
                      _model.dob,
                      locale: FFLocalizations.of(context).languageCode,
                    )}&weight=${_model.weight?.toString()}&height=${_model.height?.toString()}&gender=${_model.gender}&redirect_uri=${functions.getUri()}/scanResult&freescan=${FFAppState().isFreeScanAvailable.toString()}&retry_uri=${functions.getUri()}/homePage?index=${FFAppState().quotas.quotas.careplixScan > 0 ? '4' : '0'}',
                  );
                } else {
                  await requestPermission(cameraPermission);
                  if (await getPermissionStatus(cameraPermission)) {
                    _model.isWebView = true;
                    _model.isScanThirdPage = false;
                    _model.updatePage(() {});
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title:
                              Text('Cannot proceed without camera permission.'),
                          content: Text(
                              'Allow camera from your settings and do proceed'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
              backCallbackFromThree: () async {
                logFirebaseEvent('VITAL_COMPONENT_Container_ouh49gfh_CALLB');
                _model.isScanSecondPage = true;
                _model.isScanThirdPage = false;
                safeSetState(() {});
              },
            ),
          ),
        if (_model.scanResults == true)
          wrapWithModel(
            model: _model.scanResultsModel,
            updateCallback: () => safeSetState(() {}),
            child: ScanResultsWidget(
              vitals: _model.scannedVitals,
              goHomeCallBack: () async {
                logFirebaseEvent('VITAL_COMPONENT_Container_8q07pm6e_CALLB');
                await widget.goHomeCallback?.call();
                _model.isWebView = false;
                _model.isFirstChild = true;
                safeSetState(() {});
              },
            ),
          ),
        if (_model.isWebView == true)
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.96,
            child: custom_widgets.CustomWebView(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.96,
              scanType: _model.scanType,
              userWeight: _model.weight?.toDouble(),
              userHeight: _model.height?.toDouble(),
              dob: dateTimeFormat(
                "y-M-d",
                _model.dob,
                locale: FFLocalizations.of(context).languageCode,
              ),
              posture: _model.posture,
              gender: _model.gender,
              userId: FFAppState().userId,
              freeScan: FFAppState().isFreeScanAvailable,
              successCallback: () async {
                logFirebaseEvent('VITAL_COMPONENT_Container_az971q3q_CALLB');

                context.goNamed(ScanResultWidget.routeName);

                _model.isWebView = false;
                _model.isFirstChild = true;
                safeSetState(() {});
              },
              errorCallback: () async {
                logFirebaseEvent('VITAL_COMPONENT_Container_az971q3q_CALLB');
                _model.isFirstChild = true;
                _model.isWebView = false;
                safeSetState(() {});
                await widget.callback?.call(
                  false,
                );
                await widget.goHomeCallback?.call();
              },
            ),
          ),
      ],
    );
  }
}
