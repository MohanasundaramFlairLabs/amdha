import '/components/micro_components/form_components/date_selection/date_selection_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'date_pick_widget.dart' show DatePickWidget;
import 'package:flutter/material.dart';

class DatePickModel extends FlutterFlowModel<DatePickWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for DateSelection component.
  late DateSelectionModel dateSelectionModel;

  @override
  void initState(BuildContext context) {
    dateSelectionModel = createModel(context, () => DateSelectionModel());
  }

  @override
  void dispose() {
    dateSelectionModel.dispose();
  }
}
