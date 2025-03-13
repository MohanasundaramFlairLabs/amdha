// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksStruct extends BaseStruct {
  TasksStruct({
    String? id,
    String? doctorId,
    String? patientId,
    String? programId,
    String? taskType,
    String? status,
    String? createdAt,
    String? updatedAt,
    ConfigStruct? config,
    String? startDate,
    String? endDate,
    DoctorModelStruct? doctorData,
  })  : _id = id,
        _doctorId = doctorId,
        _patientId = patientId,
        _programId = programId,
        _taskType = taskType,
        _status = status,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _config = config,
        _startDate = startDate,
        _endDate = endDate,
        _doctorData = doctorData;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "doctor_id" field.
  String? _doctorId;
  String get doctorId => _doctorId ?? '';
  set doctorId(String? val) => _doctorId = val;

  bool hasDoctorId() => _doctorId != null;

  // "patient_id" field.
  String? _patientId;
  String get patientId => _patientId ?? '';
  set patientId(String? val) => _patientId = val;

  bool hasPatientId() => _patientId != null;

  // "program_id" field.
  String? _programId;
  String get programId => _programId ?? '';
  set programId(String? val) => _programId = val;

  bool hasProgramId() => _programId != null;

  // "task_type" field.
  String? _taskType;
  String get taskType => _taskType ?? '';
  set taskType(String? val) => _taskType = val;

  bool hasTaskType() => _taskType != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

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

  // "config" field.
  ConfigStruct? _config;
  ConfigStruct get config => _config ?? ConfigStruct();
  set config(ConfigStruct? val) => _config = val;

  void updateConfig(Function(ConfigStruct) updateFn) {
    updateFn(_config ??= ConfigStruct());
  }

  bool hasConfig() => _config != null;

  // "start_date" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  set endDate(String? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "doctorData" field.
  DoctorModelStruct? _doctorData;
  DoctorModelStruct get doctorData => _doctorData ?? DoctorModelStruct();
  set doctorData(DoctorModelStruct? val) => _doctorData = val;

  void updateDoctorData(Function(DoctorModelStruct) updateFn) {
    updateFn(_doctorData ??= DoctorModelStruct());
  }

  bool hasDoctorData() => _doctorData != null;

  static TasksStruct fromMap(Map<String, dynamic> data) => TasksStruct(
        id: data['id'] as String?,
        doctorId: data['doctor_id'] as String?,
        patientId: data['patient_id'] as String?,
        programId: data['program_id'] as String?,
        taskType: data['task_type'] as String?,
        status: data['status'] as String?,
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
        config: data['config'] is ConfigStruct
            ? data['config']
            : ConfigStruct.maybeFromMap(data['config']),
        startDate: data['start_date'] as String?,
        endDate: data['end_date'] as String?,
        doctorData: data['doctorData'] is DoctorModelStruct
            ? data['doctorData']
            : DoctorModelStruct.maybeFromMap(data['doctorData']),
      );

  static TasksStruct? maybeFromMap(dynamic data) =>
      data is Map ? TasksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'doctor_id': _doctorId,
        'patient_id': _patientId,
        'program_id': _programId,
        'task_type': _taskType,
        'status': _status,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'config': _config?.toMap(),
        'start_date': _startDate,
        'end_date': _endDate,
        'doctorData': _doctorData?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'doctor_id': serializeParam(
          _doctorId,
          ParamType.String,
        ),
        'patient_id': serializeParam(
          _patientId,
          ParamType.String,
        ),
        'program_id': serializeParam(
          _programId,
          ParamType.String,
        ),
        'task_type': serializeParam(
          _taskType,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'config': serializeParam(
          _config,
          ParamType.DataStruct,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'end_date': serializeParam(
          _endDate,
          ParamType.String,
        ),
        'doctorData': serializeParam(
          _doctorData,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TasksStruct fromSerializableMap(Map<String, dynamic> data) =>
      TasksStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        doctorId: deserializeParam(
          data['doctor_id'],
          ParamType.String,
          false,
        ),
        patientId: deserializeParam(
          data['patient_id'],
          ParamType.String,
          false,
        ),
        programId: deserializeParam(
          data['program_id'],
          ParamType.String,
          false,
        ),
        taskType: deserializeParam(
          data['task_type'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
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
        config: deserializeStructParam(
          data['config'],
          ParamType.DataStruct,
          false,
          structBuilder: ConfigStruct.fromSerializableMap,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.String,
          false,
        ),
        endDate: deserializeParam(
          data['end_date'],
          ParamType.String,
          false,
        ),
        doctorData: deserializeStructParam(
          data['doctorData'],
          ParamType.DataStruct,
          false,
          structBuilder: DoctorModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TasksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TasksStruct &&
        id == other.id &&
        doctorId == other.doctorId &&
        patientId == other.patientId &&
        programId == other.programId &&
        taskType == other.taskType &&
        status == other.status &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        config == other.config &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        doctorData == other.doctorData;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        doctorId,
        patientId,
        programId,
        taskType,
        status,
        createdAt,
        updatedAt,
        config,
        startDate,
        endDate,
        doctorData
      ]);
}

TasksStruct createTasksStruct({
  String? id,
  String? doctorId,
  String? patientId,
  String? programId,
  String? taskType,
  String? status,
  String? createdAt,
  String? updatedAt,
  ConfigStruct? config,
  String? startDate,
  String? endDate,
  DoctorModelStruct? doctorData,
}) =>
    TasksStruct(
      id: id,
      doctorId: doctorId,
      patientId: patientId,
      programId: programId,
      taskType: taskType,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      config: config ?? ConfigStruct(),
      startDate: startDate,
      endDate: endDate,
      doctorData: doctorData ?? DoctorModelStruct(),
    );
