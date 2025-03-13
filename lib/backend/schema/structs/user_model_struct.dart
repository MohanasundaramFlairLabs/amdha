// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserModelStruct extends BaseStruct {
  UserModelStruct({
    String? internalId,
    String? externalId,
    String? firstName,
    String? lastName,
    String? gender,
    String? email,
    String? dob,
    String? bloodGroup,
    String? phoneNumber,
    String? preferredLanguage,
    int? height,
    int? weight,
  })  : _internalId = internalId,
        _externalId = externalId,
        _firstName = firstName,
        _lastName = lastName,
        _gender = gender,
        _email = email,
        _dob = dob,
        _bloodGroup = bloodGroup,
        _phoneNumber = phoneNumber,
        _preferredLanguage = preferredLanguage,
        _height = height,
        _weight = weight;

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

  // "bloodGroup" field.
  String? _bloodGroup;
  String get bloodGroup => _bloodGroup ?? '';
  set bloodGroup(String? val) => _bloodGroup = val;

  bool hasBloodGroup() => _bloodGroup != null;

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

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  set height(int? val) => _height = val;

  void incrementHeight(int amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  set weight(int? val) => _weight = val;

  void incrementWeight(int amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  static UserModelStruct fromMap(Map<String, dynamic> data) => UserModelStruct(
        internalId: data['internalId'] as String?,
        externalId: data['externalId'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        gender: data['gender'] as String?,
        email: data['email'] as String?,
        dob: data['dob'] as String?,
        bloodGroup: data['bloodGroup'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        preferredLanguage: data['preferredLanguage'] as String?,
        height: castToType<int>(data['height']),
        weight: castToType<int>(data['weight']),
      );

  static UserModelStruct? maybeFromMap(dynamic data) => data is Map
      ? UserModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'internalId': _internalId,
        'externalId': _externalId,
        'firstName': _firstName,
        'lastName': _lastName,
        'gender': _gender,
        'email': _email,
        'dob': _dob,
        'bloodGroup': _bloodGroup,
        'phoneNumber': _phoneNumber,
        'preferredLanguage': _preferredLanguage,
        'height': _height,
        'weight': _weight,
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
        'bloodGroup': serializeParam(
          _bloodGroup,
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
        'height': serializeParam(
          _height,
          ParamType.int,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserModelStruct(
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
        bloodGroup: deserializeParam(
          data['bloodGroup'],
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
        height: deserializeParam(
          data['height'],
          ParamType.int,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserModelStruct &&
        internalId == other.internalId &&
        externalId == other.externalId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        gender == other.gender &&
        email == other.email &&
        dob == other.dob &&
        bloodGroup == other.bloodGroup &&
        phoneNumber == other.phoneNumber &&
        preferredLanguage == other.preferredLanguage &&
        height == other.height &&
        weight == other.weight;
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
        bloodGroup,
        phoneNumber,
        preferredLanguage,
        height,
        weight
      ]);
}

UserModelStruct createUserModelStruct({
  String? internalId,
  String? externalId,
  String? firstName,
  String? lastName,
  String? gender,
  String? email,
  String? dob,
  String? bloodGroup,
  String? phoneNumber,
  String? preferredLanguage,
  int? height,
  int? weight,
}) =>
    UserModelStruct(
      internalId: internalId,
      externalId: externalId,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      email: email,
      dob: dob,
      bloodGroup: bloodGroup,
      phoneNumber: phoneNumber,
      preferredLanguage: preferredLanguage,
      height: height,
      weight: weight,
    );
