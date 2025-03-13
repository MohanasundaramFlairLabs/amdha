// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramsStruct extends BaseStruct {
  ProgramsStruct({
    String? id,
    String? doctorId,
    String? patientId,
    String? programId,
    ProgramDataStruct? programData,
    String? createdAt,
    String? updatedAt,
    String? programName,
    String? description,
    UserStageDetailsStruct? userStageDetails,
    bool? paymentStatus,
  })  : _id = id,
        _doctorId = doctorId,
        _patientId = patientId,
        _programId = programId,
        _programData = programData,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _programName = programName,
        _description = description,
        _userStageDetails = userStageDetails,
        _paymentStatus = paymentStatus;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "doctorId" field.
  String? _doctorId;
  String get doctorId => _doctorId ?? '';
  set doctorId(String? val) => _doctorId = val;

  bool hasDoctorId() => _doctorId != null;

  // "patientId" field.
  String? _patientId;
  String get patientId => _patientId ?? '';
  set patientId(String? val) => _patientId = val;

  bool hasPatientId() => _patientId != null;

  // "programId" field.
  String? _programId;
  String get programId => _programId ?? '';
  set programId(String? val) => _programId = val;

  bool hasProgramId() => _programId != null;

  // "programData" field.
  ProgramDataStruct? _programData;
  ProgramDataStruct get programData => _programData ?? ProgramDataStruct();
  set programData(ProgramDataStruct? val) => _programData = val;

  void updateProgramData(Function(ProgramDataStruct) updateFn) {
    updateFn(_programData ??= ProgramDataStruct());
  }

  bool hasProgramData() => _programData != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "programName" field.
  String? _programName;
  String get programName => _programName ?? '';
  set programName(String? val) => _programName = val;

  bool hasProgramName() => _programName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "userStageDetails" field.
  UserStageDetailsStruct? _userStageDetails;
  UserStageDetailsStruct get userStageDetails =>
      _userStageDetails ?? UserStageDetailsStruct();
  set userStageDetails(UserStageDetailsStruct? val) => _userStageDetails = val;

  void updateUserStageDetails(Function(UserStageDetailsStruct) updateFn) {
    updateFn(_userStageDetails ??= UserStageDetailsStruct());
  }

  bool hasUserStageDetails() => _userStageDetails != null;

  // "paymentStatus" field.
  bool? _paymentStatus;
  bool get paymentStatus => _paymentStatus ?? false;
  set paymentStatus(bool? val) => _paymentStatus = val;

  bool hasPaymentStatus() => _paymentStatus != null;

  static ProgramsStruct fromMap(Map<String, dynamic> data) => ProgramsStruct(
        id: data['id'] as String?,
        doctorId: data['doctorId'] as String?,
        patientId: data['patientId'] as String?,
        programId: data['programId'] as String?,
        programData: data['programData'] is ProgramDataStruct
            ? data['programData']
            : ProgramDataStruct.maybeFromMap(data['programData']),
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
        programName: data['programName'] as String?,
        description: data['description'] as String?,
        userStageDetails: data['userStageDetails'] is UserStageDetailsStruct
            ? data['userStageDetails']
            : UserStageDetailsStruct.maybeFromMap(data['userStageDetails']),
        paymentStatus: data['paymentStatus'] as bool?,
      );

  static ProgramsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProgramsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'doctorId': _doctorId,
        'patientId': _patientId,
        'programId': _programId,
        'programData': _programData?.toMap(),
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'programName': _programName,
        'description': _description,
        'userStageDetails': _userStageDetails?.toMap(),
        'paymentStatus': _paymentStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'doctorId': serializeParam(
          _doctorId,
          ParamType.String,
        ),
        'patientId': serializeParam(
          _patientId,
          ParamType.String,
        ),
        'programId': serializeParam(
          _programId,
          ParamType.String,
        ),
        'programData': serializeParam(
          _programData,
          ParamType.DataStruct,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'programName': serializeParam(
          _programName,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'userStageDetails': serializeParam(
          _userStageDetails,
          ParamType.DataStruct,
        ),
        'paymentStatus': serializeParam(
          _paymentStatus,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ProgramsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        doctorId: deserializeParam(
          data['doctorId'],
          ParamType.String,
          false,
        ),
        patientId: deserializeParam(
          data['patientId'],
          ParamType.String,
          false,
        ),
        programId: deserializeParam(
          data['programId'],
          ParamType.String,
          false,
        ),
        programData: deserializeStructParam(
          data['programData'],
          ParamType.DataStruct,
          false,
          structBuilder: ProgramDataStruct.fromSerializableMap,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.String,
          false,
        ),
        programName: deserializeParam(
          data['programName'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        userStageDetails: deserializeStructParam(
          data['userStageDetails'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStageDetailsStruct.fromSerializableMap,
        ),
        paymentStatus: deserializeParam(
          data['paymentStatus'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ProgramsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramsStruct &&
        id == other.id &&
        doctorId == other.doctorId &&
        patientId == other.patientId &&
        programId == other.programId &&
        programData == other.programData &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        programName == other.programName &&
        description == other.description &&
        userStageDetails == other.userStageDetails &&
        paymentStatus == other.paymentStatus;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        doctorId,
        patientId,
        programId,
        programData,
        createdAt,
        updatedAt,
        programName,
        description,
        userStageDetails,
        paymentStatus
      ]);
}

ProgramsStruct createProgramsStruct({
  String? id,
  String? doctorId,
  String? patientId,
  String? programId,
  ProgramDataStruct? programData,
  String? createdAt,
  String? updatedAt,
  String? programName,
  String? description,
  UserStageDetailsStruct? userStageDetails,
  bool? paymentStatus,
}) =>
    ProgramsStruct(
      id: id,
      doctorId: doctorId,
      patientId: patientId,
      programId: programId,
      programData: programData ?? ProgramDataStruct(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      programName: programName,
      description: description,
      userStageDetails: userStageDetails ?? UserStageDetailsStruct(),
      paymentStatus: paymentStatus,
    );
