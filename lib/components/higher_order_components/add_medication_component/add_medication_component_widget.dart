import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'add_medication_component_model.dart';
export 'add_medication_component_model.dart';

class AddMedicationComponentWidget extends StatefulWidget {
  const AddMedicationComponentWidget({
    super.key,
    this.medication,
    required this.callbackAddMedication,
  });

  final MedicationListStruct? medication;
  final Future Function()? callbackAddMedication;

  @override
  State<AddMedicationComponentWidget> createState() =>
      _AddMedicationComponentWidgetState();
}

class _AddMedicationComponentWidgetState
    extends State<AddMedicationComponentWidget> {
  late AddMedicationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddMedicationComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
