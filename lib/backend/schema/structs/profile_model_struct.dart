// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileModelStruct extends BaseStruct {
  ProfileModelStruct({
    String? internalId,
    String? externalId,
    String? firstName,
    String? lastName,
    String? gender,
    String? email,
    String? dob,
    String? phoneNumber,
    String? preferredLanguage,
    String? bloodGroup,
    String? height,
    String? weight,
    String? aadhaarId,
    String? abhaId,
    List<ProgramsStruct>? programs,
    List<DoctorModelStruct>? providers,
    String? profileImageUri,
    List<EmergencyContactStruct>? emergencyContacts,
  })  : _internalId = internalId,
        _externalId = externalId,
        _firstName = firstName,
        _lastName = lastName,
        _gender = gender,
        _email = email,
        _dob = dob,
        _phoneNumber = phoneNumber,
        _preferredLanguage = preferredLanguage,
        _bloodGroup = bloodGroup,
        _height = height,
        _weight = weight,
        _aadhaarId = aadhaarId,
        _abhaId = abhaId,
        _programs = programs,
        _providers = providers,
        _profileImageUri = profileImageUri,
        _emergencyContacts = emergencyContacts;

  // "internalId" field.
  String? _internalId;
  String get internalId => _internalId ?? '';
  set internalId(String? val) => _internalId = val;

  bool hasInternalId() => _internalId != null;

  // "externalId" field.
  String? _externalId;
  String get externalId => _externalId ?? '';
  set externalId(String? val) => _externalId = val;

  bool hasExternalId() => _externalId != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "dob" field.
  String? _dob;
  String get dob => _dob ?? '';
  set dob(String? val) => _dob = val;

  bool hasDob() => _dob != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "preferredLanguage" field.
  String? _preferredLanguage;
  String get preferredLanguage => _preferredLanguage ?? '';
  set preferredLanguage(String? val) => _preferredLanguage = val;

  bool hasPreferredLanguage() => _preferredLanguage != null;

  // "bloodGroup" field.
  String? _bloodGroup;
  String get bloodGroup => _bloodGroup ?? '';
  set bloodGroup(String? val) => _bloodGroup = val;

  bool hasBloodGroup() => _bloodGroup != null;

  // "height" field.
  String? _height;
  String get height => _height ?? '';
  set height(String? val) => _height = val;

  bool hasHeight() => _height != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  set weight(String? val) => _weight = val;

  bool hasWeight() => _weight != null;

  // "aadhaarId" field.
  String? _aadhaarId;
  String get aadhaarId => _aadhaarId ?? '';
  set aadhaarId(String? val) => _aadhaarId = val;

  bool hasAadhaarId() => _aadhaarId != null;

  // "abhaId" field.
  String? _abhaId;
  String get abhaId => _abhaId ?? '';
  set abhaId(String? val) => _abhaId = val;

  bool hasAbhaId() => _abhaId != null;

  // "programs" field.
  List<ProgramsStruct>? _programs;
  List<ProgramsStruct> get programs => _programs ?? const [];
  set programs(List<ProgramsStruct>? val) => _programs = val;

  void updatePrograms(Function(List<ProgramsStruct>) updateFn) {
    updateFn(_programs ??= []);
  }

  bool hasPrograms() => _programs != null;

  // "providers" field.
  List<DoctorModelStruct>? _providers;
  List<DoctorModelStruct> get providers => _providers ?? const [];
  set providers(List<DoctorModelStruct>? val) => _providers = val;

  void updateProviders(Function(List<DoctorModelStruct>) updateFn) {
    updateFn(_providers ??= []);
  }

  bool hasProviders() => _providers != null;

  // "profileImageUri" field.
  String? _profileImageUri;
  String get profileImageUri => _profileImageUri ?? '';
  set profileImageUri(String? val) => _profileImageUri = val;

  bool hasProfileImageUri() => _profileImageUri != null;

  // "emergencyContacts" field.
  List<EmergencyContactStruct>? _emergencyContacts;
  List<EmergencyContactStruct> get emergencyContacts =>
      _emergencyContacts ?? const [];
  set emergencyContacts(List<EmergencyContactStruct>? val) =>
      _emergencyContacts = val;

  void updateEmergencyContacts(
      Function(List<EmergencyContactStruct>) updateFn) {
    updateFn(_emergencyContacts ??= []);
  }

  bool hasEmergencyContacts() => _emergencyContacts != null;

  static ProfileModelStruct fromMap(Map<String, dynamic> data) =>
      ProfileModelStruct(
        internalId: data['internalId'] as String?,
        externalId: data['externalId'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        gender: data['gender'] as String?,
        email: data['email'] as String?,
        dob: data['dob'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        preferredLanguage: data['preferredLanguage'] as String?,
        bloodGroup: data['bloodGroup'] as String?,
        height: data['height'] as String?,
        weight: data['weight'] as String?,
        aadhaarId: data['aadhaarId'] as String?,
        abhaId: data['abhaId'] as String?,
        programs: getStructList(
          data['programs'],
          ProgramsStruct.fromMap,
        ),
        providers: getStructList(
          data['providers'],
          DoctorModelStruct.fromMap,
        ),
        profileImageUri: data['profileImageUri'] as String?,
        emergencyContacts: getStructList(
          data['emergencyContacts'],
          EmergencyContactStruct.fromMap,
        ),
      );

  static ProfileModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ProfileModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'internalId': _internalId,
        'externalId': _externalId,
        'firstName': _firstName,
        'lastName': _lastName,
        'gender': _gender,
        'email': _email,
        'dob': _dob,
        'phoneNumber': _phoneNumber,
        'preferredLanguage': _preferredLanguage,
        'bloodGroup': _bloodGroup,
        'height': _height,
        'weight': _weight,
        'aadhaarId': _aadhaarId,
        'abhaId': _abhaId,
        'programs': _programs?.map((e) => e.toMap()).toList(),
        'providers': _providers?.map((e) => e.toMap()).toList(),
        'profileImageUri': _profileImageUri,
        'emergencyContacts': _emergencyContacts?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'internalId': serializeParam(
          _internalId,
          ParamType.String,
        ),
        'externalId': serializeParam(
          _externalId,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'dob': serializeParam(
          _dob,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'preferredLanguage': serializeParam(
          _preferredLanguage,
          ParamType.String,
        ),
        'bloodGroup': serializeParam(
          _bloodGroup,
          ParamType.String,
        ),
        'height': serializeParam(
          _height,
          ParamType.String,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.String,
        ),
        'aadhaarId': serializeParam(
          _aadhaarId,
          ParamType.String,
        ),
        'abhaId': serializeParam(
          _abhaId,
          ParamType.String,
        ),
        'programs': serializeParam(
          _programs,
          ParamType.DataStruct,
          isList: true,
        ),
        'providers': serializeParam(
          _providers,
          ParamType.DataStruct,
          isList: true,
        ),
        'profileImageUri': serializeParam(
          _profileImageUri,
          ParamType.String,
        ),
        'emergencyContacts': serializeParam(
          _emergencyContacts,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ProfileModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileModelStruct(
        internalId: deserializeParam(
          data['internalId'],
          ParamType.String,
          false,
        ),
        externalId: deserializeParam(
          data['externalId'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        dob: deserializeParam(
          data['dob'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        preferredLanguage: deserializeParam(
          data['preferredLanguage'],
          ParamType.String,
          false,
        ),
        bloodGroup: deserializeParam(
          data['bloodGroup'],
          ParamType.String,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.String,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.String,
          false,
        ),
        aadhaarId: deserializeParam(
          data['aadhaarId'],
          ParamType.String,
          false,
        ),
        abhaId: deserializeParam(
          data['abhaId'],
          ParamType.String,
          false,
        ),
        programs: deserializeStructParam<ProgramsStruct>(
          data['programs'],
          ParamType.DataStruct,
          true,
          structBuilder: ProgramsStruct.fromSerializableMap,
        ),
        providers: deserializeStructParam<DoctorModelStruct>(
          data['providers'],
          ParamType.DataStruct,
          true,
          structBuilder: DoctorModelStruct.fromSerializableMap,
        ),
        profileImageUri: deserializeParam(
          data['profileImageUri'],
          ParamType.String,
          false,
        ),
        emergencyContacts: deserializeStructParam<EmergencyContactStruct>(
          data['emergencyContacts'],
          ParamType.DataStruct,
          true,
          structBuilder: EmergencyContactStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProfileModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProfileModelStruct &&
        internalId == other.internalId &&
        externalId == other.externalId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        gender == other.gender &&
        email == other.email &&
        dob == other.dob &&
        phoneNumber == other.phoneNumber &&
        preferredLanguage == other.preferredLanguage &&
        bloodGroup == other.bloodGroup &&
        height == other.height &&
        weight == other.weight &&
        aadhaarId == other.aadhaarId &&
        abhaId == other.abhaId &&
        listEquality.equals(programs, other.programs) &&
        listEquality.equals(providers, other.providers) &&
        profileImageUri == other.profileImageUri &&
        listEquality.equals(emergencyContacts, other.emergencyContacts);
  }

  @override
  int get hashCode => const ListEquality().hash([
        internalId,
        externalId,
        firstName,
        lastName,
        gender,
        email,
        dob,
        phoneNumber,
        preferredLanguage,
        bloodGroup,
        height,
        weight,
        aadhaarId,
        abhaId,
        programs,
        providers,
        profileImageUri,
        emergencyContacts
      ]);
}

ProfileModelStruct createProfileModelStruct({
  String? internalId,
  String? externalId,
  String? firstName,
  String? lastName,
  String? gender,
  String? email,
  String? dob,
  String? phoneNumber,
  String? preferredLanguage,
  String? bloodGroup,
  String? height,
  String? weight,
  String? aadhaarId,
  String? abhaId,
  String? profileImageUri,
}) =>
    ProfileModelStruct(
      internalId: internalId,
      externalId: externalId,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      email: email,
      dob: dob,
      phoneNumber: phoneNumber,
      preferredLanguage: preferredLanguage,
      bloodGroup: bloodGroup,
      height: height,
      weight: weight,
      aadhaarId: aadhaarId,
      abhaId: abhaId,
      profileImageUri: profileImageUri,
    );
