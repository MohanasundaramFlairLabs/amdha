// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorModelStruct extends BaseStruct {
  DoctorModelStruct({
    String? id,
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? description,
    String? location,
    String? qualification,
    String? role,
    String? experience,
    String? doctorId,
    String? profileImageUri,
    String? registrationNumber,
    String? signatureUri,
    String? doctorCompanyMail,
  })  : _id = id,
        _userId = userId,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _phoneNumber = phoneNumber,
        _description = description,
        _location = location,
        _qualification = qualification,
        _role = role,
        _experience = experience,
        _doctorId = doctorId,
        _profileImageUri = profileImageUri,
        _registrationNumber = registrationNumber,
        _signatureUri = signatureUri,
        _doctorCompanyMail = doctorCompanyMail;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "qualification" field.
  String? _qualification;
  String get qualification => _qualification ?? '';
  set qualification(String? val) => _qualification = val;

  bool hasQualification() => _qualification != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "experience" field.
  String? _experience;
  String get experience => _experience ?? '';
  set experience(String? val) => _experience = val;

  bool hasExperience() => _experience != null;

  // "doctorId" field.
  String? _doctorId;
  String get doctorId => _doctorId ?? '';
  set doctorId(String? val) => _doctorId = val;

  bool hasDoctorId() => _doctorId != null;

  // "profileImageUri" field.
  String? _profileImageUri;
  String get profileImageUri => _profileImageUri ?? '';
  set profileImageUri(String? val) => _profileImageUri = val;

  bool hasProfileImageUri() => _profileImageUri != null;

  // "registrationNumber" field.
  String? _registrationNumber;
  String get registrationNumber => _registrationNumber ?? '';
  set registrationNumber(String? val) => _registrationNumber = val;

  bool hasRegistrationNumber() => _registrationNumber != null;

  // "signatureUri" field.
  String? _signatureUri;
  String get signatureUri => _signatureUri ?? '';
  set signatureUri(String? val) => _signatureUri = val;

  bool hasSignatureUri() => _signatureUri != null;

  // "doctorCompanyMail" field.
  String? _doctorCompanyMail;
  String get doctorCompanyMail => _doctorCompanyMail ?? '';
  set doctorCompanyMail(String? val) => _doctorCompanyMail = val;

  bool hasDoctorCompanyMail() => _doctorCompanyMail != null;

  static DoctorModelStruct fromMap(Map<String, dynamic> data) =>
      DoctorModelStruct(
        id: data['id'] as String?,
        userId: data['userId'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        description: data['description'] as String?,
        location: data['location'] as String?,
        qualification: data['qualification'] as String?,
        role: data['role'] as String?,
        experience: data['experience'] as String?,
        doctorId: data['doctorId'] as String?,
        profileImageUri: data['profileImageUri'] as String?,
        registrationNumber: data['registrationNumber'] as String?,
        signatureUri: data['signatureUri'] as String?,
        doctorCompanyMail: data['doctorCompanyMail'] as String?,
      );

  static DoctorModelStruct? maybeFromMap(dynamic data) => data is Map
      ? DoctorModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'firstName': _firstName,
        'lastName': _lastName,
        'email': _email,
        'phoneNumber': _phoneNumber,
        'description': _description,
        'location': _location,
        'qualification': _qualification,
        'role': _role,
        'experience': _experience,
        'doctorId': _doctorId,
        'profileImageUri': _profileImageUri,
        'registrationNumber': _registrationNumber,
        'signatureUri': _signatureUri,
        'doctorCompanyMail': _doctorCompanyMail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'userId': serializeParam(
          _userId,
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
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'qualification': serializeParam(
          _qualification,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'experience': serializeParam(
          _experience,
          ParamType.String,
        ),
        'doctorId': serializeParam(
          _doctorId,
          ParamType.String,
        ),
        'profileImageUri': serializeParam(
          _profileImageUri,
          ParamType.String,
        ),
        'registrationNumber': serializeParam(
          _registrationNumber,
          ParamType.String,
        ),
        'signatureUri': serializeParam(
          _signatureUri,
          ParamType.String,
        ),
        'doctorCompanyMail': serializeParam(
          _doctorCompanyMail,
          ParamType.String,
        ),
      }.withoutNulls;

  static DoctorModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      DoctorModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
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
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        qualification: deserializeParam(
          data['qualification'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        experience: deserializeParam(
          data['experience'],
          ParamType.String,
          false,
        ),
        doctorId: deserializeParam(
          data['doctorId'],
          ParamType.String,
          false,
        ),
        profileImageUri: deserializeParam(
          data['profileImageUri'],
          ParamType.String,
          false,
        ),
        registrationNumber: deserializeParam(
          data['registrationNumber'],
          ParamType.String,
          false,
        ),
        signatureUri: deserializeParam(
          data['signatureUri'],
          ParamType.String,
          false,
        ),
        doctorCompanyMail: deserializeParam(
          data['doctorCompanyMail'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DoctorModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DoctorModelStruct &&
        id == other.id &&
        userId == other.userId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        description == other.description &&
        location == other.location &&
        qualification == other.qualification &&
        role == other.role &&
        experience == other.experience &&
        doctorId == other.doctorId &&
        profileImageUri == other.profileImageUri &&
        registrationNumber == other.registrationNumber &&
        signatureUri == other.signatureUri &&
        doctorCompanyMail == other.doctorCompanyMail;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userId,
        firstName,
        lastName,
        email,
        phoneNumber,
        description,
        location,
        qualification,
        role,
        experience,
        doctorId,
        profileImageUri,
        registrationNumber,
        signatureUri,
        doctorCompanyMail
      ]);
}

DoctorModelStruct createDoctorModelStruct({
  String? id,
  String? userId,
  String? firstName,
  String? lastName,
  String? email,
  String? phoneNumber,
  String? description,
  String? location,
  String? qualification,
  String? role,
  String? experience,
  String? doctorId,
  String? profileImageUri,
  String? registrationNumber,
  String? signatureUri,
  String? doctorCompanyMail,
}) =>
    DoctorModelStruct(
      id: id,
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      description: description,
      location: location,
      qualification: qualification,
      role: role,
      experience: experience,
      doctorId: doctorId,
      profileImageUri: profileImageUri,
      registrationNumber: registrationNumber,
      signatureUri: signatureUri,
      doctorCompanyMail: doctorCompanyMail,
    );
