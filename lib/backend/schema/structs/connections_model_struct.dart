// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConnectionsModelStruct extends BaseStruct {
  ConnectionsModelStruct({
    String? id,
    String? startTime,
    String? endTime,
    ParticipantsStruct? participants,
    String? notes,
    DomainDataStruct? domainData,
    String? status,
    DoctorModelStruct? doctorDetails,
    String? consultationId,
  })  : _id = id,
        _startTime = startTime,
        _endTime = endTime,
        _participants = participants,
        _notes = notes,
        _domainData = domainData,
        _status = status,
        _doctorDetails = doctorDetails,
        _consultationId = consultationId;

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

  // "doctorDetails" field.
  DoctorModelStruct? _doctorDetails;
  DoctorModelStruct get doctorDetails => _doctorDetails ?? DoctorModelStruct();
  set doctorDetails(DoctorModelStruct? val) => _doctorDetails = val;

  void updateDoctorDetails(Function(DoctorModelStruct) updateFn) {
    updateFn(_doctorDetails ??= DoctorModelStruct());
  }

  bool hasDoctorDetails() => _doctorDetails != null;

  // "consultationId" field.
  String? _consultationId;
  String get consultationId => _consultationId ?? '';
  set consultationId(String? val) => _consultationId = val;

  bool hasConsultationId() => _consultationId != null;

  static ConnectionsModelStruct fromMap(Map<String, dynamic> data) =>
      ConnectionsModelStruct(
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
        doctorDetails: data['doctorDetails'] is DoctorModelStruct
            ? data['doctorDetails']
            : DoctorModelStruct.maybeFromMap(data['doctorDetails']),
        consultationId: data['consultationId'] as String?,
      );

  static ConnectionsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ConnectionsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'startTime': _startTime,
        'endTime': _endTime,
        'participants': _participants?.toMap(),
        'notes': _notes,
        'domainData': _domainData?.toMap(),
        'status': _status,
        'doctorDetails': _doctorDetails?.toMap(),
        'consultationId': _consultationId,
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
        'doctorDetails': serializeParam(
          _doctorDetails,
          ParamType.DataStruct,
        ),
        'consultationId': serializeParam(
          _consultationId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConnectionsModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConnectionsModelStruct(
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
        doctorDetails: deserializeStructParam(
          data['doctorDetails'],
          ParamType.DataStruct,
          false,
          structBuilder: DoctorModelStruct.fromSerializableMap,
        ),
        consultationId: deserializeParam(
          data['consultationId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConnectionsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConnectionsModelStruct &&
        id == other.id &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        participants == other.participants &&
        notes == other.notes &&
        domainData == other.domainData &&
        status == other.status &&
        doctorDetails == other.doctorDetails &&
        consultationId == other.consultationId;
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
        doctorDetails,
        consultationId
      ]);
}

ConnectionsModelStruct createConnectionsModelStruct({
  String? id,
  String? startTime,
  String? endTime,
  ParticipantsStruct? participants,
  String? notes,
  DomainDataStruct? domainData,
  String? status,
  DoctorModelStruct? doctorDetails,
  String? consultationId,
}) =>
    ConnectionsModelStruct(
      id: id,
      startTime: startTime,
      endTime: endTime,
      participants: participants ?? ParticipantsStruct(),
      notes: notes,
      domainData: domainData ?? DomainDataStruct(),
      status: status,
      doctorDetails: doctorDetails ?? DoctorModelStruct(),
      consultationId: consultationId,
    );
