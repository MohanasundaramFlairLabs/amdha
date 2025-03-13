import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/consent/consent_box/consent_box_widget.dart';
import '/pages/components/consent/note_box/note_box_widget.dart';
import '/index.dart';
import 'consent_screen_widget.dart' show ConsentScreenWidget;
import 'package:flutter/material.dart';

class ConsentScreenModel extends FlutterFlowModel<ConsentScreenWidget> {
  ///  Local state fields for this page.

  bool isCheckbox1Checked = true;

  bool isCheckbox2Checked = true;

  bool isCheckbox3Checked = false;

  ConsentModelStruct? consent;
  void updateConsentStruct(Function(ConsentModelStruct) updateFn) {
    updateFn(consent ??= ConsentModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetAmdhaConsent)] action in ConsentScreen widget.
  ApiCallResponse? apiResult3z3;
  // Model for NoteBox component.
  late NoteBoxModel noteBoxModel;
  // Model for ConsentBox component.
  late ConsentBoxModel consentBoxModel1;
  // Model for ConsentBox component.
  late ConsentBoxModel consentBoxModel2;
  // Model for ConsentBox component.
  late ConsentBoxModel consentBoxModel3;

  @override
  void initState(BuildContext context) {
    noteBoxModel = createModel(context, () => NoteBoxModel());
    consentBoxModel1 = createModel(context, () => ConsentBoxModel());
    consentBoxModel2 = createModel(context, () => ConsentBoxModel());
    consentBoxModel3 = createModel(context, () => ConsentBoxModel());
  }

  @override
  void dispose() {
    noteBoxModel.dispose();
    consentBoxModel1.dispose();
    consentBoxModel2.dispose();
    consentBoxModel3.dispose();
  }
}
