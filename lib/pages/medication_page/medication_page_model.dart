import '/flutter_flow/flutter_flow_util.dart';
import 'medication_page_widget.dart' show MedicationPageWidget;
import 'package:flutter/material.dart';

class MedicationPageModel extends FlutterFlowModel<MedicationPageWidget> {
  ///  Local state fields for this page.

  String compo = 'medical';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
