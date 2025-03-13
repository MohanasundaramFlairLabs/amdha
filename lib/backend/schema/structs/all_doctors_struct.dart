// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllDoctorsStruct extends BaseStruct {
  AllDoctorsStruct({
    List<DoctorModelStruct>? connectedDoctor,
    List<DoctorModelStruct>? otherDoctor,
  })  : _connectedDoctor = connectedDoctor,
        _otherDoctor = otherDoctor;

  // "connectedDoctor" field.
  List<DoctorModelStruct>? _connectedDoctor;
  List<DoctorModelStruct> get connectedDoctor => _connectedDoctor ?? const [];
  set connectedDoctor(List<DoctorModelStruct>? val) => _connectedDoctor = val;

  void updateConnectedDoctor(Function(List<DoctorModelStruct>) updateFn) {
    updateFn(_connectedDoctor ??= []);
  }

  bool hasConnectedDoctor() => _connectedDoctor != null;

  // "otherDoctor" field.
  List<DoctorModelStruct>? _otherDoctor;
  List<DoctorModelStruct> get otherDoctor => _otherDoctor ?? const [];
  set otherDoctor(List<DoctorModelStruct>? val) => _otherDoctor = val;

  void updateOtherDoctor(Function(List<DoctorModelStruct>) updateFn) {
    updateFn(_otherDoctor ??= []);
  }

  bool hasOtherDoctor() => _otherDoctor != null;

  static AllDoctorsStruct fromMap(Map<String, dynamic> data) =>
      AllDoctorsStruct(
        connectedDoctor: getStructList(
          data['connectedDoctor'],
          DoctorModelStruct.fromMap,
        ),
        otherDoctor: getStructList(
          data['otherDoctor'],
          DoctorModelStruct.fromMap,
        ),
      );

  static AllDoctorsStruct? maybeFromMap(dynamic data) => data is Map
      ? AllDoctorsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'connectedDoctor': _connectedDoctor?.map((e) => e.toMap()).toList(),
        'otherDoctor': _otherDoctor?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'connectedDoctor': serializeParam(
          _connectedDoctor,
          ParamType.DataStruct,
          isList: true,
        ),
        'otherDoctor': serializeParam(
          _otherDoctor,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AllDoctorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AllDoctorsStruct(
        connectedDoctor: deserializeStructParam<DoctorModelStruct>(
          data['connectedDoctor'],
          ParamType.DataStruct,
          true,
          structBuilder: DoctorModelStruct.fromSerializableMap,
        ),
        otherDoctor: deserializeStructParam<DoctorModelStruct>(
          data['otherDoctor'],
          ParamType.DataStruct,
          true,
          structBuilder: DoctorModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AllDoctorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AllDoctorsStruct &&
        listEquality.equals(connectedDoctor, other.connectedDoctor) &&
        listEquality.equals(otherDoctor, other.otherDoctor);
  }

  @override
  int get hashCode => const ListEquality().hash([connectedDoctor, otherDoctor]);
}

AllDoctorsStruct createAllDoctorsStruct() => AllDoctorsStruct();
