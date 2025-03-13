// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorDetailsStruct extends BaseStruct {
  DoctorDetailsStruct({
    String? doctorName,
    String? qualification,
    String? doctorId,
    String? profileImageUri,
  })  : _doctorName = doctorName,
        _qualification = qualification,
        _doctorId = doctorId,
        _profileImageUri = profileImageUri;

  // "doctorName" field.
  String? _doctorName;
  String get doctorName => _doctorName ?? '';
  set doctorName(String? val) => _doctorName = val;

  bool hasDoctorName() => _doctorName != null;

  // "qualification" field.
  String? _qualification;
  String get qualification => _qualification ?? '';
  set qualification(String? val) => _qualification = val;

  bool hasQualification() => _qualification != null;

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

  static DoctorDetailsStruct fromMap(Map<String, dynamic> data) =>
      DoctorDetailsStruct(
        doctorName: data['doctorName'] as String?,
        qualification: data['qualification'] as String?,
        doctorId: data['doctorId'] as String?,
        profileImageUri: data['profileImageUri'] as String?,
      );

  static DoctorDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? DoctorDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'doctorName': _doctorName,
        'qualification': _qualification,
        'doctorId': _doctorId,
        'profileImageUri': _profileImageUri,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'doctorName': serializeParam(
          _doctorName,
          ParamType.String,
        ),
        'qualification': serializeParam(
          _qualification,
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
      }.withoutNulls;

  static DoctorDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DoctorDetailsStruct(
        doctorName: deserializeParam(
          data['doctorName'],
          ParamType.String,
          false,
        ),
        qualification: deserializeParam(
          data['qualification'],
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
      );

  @override
  String toString() => 'DoctorDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DoctorDetailsStruct &&
        doctorName == other.doctorName &&
        qualification == other.qualification &&
        doctorId == other.doctorId &&
        profileImageUri == other.profileImageUri;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([doctorName, qualification, doctorId, profileImageUri]);
}

DoctorDetailsStruct createDoctorDetailsStruct({
  String? doctorName,
  String? qualification,
  String? doctorId,
  String? profileImageUri,
}) =>
    DoctorDetailsStruct(
      doctorName: doctorName,
      qualification: qualification,
      doctorId: doctorId,
      profileImageUri: profileImageUri,
    );
