// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorsStruct extends BaseStruct {
  DoctorsStruct({
    List<DoctorModelStruct>? doctors,
  }) : _doctors = doctors;

  // "doctors" field.
  List<DoctorModelStruct>? _doctors;
  List<DoctorModelStruct> get doctors => _doctors ?? const [];
  set doctors(List<DoctorModelStruct>? val) => _doctors = val;

  void updateDoctors(Function(List<DoctorModelStruct>) updateFn) {
    updateFn(_doctors ??= []);
  }

  bool hasDoctors() => _doctors != null;

  static DoctorsStruct fromMap(Map<String, dynamic> data) => DoctorsStruct(
        doctors: getStructList(
          data['doctors'],
          DoctorModelStruct.fromMap,
        ),
      );

  static DoctorsStruct? maybeFromMap(dynamic data) =>
      data is Map ? DoctorsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'doctors': _doctors?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'doctors': serializeParam(
          _doctors,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static DoctorsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DoctorsStruct(
        doctors: deserializeStructParam<DoctorModelStruct>(
          data['doctors'],
          ParamType.DataStruct,
          true,
          structBuilder: DoctorModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'DoctorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DoctorsStruct &&
        listEquality.equals(doctors, other.doctors);
  }

  @override
  int get hashCode => const ListEquality().hash([doctors]);
}

DoctorsStruct createDoctorsStruct() => DoctorsStruct();
