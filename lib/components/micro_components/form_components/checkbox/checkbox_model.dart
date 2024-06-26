import '/flutter_flow/flutter_flow_util.dart';
import 'checkbox_widget.dart' show CheckboxWidget;
import 'package:flutter/material.dart';

class CheckboxModel extends FlutterFlowModel<CheckboxWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<String, bool> checkboxValueMap = {};
  List<String> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
