import '/components/consent/consent_box/consent_box_widget.dart';
import '/components/consent/note_box/note_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'consent_screen_widget.dart' show ConsentScreenWidget;
import 'package:flutter/material.dart';

class ConsentScreenModel extends FlutterFlowModel<ConsentScreenWidget> {
  ///  Local state fields for this page.

  bool? isAccepted = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NoteBox component.
  late NoteBoxModel noteBoxModel;
  // Model for ConsentBox component.
  late ConsentBoxModel consentBoxModel1;
  // Model for ConsentBox component.
  late ConsentBoxModel consentBoxModel2;

  @override
  void initState(BuildContext context) {
    noteBoxModel = createModel(context, () => NoteBoxModel());
    consentBoxModel1 = createModel(context, () => ConsentBoxModel());
    consentBoxModel2 = createModel(context, () => ConsentBoxModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    noteBoxModel.dispose();
    consentBoxModel1.dispose();
    consentBoxModel2.dispose();
  }
}
