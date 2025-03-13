import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/file_upload_component/file_upload_component_widget.dart';
import '/pages/components/higher_order_components/list_file_component/list_file_component_widget.dart';
import '/index.dart';
import 'file_upload_page_widget.dart' show FileUploadPageWidget;
import 'package:flutter/material.dart';

class FileUploadPageModel extends FlutterFlowModel<FileUploadPageWidget> {
  ///  Local state fields for this page.

  bool isFirstChild = true;

  bool isSecondChild = true;

  ///  State fields for stateful widgets in this page.

  // Model for ListFileComponent component.
  late ListFileComponentModel listFileComponentModel;
  // Model for FileUploadComponent component.
  late FileUploadComponentModel fileUploadComponentModel;

  @override
  void initState(BuildContext context) {
    listFileComponentModel =
        createModel(context, () => ListFileComponentModel());
    fileUploadComponentModel =
        createModel(context, () => FileUploadComponentModel());
  }

  @override
  void dispose() {
    listFileComponentModel.dispose();
    fileUploadComponentModel.dispose();
  }
}
