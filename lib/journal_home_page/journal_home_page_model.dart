import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/journal_component/journal_component_widget.dart';
import 'journal_home_page_widget.dart' show JournalHomePageWidget;
import 'package:flutter/material.dart';

class JournalHomePageModel extends FlutterFlowModel<JournalHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for JournalComponent component.
  late JournalComponentModel journalComponentModel;

  @override
  void initState(BuildContext context) {
    journalComponentModel = createModel(context, () => JournalComponentModel());
  }

  @override
  void dispose() {
    journalComponentModel.dispose();
  }
}
