// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SlotsStruct extends BaseStruct {
  SlotsStruct({
    String? start,
    String? end,
    String? status,
    String? reason,
  })  : _start = start,
        _end = end,
        _status = status,
        _reason = reason;

  // "start" field.
  String? _start;
  String get start => _start ?? '';
  set start(String? val) => _start = val;

  bool hasStart() => _start != null;

  // "end" field.
  String? _end;
  String get end => _end ?? '';
  set end(String? val) => _end = val;

  bool hasEnd() => _end != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  set reason(String? val) => _reason = val;

  bool hasReason() => _reason != null;

  static SlotsStruct fromMap(Map<String, dynamic> data) => SlotsStruct(
        start: data['start'] as String?,
        end: data['end'] as String?,
        status: data['status'] as String?,
        reason: data['reason'] as String?,
      );

  static SlotsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SlotsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'start': _start,
        'end': _end,
        'status': _status,
        'reason': _reason,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'start': serializeParam(
          _start,
          ParamType.String,
        ),
        'end': serializeParam(
          _end,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'reason': serializeParam(
          _reason,
          ParamType.String,
        ),
      }.withoutNulls;

  static SlotsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SlotsStruct(
        start: deserializeParam(
          data['start'],
          ParamType.String,
          false,
        ),
        end: deserializeParam(
          data['end'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        reason: deserializeParam(
          data['reason'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SlotsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SlotsStruct &&
        start == other.start &&
        end == other.end &&
        status == other.status &&
        reason == other.reason;
  }

  @override
  int get hashCode => const ListEquality().hash([start, end, status, reason]);
}

SlotsStruct createSlotsStruct({
  String? start,
  String? end,
  String? status,
  String? reason,
}) =>
    SlotsStruct(
      start: start,
      end: end,
      status: status,
      reason: reason,
    );
