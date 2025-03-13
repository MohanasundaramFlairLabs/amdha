// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VitalPermissionStruct extends BaseStruct {
  VitalPermissionStruct({
    String? vital,
    String? permitted,
  })  : _vital = vital,
        _permitted = permitted;

  // "vital" field.
  String? _vital;
  String get vital => _vital ?? '';
  set vital(String? val) => _vital = val;

  bool hasVital() => _vital != null;

  // "permitted" field.
  String? _permitted;
  String get permitted => _permitted ?? '';
  set permitted(String? val) => _permitted = val;

  bool hasPermitted() => _permitted != null;

  static VitalPermissionStruct fromMap(Map<String, dynamic> data) =>
      VitalPermissionStruct(
        vital: data['vital'] as String?,
        permitted: data['permitted'] as String?,
      );

  static VitalPermissionStruct? maybeFromMap(dynamic data) => data is Map
      ? VitalPermissionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vital': _vital,
        'permitted': _permitted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vital': serializeParam(
          _vital,
          ParamType.String,
        ),
        'permitted': serializeParam(
          _permitted,
          ParamType.String,
        ),
      }.withoutNulls;

  static VitalPermissionStruct fromSerializableMap(Map<String, dynamic> data) =>
      VitalPermissionStruct(
        vital: deserializeParam(
          data['vital'],
          ParamType.String,
          false,
        ),
        permitted: deserializeParam(
          data['permitted'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VitalPermissionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VitalPermissionStruct &&
        vital == other.vital &&
        permitted == other.permitted;
  }

  @override
  int get hashCode => const ListEquality().hash([vital, permitted]);
}

VitalPermissionStruct createVitalPermissionStruct({
  String? vital,
  String? permitted,
}) =>
    VitalPermissionStruct(
      vital: vital,
      permitted: permitted,
    );
