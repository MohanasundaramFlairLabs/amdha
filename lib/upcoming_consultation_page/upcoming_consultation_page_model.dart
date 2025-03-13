import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/connections_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/index.dart';
import 'upcoming_consultation_page_widget.dart'
    show UpcomingConsultationPageWidget;
import 'package:flutter/material.dart';

class UpcomingConsultationPageModel
    extends FlutterFlowModel<UpcomingConsultationPageWidget> {
  ///  Local state fields for this page.

  bool firstPage = false;

  bool secondPage = false;

  List<ConnectionsModelStruct> connections = [];
  void addToConnections(ConnectionsModelStruct item) => connections.add(item);
  void removeFromConnections(ConnectionsModelStruct item) =>
      connections.remove(item);
  void removeAtIndexFromConnections(int index) => connections.removeAt(index);
  void insertAtIndexInConnections(int index, ConnectionsModelStruct item) =>
      connections.insert(index, item);
  void updateConnectionsAtIndex(
          int index, Function(ConnectionsModelStruct) updateFn) =>
      connections[index] = updateFn(connections[index]);

  ConnectionsModelStruct? selectedConnection;
  void updateSelectedConnectionStruct(
      Function(ConnectionsModelStruct) updateFn) {
    updateFn(selectedConnection ??= ConnectionsModelStruct());
  }

  bool isDataFetched = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetUpcomingConnections)] action in UpcomingConsultationPage widget.
  ApiCallResponse? upcomingApi;
  // Stores action output result for [Backend Call - API (GetSettings)] action in UpcomingConsultationPage widget.
  ApiCallResponse? settings;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (CancelConsultation)] action in Upcoming widget.
  ApiCallResponse? apiResult43i;
  // Stores action output result for [Backend Call - API (ConnectVideoCall)] action in Upcoming widget.
  ApiCallResponse? apiResultmka1;
  // Model for NoDataComponent component.
  late NoDataComponentModel noDataComponentModel;
  // Stores action output result for [Backend Call - API (CancelConsultation)] action in Missed widget.
  ApiCallResponse? apiResult422;
  // Stores action output result for [Backend Call - API (ConnectVideoCall)] action in Missed widget.
  ApiCallResponse? videocallapi;
  // Model for ConnectionsComponent component.
  late ConnectionsComponentModel connectionsComponentModel;
  // Stores action output result for [Backend Call - API (GetUpcomingConnections)] action in ConnectionsComponent widget.
  ApiCallResponse? apiResultw1s;

  @override
  void initState(BuildContext context) {
    noDataComponentModel = createModel(context, () => NoDataComponentModel());
    connectionsComponentModel =
        createModel(context, () => ConnectionsComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    noDataComponentModel.dispose();
    connectionsComponentModel.dispose();
  }
}
