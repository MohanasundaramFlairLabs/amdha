import '/components/micro_components/list_of_files/list_of_files_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_file_component_widget.dart' show ListFileComponentWidget;
import 'package:flutter/material.dart';

class ListFileComponentModel extends FlutterFlowModel<ListFileComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for ListOfFiles component.
  late ListOfFilesModel listOfFilesModel;

  @override
  void initState(BuildContext context) {
    listOfFilesModel = createModel(context, () => ListOfFilesModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listOfFilesModel.dispose();
  }
}
