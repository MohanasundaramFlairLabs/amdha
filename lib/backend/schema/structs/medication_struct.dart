// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationStruct extends BaseStruct {
  MedicationStruct({
    String? totalCount,
    List<MedicationListStruct>? medicationList,
  })  : _totalCount = totalCount,
        _medicationList = medicationList;

  // "totalCount" field.
  String? _totalCount;
  String get totalCount => _totalCount ?? '';
  set totalCount(String? val) => _totalCount = val;

  bool hasTotalCount() => _totalCount != null;

  // "medicationList" field.
  List<MedicationListStruct>? _medicationList;
  List<MedicationListStruct> get medicationList => _medicationList ?? const [];
  set medicationList(List<MedicationListStruct>? val) => _medicationList = val;

  void updateMedicationList(Function(List<MedicationListStruct>) updateFn) {
    updateFn(_medicationList ??= []);
  }

  bool hasMedicationList() => _medicationList != null;

  static MedicationStruct fromMap(Map<String, dynamic> data) =>
      MedicationStruct(
        totalCount: data['totalCount'] as String?,
        medicationList: getStructList(
          data['medicationList'],
          MedicationListStruct.fromMap,
        ),
      );

  static MedicationStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalCount': _totalCount,
        'medicationList': _medicationList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalCount': serializeParam(
          _totalCount,
          ParamType.String,
        ),
        'medicationList': serializeParam(
          _medicationList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MedicationStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicationStruct(
        totalCount: deserializeParam(
          data['totalCount'],
          ParamType.String,
          false,
        ),
        medicationList: deserializeStructParam<MedicationListStruct>(
          data['medicationList'],
          ParamType.DataStruct,
          true,
          structBuilder: MedicationListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MedicationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedicationStruct &&
        totalCount == other.totalCount &&
        listEquality.equals(medicationList, other.medicationList);
  }

  @override
  int get hashCode => const ListEquality().hash([totalCount, medicationList]);
}

MedicationStruct createMedicationStruct({
  String? totalCount,
}) =>
    MedicationStruct(
      totalCount: totalCount,
    );
