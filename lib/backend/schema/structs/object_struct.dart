// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ObjectStruct extends BaseStruct {
  ObjectStruct({
    String? bpSys,
    String? bpDia,
    String? hours,
    String? minutes,
  })  : _bpSys = bpSys,
        _bpDia = bpDia,
        _hours = hours,
        _minutes = minutes;

  // "bp_sys" field.
  String? _bpSys;
  String get bpSys => _bpSys ?? '';
  set bpSys(String? val) => _bpSys = val;

  bool hasBpSys() => _bpSys != null;

  // "bp_dia" field.
  String? _bpDia;
  String get bpDia => _bpDia ?? '';
  set bpDia(String? val) => _bpDia = val;

  bool hasBpDia() => _bpDia != null;

  // "hours" field.
  String? _hours;
  String get hours => _hours ?? '';
  set hours(String? val) => _hours = val;

  bool hasHours() => _hours != null;

  // "minutes" field.
  String? _minutes;
  String get minutes => _minutes ?? '';
  set minutes(String? val) => _minutes = val;

  bool hasMinutes() => _minutes != null;

  static ObjectStruct fromMap(Map<String, dynamic> data) => ObjectStruct(
        bpSys: data['bp_sys'] as String?,
        bpDia: data['bp_dia'] as String?,
        hours: data['hours'] as String?,
        minutes: data['minutes'] as String?,
      );

  static ObjectStruct? maybeFromMap(dynamic data) =>
      data is Map ? ObjectStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'bp_sys': _bpSys,
        'bp_dia': _bpDia,
        'hours': _hours,
        'minutes': _minutes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bp_sys': serializeParam(
          _bpSys,
          ParamType.String,
        ),
        'bp_dia': serializeParam(
          _bpDia,
          ParamType.String,
        ),
        'hours': serializeParam(
          _hours,
          ParamType.String,
        ),
        'minutes': serializeParam(
          _minutes,
          ParamType.String,
        ),
      }.withoutNulls;

  static ObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      ObjectStruct(
        bpSys: deserializeParam(
          data['bp_sys'],
          ParamType.String,
          false,
        ),
        bpDia: deserializeParam(
          data['bp_dia'],
          ParamType.String,
          false,
        ),
        hours: deserializeParam(
          data['hours'],
          ParamType.String,
          false,
        ),
        minutes: deserializeParam(
          data['minutes'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ObjectStruct &&
        bpSys == other.bpSys &&
        bpDia == other.bpDia &&
        hours == other.hours &&
        minutes == other.minutes;
  }

  @override
  int get hashCode => const ListEquality().hash([bpSys, bpDia, hours, minutes]);
}

ObjectStruct createObjectStruct({
  String? bpSys,
  String? bpDia,
  String? hours,
  String? minutes,
}) =>
    ObjectStruct(
      bpSys: bpSys,
      bpDia: bpDia,
      hours: hours,
      minutes: minutes,
    );
