import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/micro_components/medication_components/drop_down_field/drop_down_field_widget.dart';
import '/index.dart';
import 'additional_details_screen_widget.dart'
    show AdditionalDetailsScreenWidget;
import 'package:flutter/material.dart';

class AdditionalDetailsScreenModel
    extends FlutterFlowModel<AdditionalDetailsScreenWidget> {
  ///  Local state fields for this page.

  DateTime? dob;

  int age = 0;

  String? gender;

  String? phonenumber;

  String? bloodGroup;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GetUser)] action in AdditionalDetailsScreen widget.
  ApiCallResponse? userResponse;
  DateTime? datePicked;
  // State field(s) for GenderDropdown widget.
  String? genderDropdownValue;
  FormFieldController<String>? genderDropdownValueController;
  // Model for BloodGroup.
  late DropDownFieldModel bloodGroupModel;
  // State field(s) for HeightValue widget.
  FocusNode? heightValueFocusNode;
  TextEditingController? heightValueTextController;
  String? Function(BuildContext, String?)? heightValueTextControllerValidator;
  String? _heightValueTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Height is required';
    }

    return null;
  }

  // State field(s) for WeightValue widget.
  FocusNode? weightValueFocusNode;
  TextEditingController? weightValueTextController;
  String? Function(BuildContext, String?)? weightValueTextControllerValidator;
  String? _weightValueTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Weight is required';
    }

    return null;
  }

  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Mobile number is required';
    }

    if (val.length < 10) {
      return 'Mobile number should be 10 digit';
    }
    if (val.length > 10) {
      return 'Enter valid mobile number';
    }

    return null;
  }

  // State field(s) for AadharNumber widget.
  FocusNode? aadharNumberFocusNode;
  TextEditingController? aadharNumberTextController;
  String? Function(BuildContext, String?)? aadharNumberTextControllerValidator;
  // State field(s) for AbhaID widget.
  FocusNode? abhaIDFocusNode;
  TextEditingController? abhaIDTextController;
  String? Function(BuildContext, String?)? abhaIDTextControllerValidator;
  // Stores action output result for [Backend Call - API (Createprofile)] action in Button widget.
  ApiCallResponse? createUserResponse;
  // Stores action output result for [Backend Call - API (RefreshTokenApi)] action in Button widget.
  ApiCallResponse? apiResultyjr;
  // Stores action output result for [Backend Call - API (DeleteFcmToken)] action in Button widget.
  ApiCallResponse? clearToken;
  // Stores action output result for [Custom Action - getEnv] action in Button widget.
  UrlsStruct? envresponse;

  @override
  void initState(BuildContext context) {
    bloodGroupModel = createModel(context, () => DropDownFieldModel());
    heightValueTextControllerValidator = _heightValueTextControllerValidator;
    weightValueTextControllerValidator = _weightValueTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
  }

  @override
  void dispose() {
    bloodGroupModel.dispose();
    heightValueFocusNode?.dispose();
    heightValueTextController?.dispose();

    weightValueFocusNode?.dispose();
    weightValueTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    aadharNumberFocusNode?.dispose();
    aadharNumberTextController?.dispose();

    abhaIDFocusNode?.dispose();
    abhaIDTextController?.dispose();
  }
}
