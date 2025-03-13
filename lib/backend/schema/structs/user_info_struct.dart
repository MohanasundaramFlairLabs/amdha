// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInfoStruct extends BaseStruct {
  UserInfoStruct({
    bool? active,
    String? email,
    String? firstName,
    String? id,
    String? lastName,
    String? mobilePhone,
    String? tenantId,
    String? gender,
    String? dob,
  })  : _active = active,
        _email = email,
        _firstName = firstName,
        _id = id,
        _lastName = lastName,
        _mobilePhone = mobilePhone,
        _tenantId = tenantId,
        _gender = gender,
        _dob = dob;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "mobilePhone" field.
  String? _mobilePhone;
  String get mobilePhone => _mobilePhone ?? '';
  set mobilePhone(String? val) => _mobilePhone = val;

  bool hasMobilePhone() => _mobilePhone != null;

  // "tenantId" field.
  String? _tenantId;
  String get tenantId => _tenantId ?? '';
  set tenantId(String? val) => _tenantId = val;

  bool hasTenantId() => _tenantId != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "dob" field.
  String? _dob;
  String get dob => _dob ?? '';
  set dob(String? val) => _dob = val;

  bool hasDob() => _dob != null;

  static UserInfoStruct fromMap(Map<String, dynamic> data) => UserInfoStruct(
        active: data['active'] as bool?,
        email: data['email'] as String?,
        firstName: data['firstName'] as String?,
        id: data['id'] as String?,
        lastName: data['lastName'] as String?,
        mobilePhone: data['mobilePhone'] as String?,
        tenantId: data['tenantId'] as String?,
        gender: data['gender'] as String?,
        dob: data['dob'] as String?,
      );

  static UserInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'active': _active,
        'email': _email,
        'firstName': _firstName,
        'id': _id,
        'lastName': _lastName,
        'mobilePhone': _mobilePhone,
        'tenantId': _tenantId,
        'gender': _gender,
        'dob': _dob,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'mobilePhone': serializeParam(
          _mobilePhone,
          ParamType.String,
        ),
        'tenantId': serializeParam(
          _tenantId,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'dob': serializeParam(
          _dob,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInfoStruct(
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        mobilePhone: deserializeParam(
          data['mobilePhone'],
          ParamType.String,
          false,
        ),
        tenantId: deserializeParam(
          data['tenantId'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        dob: deserializeParam(
          data['dob'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserInfoStruct &&
        active == other.active &&
        email == other.email &&
        firstName == other.firstName &&
        id == other.id &&
        lastName == other.lastName &&
        mobilePhone == other.mobilePhone &&
        tenantId == other.tenantId &&
        gender == other.gender &&
        dob == other.dob;
  }

  @override
  int get hashCode => const ListEquality().hash([
        active,
        email,
        firstName,
        id,
        lastName,
        mobilePhone,
        tenantId,
        gender,
        dob
      ]);
}

UserInfoStruct createUserInfoStruct({
  bool? active,
  String? email,
  String? firstName,
  String? id,
  String? lastName,
  String? mobilePhone,
  String? tenantId,
  String? gender,
  String? dob,
}) =>
    UserInfoStruct(
      active: active,
      email: email,
      firstName: firstName,
      id: id,
      lastName: lastName,
      mobilePhone: mobilePhone,
      tenantId: tenantId,
      gender: gender,
      dob: dob,
    );
