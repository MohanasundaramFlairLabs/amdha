// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VitalsStruct extends BaseStruct {
  VitalsStruct({
    String? type,
    String? value,
    String? note,
    String? lastModified,
  })  : _type = type,
        _value = value,
        _note = note,
        _lastModified = lastModified;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "lastModified" field.
  String? _lastModified;
  String get lastModified => _lastModified ?? '';
  set lastModified(String? val) => _lastModified = val;

  bool hasLastModified() => _lastModified != null;

  static VitalsStruct fromMap(Map<String, dynamic> data) => VitalsStruct(
        type: data['type'] as String?,
        value: data['value'] as String?,
        note: data['note'] as String?,
        lastModified: data['lastModified'] as String?,
      );

  static VitalsStruct? maybeFromMap(dynamic data) =>
      data is Map ? VitalsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'value': _value,
        'note': _note,
        'lastModified': _lastModified,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'lastModified': serializeParam(
          _lastModified,
          ParamType.String,
        ),
      }.withoutNulls;

  static VitalsStruct fromSerializableMap(Map<String, dynamic> data) =>
      VitalsStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        lastModified: deserializeParam(
          data['lastModified'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VitalsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VitalsStruct &&
        type == other.type &&
        value == other.value &&
        note == other.note &&
        lastModified == other.lastModified;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, value, note, lastModified]);
}

VitalsStruct createVitalsStruct({
  String? type,
  String? value,
  String? note,
  String? lastModified,
}) =>
    VitalsStruct(
      type: type,
      value: value,
      note: note,
      lastModified: lastModified,
    );
