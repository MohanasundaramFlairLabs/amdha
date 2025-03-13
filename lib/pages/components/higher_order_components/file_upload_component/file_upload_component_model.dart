import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'file_upload_component_widget.dart' show FileUploadComponentWidget;
import 'package:flutter/material.dart';

class FileUploadComponentModel
    extends FlutterFlowModel<FileUploadComponentWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? file;

  bool? isFileSelected;

  String fileName = 'name';

  bool permissionGranted = false;

  DateTime? dou;

  String? selectedCategory;

  List<String> documentType = [];
  void addToDocumentType(String item) => documentType.add(item);
  void removeFromDocumentType(String item) => documentType.remove(item);
  void removeAtIndexFromDocumentType(int index) => documentType.removeAt(index);
  void insertAtIndexInDocumentType(int index, String item) =>
      documentType.insert(index, item);
  void updateDocumentTypeAtIndex(int index, Function(String) updateFn) =>
      documentType[index] = updateFn(documentType[index]);

  String? selectedDocument;

  List<ReportCategoryStruct> allCategoryList = [];
  void addToAllCategoryList(ReportCategoryStruct item) =>
      allCategoryList.add(item);
  void removeFromAllCategoryList(ReportCategoryStruct item) =>
      allCategoryList.remove(item);
  void removeAtIndexFromAllCategoryList(int index) =>
      allCategoryList.removeAt(index);
  void insertAtIndexInAllCategoryList(int index, ReportCategoryStruct item) =>
      allCategoryList.insert(index, item);
  void updateAllCategoryListAtIndex(
          int index, Function(ReportCategoryStruct) updateFn) =>
      allCategoryList[index] = updateFn(allCategoryList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GetReportType)] action in FileUploadComponent widget.
  ApiCallResponse? reportsResponse;
  // State field(s) for CategoryDropDown widget.
  String? categoryDropDownValue;
  FormFieldController<String>? categoryDropDownValueController;
  // State field(s) for DocumentDropDown widget.
  String? documentDropDownValue;
  FormFieldController<String>? documentDropDownValueController;
  DateTime? datePicked;
  // State field(s) for Notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validated;
  // Stores action output result for [Backend Call - API (fileUpload)] action in Button widget.
  ApiCallResponse? apiResultqs3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }
}
