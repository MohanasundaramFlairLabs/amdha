import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'o_c_r_result_page_widget.dart' show OCRResultPageWidget;
import 'package:flutter/material.dart';

class OCRResultPageModel extends FlutterFlowModel<OCRResultPageWidget> {
  ///  Local state fields for this page.

  OcrResultStruct? resultQueries;
  void updateResultQueriesStruct(Function(OcrResultStruct) updateFn) {
    updateFn(resultQueries ??= OcrResultStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (OCRResult)] action in OCRResultPage widget.
  ApiCallResponse? apiResultzu0;
  // Stores action output result for [Backend Call - API (SubmitOCRResult)] action in Button widget.
  ApiCallResponse? apiResult7ha;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
