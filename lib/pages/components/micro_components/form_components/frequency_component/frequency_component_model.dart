import '/flutter_flow/flutter_flow_util.dart';
import 'frequency_component_widget.dart' show FrequencyComponentWidget;
import 'package:flutter/material.dart';

class FrequencyComponentModel
    extends FlutterFlowModel<FrequencyComponentWidget> {
  ///  Local state fields for this component.

  List<String> selectedFrequency = [];
  void addToSelectedFrequency(String item) => selectedFrequency.add(item);
  void removeFromSelectedFrequency(String item) =>
      selectedFrequency.remove(item);
  void removeAtIndexFromSelectedFrequency(int index) =>
      selectedFrequency.removeAt(index);
  void insertAtIndexInSelectedFrequency(int index, String item) =>
      selectedFrequency.insert(index, item);
  void updateSelectedFrequencyAtIndex(int index, Function(String) updateFn) =>
      selectedFrequency[index] = updateFn(selectedFrequency[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
