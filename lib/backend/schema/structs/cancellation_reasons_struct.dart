// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CancellationReasonsStruct extends BaseStruct {
  CancellationReasonsStruct({
    List<String>? patient,
    List<String>? doctor,
  })  : _patient = patient,
        _doctor = doctor;

  // "patient" field.
  List<String>? _patient;
  List<String> get patient => _patient ?? const [];
  set patient(List<String>? val) => _patient = val;

  void updatePatient(Function(List<String>) updateFn) {
    updateFn(_patient ??= []);
  }

  bool hasPatient() => _patient != null;

  // "doctor" field.
  List<String>? _doctor;
  List<String> get doctor => _doctor ?? const [];
  set doctor(List<String>? val) => _doctor = val;

  void updateDoctor(Function(List<String>) updateFn) {
    updateFn(_doctor ??= []);
  }

  bool hasDoctor() => _doctor != null;

  static CancellationReasonsStruct fromMap(Map<String, dynamic> data) =>
      CancellationReasonsStruct(
        patient: getDataList(data['patient']),
        doctor: getDataList(data['doctor']),
      );

  static CancellationReasonsStruct? maybeFromMap(dynamic data) => data is Map
      ? CancellationReasonsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'patient': _patient,
        'doctor': _doctor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'patient': serializeParam(
          _patient,
          ParamType.String,
          isList: true,
        ),
        'doctor': serializeParam(
          _doctor,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static CancellationReasonsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CancellationReasonsStruct(
        patient: deserializeParam<String>(
          data['patient'],
          ParamType.String,
          true,
        ),
        doctor: deserializeParam<String>(
          data['doctor'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'CancellationReasonsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CancellationReasonsStruct &&
        listEquality.equals(patient, other.patient) &&
        listEquality.equals(doctor, other.doctor);
  }

  @override
  int get hashCode => const ListEquality().hash([patient, doctor]);
}

CancellationReasonsStruct createCancellationReasonsStruct() =>
    CancellationReasonsStruct();
