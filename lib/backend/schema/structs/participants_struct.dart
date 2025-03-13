// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParticipantsStruct extends BaseStruct {
  ParticipantsStruct({
    List<String>? doctor,
    List<String>? patient,
  })  : _doctor = doctor,
        _patient = patient;

  // "doctor" field.
  List<String>? _doctor;
  List<String> get doctor => _doctor ?? const [];
  set doctor(List<String>? val) => _doctor = val;

  void updateDoctor(Function(List<String>) updateFn) {
    updateFn(_doctor ??= []);
  }

  bool hasDoctor() => _doctor != null;

  // "patient" field.
  List<String>? _patient;
  List<String> get patient => _patient ?? const [];
  set patient(List<String>? val) => _patient = val;

  void updatePatient(Function(List<String>) updateFn) {
    updateFn(_patient ??= []);
  }

  bool hasPatient() => _patient != null;

  static ParticipantsStruct fromMap(Map<String, dynamic> data) =>
      ParticipantsStruct(
        doctor: getDataList(data['doctor']),
        patient: getDataList(data['patient']),
      );

  static ParticipantsStruct? maybeFromMap(dynamic data) => data is Map
      ? ParticipantsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'doctor': _doctor,
        'patient': _patient,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'doctor': serializeParam(
          _doctor,
          ParamType.String,
          isList: true,
        ),
        'patient': serializeParam(
          _patient,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ParticipantsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParticipantsStruct(
        doctor: deserializeParam<String>(
          data['doctor'],
          ParamType.String,
          true,
        ),
        patient: deserializeParam<String>(
          data['patient'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ParticipantsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ParticipantsStruct &&
        listEquality.equals(doctor, other.doctor) &&
        listEquality.equals(patient, other.patient);
  }

  @override
  int get hashCode => const ListEquality().hash([doctor, patient]);
}

ParticipantsStruct createParticipantsStruct() => ParticipantsStruct();
