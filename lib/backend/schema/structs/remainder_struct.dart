// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RemainderStruct extends BaseStruct {
  RemainderStruct({
    String? dosage,
    String? name,
    DateTime? dateTime,
  })  : _dosage = dosage,
        _name = name,
        _dateTime = dateTime;

  // "dosage" field.
  String? _dosage;
  String get dosage => _dosage ?? '';
  set dosage(String? val) => _dosage = val;

  bool hasDosage() => _dosage != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? val) => _dateTime = val;

  bool hasDateTime() => _dateTime != null;

  static RemainderStruct fromMap(Map<String, dynamic> data) => RemainderStruct(
        dosage: data['dosage'] as String?,
        name: data['name'] as String?,
        dateTime: data['dateTime'] as DateTime?,
      );

  static RemainderStruct? maybeFromMap(dynamic data) => data is Map
      ? RemainderStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dosage': _dosage,
        'name': _name,
        'dateTime': _dateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dosage': serializeParam(
          _dosage,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'dateTime': serializeParam(
          _dateTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static RemainderStruct fromSerializableMap(Map<String, dynamic> data) =>
      RemainderStruct(
        dosage: deserializeParam(
          data['dosage'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        dateTime: deserializeParam(
          data['dateTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'RemainderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RemainderStruct &&
        dosage == other.dosage &&
        name == other.name &&
        dateTime == other.dateTime;
  }

  @override
  int get hashCode => const ListEquality().hash([dosage, name, dateTime]);
}

RemainderStruct createRemainderStruct({
  String? dosage,
  String? name,
  DateTime? dateTime,
}) =>
    RemainderStruct(
      dosage: dosage,
      name: name,
      dateTime: dateTime,
    );
