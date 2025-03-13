import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  Local state fields for this page.

  ProfileModelStruct? profile;
  void updateProfileStruct(Function(ProfileModelStruct) updateFn) {
    updateFn(profile ??= ProfileModelStruct());
  }

  bool isEdit = false;

  bool isLoaded = false;

  DateTime? dob;

  FFUploadedFile? tempProfilePic;

  List<EmergencyContactStruct> emergencyContacts = [];
  void addToEmergencyContacts(EmergencyContactStruct item) =>
      emergencyContacts.add(item);
  void removeFromEmergencyContacts(EmergencyContactStruct item) =>
      emergencyContacts.remove(item);
  void removeAtIndexFromEmergencyContacts(int index) =>
      emergencyContacts.removeAt(index);
  void insertAtIndexInEmergencyContacts(
          int index, EmergencyContactStruct item) =>
      emergencyContacts.insert(index, item);
  void updateEmergencyContactsAtIndex(
          int index, Function(EmergencyContactStruct) updateFn) =>
      emergencyContacts[index] = updateFn(emergencyContacts[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getProfile)] action in UserProfile widget.
  ApiCallResponse? profileResponse;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for MobileNumber widget.
  FocusNode? mobileNumberFocusNode;
  TextEditingController? mobileNumberTextController;
  String? Function(BuildContext, String?)? mobileNumberTextControllerValidator;
  // State field(s) for GenderDropDown widget.
  String? genderDropDownValue;
  FormFieldController<String>? genderDropDownValueController;
  DateTime? datePicked;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for AADHAR widget.
  FocusNode? aadharFocusNode;
  TextEditingController? aadharTextController;
  String? Function(BuildContext, String?)? aadharTextControllerValidator;
  // State field(s) for ABHA widget.
  FocusNode? abhaFocusNode;
  TextEditingController? abhaTextController;
  String? Function(BuildContext, String?)? abhaTextControllerValidator;
  // State field(s) for Height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  // State field(s) for Weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  // State field(s) for BGDropDown widget.
  String? bGDropDownValue;
  FormFieldController<String>? bGDropDownValueController;
  // Stores action output result for [Backend Call - API (updateProfile)] action in Button widget.
  ApiCallResponse? apiResultina;
  // Stores action output result for [Backend Call - API (getProfile)] action in Button widget.
  ApiCallResponse? apiResultt0h;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    mobileNumberFocusNode?.dispose();
    mobileNumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    aadharFocusNode?.dispose();
    aadharTextController?.dispose();

    abhaFocusNode?.dispose();
    abhaTextController?.dispose();

    heightFocusNode?.dispose();
    heightTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();
  }
}
