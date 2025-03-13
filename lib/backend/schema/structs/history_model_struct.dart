// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryModelStruct extends BaseStruct {
  HistoryModelStruct({
    String? id,
    String? startTime,
    String? endTime,
    ParticipantsStruct? participants,
    String? notes,
    DomainDataStruct? domainData,
    String? status,
    YourVisitsStruct? caseSheet,
    DoctorModelStruct? doctorDetails,
  })  : _id = id,
        _startTime = startTime,
        _endTime = endTime,
        _participants = participants,
        _notes = notes,
        _domainData = domainData,
        _status = status,
        _caseSheet = caseSheet,
        _doctorDetails = doctorDetails;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "startTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "participants" field.
  ParticipantsStruct? _participants;
  ParticipantsStruct get participants => _participants ?? ParticipantsStruct();
  set participants(ParticipantsStruct? val) => _participants = val;

  void updateParticipants(Function(ParticipantsStruct) updateFn) {
    updateFn(_participants ??= ParticipantsStruct());
  }

  bool hasParticipants() => _participants != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  // "domainData" field.
  DomainDataStruct? _domainData;
  DomainDataStruct get domainData => _domainData ?? DomainDataStruct();
  set domainData(DomainDataStruct? val) => _domainData = val;

  void updateDomainData(Function(DomainDataStruct) updateFn) {
    updateFn(_domainData ??= DomainDataStruct());
  }

  bool hasDomainData() => _domainData != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "caseSheet" field.
  YourVisitsStruct? _caseSheet;
  YourVisitsStruct get caseSheet => _caseSheet ?? YourVisitsStruct();
  set caseSheet(YourVisitsStruct? val) => _caseSheet = val;

  void updateCaseSheet(Function(YourVisitsStruct) updateFn) {
    updateFn(_caseSheet ??= YourVisitsStruct());
  }

  bool hasCaseSheet() => _caseSheet != null;

  // "doctor_details" field.
  DoctorModelStruct? _doctorDetails;
  DoctorModelStruct get doctorDetails => _doctorDetails ?? DoctorModelStruct();
  set doctorDetails(DoctorModelStruct? val) => _doctorDetails = val;

  void updateDoctorDetails(Function(DoctorModelStruct) updateFn) {
    updateFn(_doctorDetails ??= DoctorModelStruct());
  }

  bool hasDoctorDetails() => _doctorDetails != null;

  static HistoryModelStruct fromMap(Map<String, dynamic> data) =>
      HistoryModelStruct(
        id: data['id'] as String?,
        startTime: data['startTime'] as String?,
        endTime: data['endTime'] as String?,
        participants: data['participants'] is ParticipantsStruct
            ? data['participants']
            : ParticipantsStruct.maybeFromMap(data['participants']),
        notes: data['notes'] as String?,
        domainData: data['domainData'] is DomainDataStruct
            ? data['domainData']
            : DomainDataStruct.maybeFromMap(data['domainData']),
        status: data['status'] as String?,
        caseSheet: data['caseSheet'] is YourVisitsStruct
            ? data['caseSheet']
            : YourVisitsStruct.maybeFromMap(data['caseSheet']),
        doctorDetails: data['doctor_details'] is DoctorModelStruct
            ? data['doctor_details']
            : DoctorModelStruct.maybeFromMap(data['doctor_details']),
      );

  static HistoryModelStruct? maybeFromMap(dynamic data) => data is Map
      ? HistoryModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'startTime': _startTime,
        'endTime': _endTime,
        'participants': _participants?.toMap(),
        'notes': _notes,
        'domainData': _domainData?.toMap(),
        'status': _status,
        'caseSheet': _caseSheet?.toMap(),
        'doctor_details': _doctorDetails?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'startTime': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'participants': serializeParam(
          _participants,
          ParamType.DataStruct,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'domainData': serializeParam(
          _domainData,
          ParamType.DataStruct,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'caseSheet': serializeParam(
          _caseSheet,
          ParamType.DataStruct,
        ),
        'doctor_details': serializeParam(
          _doctorDetails,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static HistoryModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      HistoryModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['startTime'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.String,
          false,
        ),
        participants: deserializeStructParam(
          data['participants'],
          ParamType.DataStruct,
          false,
          structBuilder: ParticipantsStruct.fromSerializableMap,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        domainData: deserializeStructParam(
          data['domainData'],
          ParamType.DataStruct,
          false,
          structBuilder: DomainDataStruct.fromSerializableMap,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        caseSheet: deserializeStructParam(
          data['caseSheet'],
          ParamType.DataStruct,
          false,
          structBuilder: YourVisitsStruct.fromSerializableMap,
        ),
        doctorDetails: deserializeStructParam(
          data['doctor_details'],
          ParamType.DataStruct,
          false,
          structBuilder: DoctorModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'HistoryModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HistoryModelStruct &&
        id == other.id &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        participants == other.participants &&
        notes == other.notes &&
        domainData == other.domainData &&
        status == other.status &&
        caseSheet == other.caseSheet &&
        doctorDetails == other.doctorDetails;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        startTime,
        endTime,
        participants,
        notes,
        domainData,
        status,
        caseSheet,
        doctorDetails
      ]);
}

HistoryModelStruct createHistoryModelStruct({
  String? id,
  String? startTime,
  String? endTime,
  ParticipantsStruct? participants,
  String? notes,
  DomainDataStruct? domainData,
  String? status,
  YourVisitsStruct? caseSheet,
  DoctorModelStruct? doctorDetails,
}) =>
    HistoryModelStruct(
      id: id,
      startTime: startTime,
      endTime: endTime,
      participants: participants ?? ParticipantsStruct(),
      notes: notes,
      domainData: domainData ?? DomainDataStruct(),
      status: status,
      caseSheet: caseSheet ?? YourVisitsStruct(),
      doctorDetails: doctorDetails ?? DoctorModelStruct(),
    );
