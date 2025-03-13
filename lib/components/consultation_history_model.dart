import '/components/doctor_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'consultation_history_widget.dart' show ConsultationHistoryWidget;
import 'package:flutter/material.dart';

class ConsultationHistoryModel
    extends FlutterFlowModel<ConsultationHistoryWidget> {
  ///  Local state fields for this component.

  int selectedIndex = 0;

  ///  State fields for stateful widgets in this component.

  // Model for DoctorCard component.
  late DoctorCardModel doctorCardModel;

  @override
  void initState(BuildContext context) {
    doctorCardModel = createModel(context, () => DoctorCardModel());
  }

  @override
  void dispose() {
    doctorCardModel.dispose();
  }
}
