// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WellbeingScoreStruct extends BaseStruct {
  WellbeingScoreStruct({
    String? internalId,
    String? externalId,
    String? type,
    String? date,
    String? time,
    String? note,
    String? entryType,
    String? value,
  })  : _internalId = internalId,
        _externalId = externalId,
        _type = type,
        _date = date,
        _time = time,
        _note = note,
        _entryType = entryType,
        _value = value;

  // "internalId" field.
  String? _internalId;
  String get internalId => _internalId ?? '';
  set internalId(String? val) => _internalId = val;

  bool hasInternalId() => _internalId != null;

  // "externalId" field.
  String? _externalId;
  String get externalId => _externalId ?? '';
  set externalId(String? val) => _externalId = val;

  bool hasExternalId() => _externalId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "entryType" field.
  String? _entryType;
  String get entryType => _entryType ?? '';
  set entryType(String? val) => _entryType = val;

  bool hasEntryType() => _entryType != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static WellbeingScoreStruct fromMap(Map<String, dynamic> data) =>
      WellbeingScoreStruct(
        internalId: data['internalId'] as String?,
        externalId: data['externalId'] as String?,
        type: data['type'] as String?,
        date: data['date'] as String?,
        time: data['time'] as String?,
        note: data['note'] as String?,
        entryType: data['entryType'] as String?,
        value: data['value'] as String?,
      );

  static WellbeingScoreStruct? maybeFromMap(dynamic data) => data is Map
      ? WellbeingScoreStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'internalId': _internalId,
        'externalId': _externalId,
        'type': _type,
        'date': _date,
        'time': _time,
        'note': _note,
        'entryType': _entryType,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'internalId': serializeParam(
          _internalId,
          ParamType.String,
        ),
        'externalId': serializeParam(
          _externalId,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'entryType': serializeParam(
          _entryType,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static WellbeingScoreStruct fromSerializableMap(Map<String, dynamic> data) =>
      WellbeingScoreStruct(
        internalId: deserializeParam(
          data['internalId'],
          ParamType.String,
          false,
        ),
        externalId: deserializeParam(
          data['externalId'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        entryType: deserializeParam(
          data['entryType'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WellbeingScoreStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WellbeingScoreStruct &&
        internalId == other.internalId &&
        externalId == other.externalId &&
        type == other.type &&
        date == other.date &&
        time == other.time &&
        note == other.note &&
        entryType == other.entryType &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([internalId, externalId, type, date, time, note, entryType, value]);
}

WellbeingScoreStruct createWellbeingScoreStruct({
  String? internalId,
  String? externalId,
  String? type,
  String? date,
  String? time,
  String? note,
  String? entryType,
  String? value,
}) =>
    WellbeingScoreStruct(
      internalId: internalId,
      externalId: externalId,
      type: type,
      date: date,
      time: time,
      note: note,
      entryType: entryType,
      value: value,
    );
