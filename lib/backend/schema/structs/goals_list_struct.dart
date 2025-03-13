// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalsListStruct extends BaseStruct {
  GoalsListStruct({
    String? id,
    String? internalId,
    String? value,
    String? vitalType,
  })  : _id = id,
        _internalId = internalId,
        _value = value,
        _vitalType = vitalType;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "internalId" field.
  String? _internalId;
  String get internalId => _internalId ?? '';
  set internalId(String? val) => _internalId = val;

  bool hasInternalId() => _internalId != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "vital_type" field.
  String? _vitalType;
  String get vitalType => _vitalType ?? '';
  set vitalType(String? val) => _vitalType = val;

  bool hasVitalType() => _vitalType != null;

  static GoalsListStruct fromMap(Map<String, dynamic> data) => GoalsListStruct(
        id: data['id'] as String?,
        internalId: data['internalId'] as String?,
        value: data['value'] as String?,
        vitalType: data['vital_type'] as String?,
      );

  static GoalsListStruct? maybeFromMap(dynamic data) => data is Map
      ? GoalsListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'internalId': _internalId,
        'value': _value,
        'vital_type': _vitalType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'internalId': serializeParam(
          _internalId,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'vital_type': serializeParam(
          _vitalType,
          ParamType.String,
        ),
      }.withoutNulls;

  static GoalsListStruct fromSerializableMap(Map<String, dynamic> data) =>
      GoalsListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        internalId: deserializeParam(
          data['internalId'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        vitalType: deserializeParam(
          data['vital_type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GoalsListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoalsListStruct &&
        id == other.id &&
        internalId == other.internalId &&
        value == other.value &&
        vitalType == other.vitalType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, internalId, value, vitalType]);
}

GoalsListStruct createGoalsListStruct({
  String? id,
  String? internalId,
  String? value,
  String? vitalType,
}) =>
    GoalsListStruct(
      id: id,
      internalId: internalId,
      value: value,
      vitalType: vitalType,
    );
