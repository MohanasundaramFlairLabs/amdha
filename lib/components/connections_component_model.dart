import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/book_consultation_component_widget.dart';
import '/components/booking_confirmation_component_widget.dart';
import '/components/consultation_history_widget.dart';
import '/components/doctor_profile_component_widget.dart';
import '/components/doctors_list_component_widget.dart';
import '/components/survey_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'connections_component_widget.dart' show ConnectionsComponentWidget;
import 'package:flutter/material.dart';

class ConnectionsComponentModel
    extends FlutterFlowModel<ConnectionsComponentWidget> {
  ///  Local state fields for this component.

  bool firstPage = false;

  bool secondPage = false;

  bool thirdPage = false;

  bool fourPage = false;

  bool fivePage = false;

  DoctorModelStruct? doctor;
  void updateDoctorStruct(Function(DoctorModelStruct) updateFn) {
    updateFn(doctor ??= DoctorModelStruct());
  }

  SlotsStruct? slot;
  void updateSlotStruct(Function(SlotsStruct) updateFn) {
    updateFn(slot ??= SlotsStruct());
  }

  bool consentStatus = false;

  bool newConsentStatus = false;

  String? consultationType;

  bool sixPage = false;

  CaseSheetModelStruct? history;
  void updateHistoryStruct(Function(CaseSheetModelStruct) updateFn) {
    updateFn(history ??= CaseSheetModelStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Model for DoctorsListComponent component.
  late DoctorsListComponentModel doctorsListComponentModel;
  // Model for DoctorProfileComponent component.
  late DoctorProfileComponentModel doctorProfileComponentModel;
  // Stores action output result for [Backend Call - API (GetConsent)] action in DoctorProfileComponent widget.
  ApiCallResponse? consentResponse;
  // Model for BookConsultationComponent component.
  late BookConsultationComponentModel bookConsultationComponentModel;
  // Stores action output result for [Backend Call - API (RescheduleConsult)] action in BookConsultationComponent widget.
  ApiCallResponse? apiResult35u;
  // Model for SurveyComponent component.
  late SurveyComponentModel surveyComponentModel;
  // Stores action output result for [Backend Call - API (BookConsult)] action in SurveyComponent widget.
  ApiCallResponse? apiResultrcy;
  // Stores action output result for [Backend Call - API (SubmitConsent)] action in SurveyComponent widget.
  ApiCallResponse? apiResulttto;
  // Stores action output result for [Backend Call - API (SubmitSurvey)] action in SurveyComponent widget.
  ApiCallResponse? apiResultoxa;
  // Model for BookingConfirmationComponent component.
  late BookingConfirmationComponentModel bookingConfirmationComponentModel;
  // Stores action output result for [Backend Call - API (Submittask)] action in BookingConfirmationComponent widget.
  ApiCallResponse? apiResultc3s;
  // Model for ConsultationHistory component.
  late ConsultationHistoryModel consultationHistoryModel;

  @override
  void initState(BuildContext context) {
    doctorsListComponentModel =
        createModel(context, () => DoctorsListComponentModel());
    doctorProfileComponentModel =
        createModel(context, () => DoctorProfileComponentModel());
    bookConsultationComponentModel =
        createModel(context, () => BookConsultationComponentModel());
    surveyComponentModel = createModel(context, () => SurveyComponentModel());
    bookingConfirmationComponentModel =
        createModel(context, () => BookingConfirmationComponentModel());
    consultationHistoryModel =
        createModel(context, () => ConsultationHistoryModel());
  }

  @override
  void dispose() {
    doctorsListComponentModel.dispose();
    doctorProfileComponentModel.dispose();
    bookConsultationComponentModel.dispose();
    surveyComponentModel.dispose();
    bookingConfirmationComponentModel.dispose();
    consultationHistoryModel.dispose();
  }
}
