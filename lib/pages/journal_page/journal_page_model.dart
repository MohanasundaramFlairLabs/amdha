import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/journal_edit_component/journal_edit_component_widget.dart';
import 'journal_page_widget.dart' show JournalPageWidget;
import 'package:flutter/material.dart';

class JournalPageModel extends FlutterFlowModel<JournalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for JournalEditComponent component.
  late JournalEditComponentModel journalEditComponentModel;

  @override
  void initState(BuildContext context) {
    journalEditComponentModel =
        createModel(context, () => JournalEditComponentModel());
  }

  @override
  void dispose() {
    journalEditComponentModel.dispose();
  }
}
