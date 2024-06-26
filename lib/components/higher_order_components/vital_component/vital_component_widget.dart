import '/components/add_vitals_component_widget.dart';
import '/components/higher_order_components/scan_form/scan_form_widget.dart';
import '/components/higher_order_components/scan_form_two/scan_form_two_widget.dart';
import '/components/micro_components/add_vitals_action_sheet/add_vitals_action_sheet_widget.dart';
import '/components/micro_components/vitals_component/scan_results/scan_results_widget.dart';
import '/components/vital_home_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'vital_component_model.dart';
export 'vital_component_model.dart';

class VitalComponentWidget extends StatefulWidget {
  const VitalComponentWidget({super.key});

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
      _model.isFirstChild = true;
      _model.isScanPage = false;
      _model.isEdit = false;
      setState(() {});
      await requestPermission(cameraPermission);
      await requestPermission(microphonePermission);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_model.isFirstChild == true)
          wrapWithModel(
            model: _model.vitalHomeComponentModel,
            updateCallback: () => setState(() {}),
            child: VitalHomeComponentWidget(
              callback: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: AddVitalsActionSheetWidget(
                        title1: 'Add Vitals',
                        title2: 'Scan Vitals',
                        callbackActionTwo: () async {
                          _model.isFirstChild = false;
                          _model.isScanPage = true;
                          setState(() {});
                        },
                        callbackActionOne: () async {
                          _model.isFirstChild = false;
                          _model.isSecondChild = true;
                          setState(() {});
                        },
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              editCallback: (vitalToEdit) async {
                _model.isEdit = true;
                _model.isFirstChild = false;
                _model.isSecondChild = true;
                setState(() {});
              },
            ),
          ),
        if (_model.isSecondChild == true)
          wrapWithModel(
            model: _model.addVitalsComponentModel,
            updateCallback: () => setState(() {}),
            child: AddVitalsComponentWidget(
              isEdit: _model.isEdit,
              vitalToEdit: _model.selectedVital,
              callback: () async {
                _model.isFirstChild = true;
                _model.isSecondChild = false;
                _model.updatePage(() {});
              },
            ),
          ),
        if (_model.isScanPage == true)
          wrapWithModel(
            model: _model.scanFormModel,
            updateCallback: () => setState(() {}),
            child: ScanFormWidget(
              callbackScanForm: (dob, height, weight, gender) async {
                _model.dob = dob;
                _model.height = height;
                _model.weight = weight;
                _model.gender = gender;
                _model.isScanPage = false;
                _model.isScanSecondPage = true;
                setState(() {});
              },
              backCallback: () async {
                _model.isFirstChild = true;
                _model.isScanPage = false;
                setState(() {});
              },
            ),
          ),
        if (_model.isScanSecondPage == true)
          wrapWithModel(
            model: _model.scanFormTwoModel,
            updateCallback: () => setState(() {}),
            child: ScanFormTwoWidget(
              callbackScanFormTwo: (posture, scanType) async {
                _model.posture = posture;
                _model.scanType = scanType;
                _model.isScanSecondPage = false;
                _model.isWebView = true;
                setState(() {});
              },
            ),
          ),
        if (_model.scanResults == true)
          wrapWithModel(
            model: _model.scanResultsModel,
            updateCallback: () => setState(() {}),
            child: ScanResultsWidget(
              vitals: _model.scannedVitals,
            ),
          ),
      ],
    );
  }
}
