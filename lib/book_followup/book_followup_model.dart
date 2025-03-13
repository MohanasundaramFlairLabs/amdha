import '/components/connections_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_followup_widget.dart' show BookFollowupWidget;
import 'package:flutter/material.dart';

class BookFollowupModel extends FlutterFlowModel<BookFollowupWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ConnectionsComponent component.
  late ConnectionsComponentModel connectionsComponentModel;

  @override
  void initState(BuildContext context) {
    connectionsComponentModel =
        createModel(context, () => ConnectionsComponentModel());
  }

  @override
  void dispose() {
    connectionsComponentModel.dispose();
  }
}
