// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarStruct extends BaseStruct {
  CalendarStruct({
    String? dayOfWeek,
    String? start,
    String? end,
    List<String>? breaks,
    String? id,
  })  : _dayOfWeek = dayOfWeek,
        _start = start,
        _end = end,
        _breaks = breaks,
        _id = id;

  // "dayOfWeek" field.
  String? _dayOfWeek;
  String get dayOfWeek => _dayOfWeek ?? '';
  set dayOfWeek(String? val) => _dayOfWeek = val;

  bool hasDayOfWeek() => _dayOfWeek != null;

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

  // "breaks" field.
  List<String>? _breaks;
  List<String> get breaks => _breaks ?? const [];
  set breaks(List<String>? val) => _breaks = val;

  void updateBreaks(Function(List<String>) updateFn) {
    updateFn(_breaks ??= []);
  }

  bool hasBreaks() => _breaks != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static CalendarStruct fromMap(Map<String, dynamic> data) => CalendarStruct(
        dayOfWeek: data['dayOfWeek'] as String?,
        start: data['start'] as String?,
        end: data['end'] as String?,
        breaks: getDataList(data['breaks']),
        id: data['id'] as String?,
      );

  static CalendarStruct? maybeFromMap(dynamic data) =>
      data is Map ? CalendarStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'dayOfWeek': _dayOfWeek,
        'start': _start,
        'end': _end,
        'breaks': _breaks,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dayOfWeek': serializeParam(
          _dayOfWeek,
          ParamType.String,
        ),
        'start': serializeParam(
          _start,
          ParamType.String,
        ),
        'end': serializeParam(
          _end,
          ParamType.String,
        ),
        'breaks': serializeParam(
          _breaks,
          ParamType.String,
          isList: true,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static CalendarStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalendarStruct(
        dayOfWeek: deserializeParam(
          data['dayOfWeek'],
          ParamType.String,
          false,
        ),
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
        breaks: deserializeParam<String>(
          data['breaks'],
          ParamType.String,
          true,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CalendarStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CalendarStruct &&
        dayOfWeek == other.dayOfWeek &&
        start == other.start &&
        end == other.end &&
        listEquality.equals(breaks, other.breaks) &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([dayOfWeek, start, end, breaks, id]);
}

CalendarStruct createCalendarStruct({
  String? dayOfWeek,
  String? start,
  String? end,
  String? id,
}) =>
    CalendarStruct(
      dayOfWeek: dayOfWeek,
      start: start,
      end: end,
      id: id,
    );
