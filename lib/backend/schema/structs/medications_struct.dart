// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationsStruct extends BaseStruct {
  MedicationsStruct({
    List<MedicationModelStruct>? medication,
  }) : _medication = medication;

  // "medication" field.
  List<MedicationModelStruct>? _medication;
  List<MedicationModelStruct> get medication => _medication ?? const [];
  set medication(List<MedicationModelStruct>? val) => _medication = val;

  void updateMedication(Function(List<MedicationModelStruct>) updateFn) {
    updateFn(_medication ??= []);
  }

  bool hasMedication() => _medication != null;

  static MedicationsStruct fromMap(Map<String, dynamic> data) =>
      MedicationsStruct(
        medication: getStructList(
          data['medication'],
          MedicationModelStruct.fromMap,
        ),
      );

  static MedicationsStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'medication': _medication?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medication': serializeParam(
          _medication,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MedicationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicationsStruct(
        medication: deserializeStructParam<MedicationModelStruct>(
          data['medication'],
          ParamType.DataStruct,
          true,
          structBuilder: MedicationModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MedicationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedicationsStruct &&
        listEquality.equals(medication, other.medication);
  }

  @override
  int get hashCode => const ListEquality().hash([medication]);
}

MedicationsStruct createMedicationsStruct() => MedicationsStruct();
