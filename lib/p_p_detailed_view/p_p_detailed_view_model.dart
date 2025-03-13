import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pregnancy_program/stages_card/stages_card_widget.dart';
import '/index.dart';
import 'p_p_detailed_view_widget.dart' show PPDetailedViewWidget;
import 'package:flutter/material.dart';

class PPDetailedViewModel extends FlutterFlowModel<PPDetailedViewWidget> {
  ///  Local state fields for this page.

  ProgramsStruct? program;
  void updateProgramStruct(Function(ProgramsStruct) updateFn) {
    updateFn(program ??= ProgramsStruct());
  }

  int? week;

  EducationModelStruct? education;
  void updateEducationStruct(Function(EducationModelStruct) updateFn) {
    updateFn(education ??= EducationModelStruct());
  }

  bool isApiSuccess = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetEducation)] action in PPDetailedView widget.
  ApiCallResponse? apiResultypp;
  // Stores action output result for [Backend Call - API (GetProgram)] action in IconButton widget.
  ApiCallResponse? programresp;
  // Stores action output result for [Backend Call - API (GetProgram)] action in IconButton widget.
  ApiCallResponse? programresponse;
  // Model for StagesCard component.
  late StagesCardModel stagesCardModel;
  // Stores action output result for [Backend Call - API (GetMediaUri)] action in Container widget.
  ApiCallResponse? apiResultwtj;

  @override
  void initState(BuildContext context) {
    stagesCardModel = createModel(context, () => StagesCardModel());
  }

  @override
  void dispose() {
    stagesCardModel.dispose();
  }
}
