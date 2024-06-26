import '/flutter_flow/flutter_flow_util.dart';
import '/pages/intro_screens/welcome_content/welcome_content_widget.dart';
import 'welcome_component_widget.dart' show WelcomeComponentWidget;
import 'package:flutter/material.dart';

class WelcomeComponentModel extends FlutterFlowModel<WelcomeComponentWidget> {
  ///  Local state fields for this page.

  bool toggle = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for WelcomeContent component.
  late WelcomeContentModel welcomeContentModel;

  @override
  void initState(BuildContext context) {
    welcomeContentModel = createModel(context, () => WelcomeContentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    welcomeContentModel.dispose();
  }
}
