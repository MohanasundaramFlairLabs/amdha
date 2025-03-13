import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_consultation_history_widget.dart' show AllConsultationHistoryWidget;
import 'package:flutter/material.dart';

class AllConsultationHistoryModel
    extends FlutterFlowModel<AllConsultationHistoryWidget> {
  ///  Local state fields for this page.

  List<HistoryModelStruct> historyList = [];
  void addToHistoryList(HistoryModelStruct item) => historyList.add(item);
  void removeFromHistoryList(HistoryModelStruct item) =>
      historyList.remove(item);
  void removeAtIndexFromHistoryList(int index) => historyList.removeAt(index);
  void insertAtIndexInHistoryList(int index, HistoryModelStruct item) =>
      historyList.insert(index, item);
  void updateHistoryListAtIndex(
          int index, Function(HistoryModelStruct) updateFn) =>
      historyList[index] = updateFn(historyList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetAllConsultationHistory)] action in AllConsultationHistory widget.
  ApiCallResponse? apiResult7e3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
