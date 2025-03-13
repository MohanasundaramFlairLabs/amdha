import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/add_medication_component/add_medication_component_widget.dart';
import 'package:flutter/material.dart';
import 'edit_medication_model.dart';
export 'edit_medication_model.dart';

class EditMedicationWidget extends StatefulWidget {
  const EditMedicationWidget({
    super.key,
    this.medication,
  });

  final MedicationModelStruct? medication;

  static String routeName = 'EditMedication';
  static String routePath = '/editMedication';

  @override
  State<EditMedicationWidget> createState() => _EditMedicationWidgetState();
}

class _EditMedicationWidgetState extends State<EditMedicationWidget> {
  late EditMedicationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditMedicationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            model: _model.addMedicationComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: AddMedicationComponentWidget(
              isEdit: true,
              medication: widget.medication,
              isUpcoming: true,
              callbackAddMedication: () async {},
            ),
          ),
        ),
      ),
    );
  }
}
