// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationModelStruct extends BaseStruct {
  MedicationModelStruct({
    MedicationStruct? medication,
  }) : _medication = medication;

  // "medication" field.
  MedicationStruct? _medication;
  MedicationStruct get medication => _medication ?? MedicationStruct();
  set medication(MedicationStruct? val) => _medication = val;

  void updateMedication(Function(MedicationStruct) updateFn) {
    updateFn(_medication ??= MedicationStruct());
  }

  bool hasMedication() => _medication != null;

  static MedicationModelStruct fromMap(Map<String, dynamic> data) =>
      MedicationModelStruct(
        medication: MedicationStruct.maybeFromMap(data['medication']),
      );

  static MedicationModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicationModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'medication': _medication?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medication': serializeParam(
          _medication,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MedicationModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicationModelStruct(
        medication: deserializeStructParam(
          data['medication'],
          ParamType.DataStruct,
          false,
          structBuilder: MedicationStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MedicationModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MedicationModelStruct && medication == other.medication;
  }

  @override
  int get hashCode => const ListEquality().hash([medication]);
}

MedicationModelStruct createMedicationModelStruct({
  MedicationStruct? medication,
}) =>
    MedicationModelStruct(
      medication: medication ?? MedicationStruct(),
    );
