// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddVitalModelStruct extends BaseStruct {
  AddVitalModelStruct({
    String? vitalName,
    String? vitalUnit,
  })  : _vitalName = vitalName,
        _vitalUnit = vitalUnit;

  // "vitalName" field.
  String? _vitalName;
  String get vitalName => _vitalName ?? '';
  set vitalName(String? val) => _vitalName = val;

  bool hasVitalName() => _vitalName != null;

  // "vitalUnit" field.
  String? _vitalUnit;
  String get vitalUnit => _vitalUnit ?? '';
  set vitalUnit(String? val) => _vitalUnit = val;

  bool hasVitalUnit() => _vitalUnit != null;

  static AddVitalModelStruct fromMap(Map<String, dynamic> data) =>
      AddVitalModelStruct(
        vitalName: data['vitalName'] as String?,
        vitalUnit: data['vitalUnit'] as String?,
      );

  static AddVitalModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AddVitalModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vitalName': _vitalName,
        'vitalUnit': _vitalUnit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vitalName': serializeParam(
          _vitalName,
          ParamType.String,
        ),
        'vitalUnit': serializeParam(
          _vitalUnit,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddVitalModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddVitalModelStruct(
        vitalName: deserializeParam(
          data['vitalName'],
          ParamType.String,
          false,
        ),
        vitalUnit: deserializeParam(
          data['vitalUnit'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddVitalModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddVitalModelStruct &&
        vitalName == other.vitalName &&
        vitalUnit == other.vitalUnit;
  }

  @override
  int get hashCode => const ListEquality().hash([vitalName, vitalUnit]);
}

AddVitalModelStruct createAddVitalModelStruct({
  String? vitalName,
  String? vitalUnit,
}) =>
    AddVitalModelStruct(
      vitalName: vitalName,
      vitalUnit: vitalUnit,
    );
