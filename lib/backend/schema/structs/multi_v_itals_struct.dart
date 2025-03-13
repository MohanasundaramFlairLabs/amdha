// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MultiVItalsStruct extends BaseStruct {
  MultiVItalsStruct({
    String? name,
    String? value,
    String? severity,
  })  : _name = name,
        _value = value,
        _severity = severity;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "severity" field.
  String? _severity;
  String get severity => _severity ?? '';
  set severity(String? val) => _severity = val;

  bool hasSeverity() => _severity != null;

  static MultiVItalsStruct fromMap(Map<String, dynamic> data) =>
      MultiVItalsStruct(
        name: data['name'] as String?,
        value: data['value'] as String?,
        severity: data['severity'] as String?,
      );

  static MultiVItalsStruct? maybeFromMap(dynamic data) => data is Map
      ? MultiVItalsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'value': _value,
        'severity': _severity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'severity': serializeParam(
          _severity,
          ParamType.String,
        ),
      }.withoutNulls;

  static MultiVItalsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MultiVItalsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        severity: deserializeParam(
          data['severity'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MultiVItalsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MultiVItalsStruct &&
        name == other.name &&
        value == other.value &&
        severity == other.severity;
  }

  @override
  int get hashCode => const ListEquality().hash([name, value, severity]);
}

MultiVItalsStruct createMultiVItalsStruct({
  String? name,
  String? value,
  String? severity,
}) =>
    MultiVItalsStruct(
      name: name,
      value: value,
      severity: severity,
    );
