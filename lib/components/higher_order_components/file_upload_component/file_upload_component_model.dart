import '/components/micro_components/medication_components/drop_down_field/drop_down_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'file_upload_component_widget.dart' show FileUploadComponentWidget;
import 'package:flutter/material.dart';

class FileUploadComponentModel
    extends FlutterFlowModel<FileUploadComponentWidget> {
  ///  Local state fields for this component.

  bool? isFileSelected;

  List<FFUploadedFile> files = [];
  void addToFiles(FFUploadedFile item) => files.add(item);
  void removeFromFiles(FFUploadedFile item) => files.remove(item);
  void removeAtIndexFromFiles(int index) => files.removeAt(index);
  void insertAtIndexInFiles(int index, FFUploadedFile item) =>
      files.insert(index, item);
  void updateFilesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      files[index] = updateFn(files[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for DropDownField component.
  late DropDownFieldModel dropDownFieldModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {
    dropDownFieldModel = createModel(context, () => DropDownFieldModel());
  }

  @override
  void dispose() {
    dropDownFieldModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
