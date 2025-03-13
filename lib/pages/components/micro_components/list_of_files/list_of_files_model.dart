import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/micro_components/option_component/option_component_widget.dart';
import 'list_of_files_widget.dart' show ListOfFilesWidget;
import 'package:flutter/material.dart';

class ListOfFilesModel extends FlutterFlowModel<ListOfFilesWidget> {
  ///  Local state fields for this component.

  bool isOption = false;

  ///  State fields for stateful widgets in this component.

  // Model for OptionComponent component.
  late OptionComponentModel optionComponentModel;

  @override
  void initState(BuildContext context) {
    optionComponentModel = createModel(context, () => OptionComponentModel());
  }

  @override
  void dispose() {
    optionComponentModel.dispose();
  }
}
