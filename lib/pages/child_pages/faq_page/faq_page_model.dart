import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/faq_container/faq_container_widget.dart';
import 'faq_page_widget.dart' show FaqPageWidget;
import 'package:flutter/material.dart';

class FaqPageModel extends FlutterFlowModel<FaqPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for faqContainer component.
  late FaqContainerModel faqContainerModel;

  @override
  void initState(BuildContext context) {
    faqContainerModel = createModel(context, () => FaqContainerModel());
  }

  @override
  void dispose() {
    faqContainerModel.dispose();
  }
}
