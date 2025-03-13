// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FrequencyDateStruct extends BaseStruct {
  FrequencyDateStruct({
    String? morning,
    String? afternoon,
    String? evening,
    String? night,
  })  : _morning = morning,
        _afternoon = afternoon,
        _evening = evening,
        _night = night;

  // "Morning" field.
  String? _morning;
  String get morning => _morning ?? '';
  set morning(String? val) => _morning = val;

  bool hasMorning() => _morning != null;

  // "Afternoon" field.
  String? _afternoon;
  String get afternoon => _afternoon ?? '';
  set afternoon(String? val) => _afternoon = val;

  bool hasAfternoon() => _afternoon != null;

  // "Evening" field.
  String? _evening;
  String get evening => _evening ?? '';
  set evening(String? val) => _evening = val;

  bool hasEvening() => _evening != null;

  // "Night" field.
  String? _night;
  String get night => _night ?? '';
  set night(String? val) => _night = val;

  bool hasNight() => _night != null;

  static FrequencyDateStruct fromMap(Map<String, dynamic> data) =>
      FrequencyDateStruct(
        morning: data['Morning'] as String?,
        afternoon: data['Afternoon'] as String?,
        evening: data['Evening'] as String?,
        night: data['Night'] as String?,
      );

  static FrequencyDateStruct? maybeFromMap(dynamic data) => data is Map
      ? FrequencyDateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Morning': _morning,
        'Afternoon': _afternoon,
        'Evening': _evening,
        'Night': _night,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Morning': serializeParam(
          _morning,
          ParamType.String,
        ),
        'Afternoon': serializeParam(
          _afternoon,
          ParamType.String,
        ),
        'Evening': serializeParam(
          _evening,
          ParamType.String,
        ),
        'Night': serializeParam(
          _night,
          ParamType.String,
        ),
      }.withoutNulls;

  static FrequencyDateStruct fromSerializableMap(Map<String, dynamic> data) =>
      FrequencyDateStruct(
        morning: deserializeParam(
          data['Morning'],
          ParamType.String,
          false,
        ),
        afternoon: deserializeParam(
          data['Afternoon'],
          ParamType.String,
          false,
        ),
        evening: deserializeParam(
          data['Evening'],
          ParamType.String,
          false,
        ),
        night: deserializeParam(
          data['Night'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FrequencyDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FrequencyDateStruct &&
        morning == other.morning &&
        afternoon == other.afternoon &&
        evening == other.evening &&
        night == other.night;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([morning, afternoon, evening, night]);
}

FrequencyDateStruct createFrequencyDateStruct({
  String? morning,
  String? afternoon,
  String? evening,
  String? night,
}) =>
    FrequencyDateStruct(
      morning: morning,
      afternoon: afternoon,
      evening: evening,
      night: night,
    );
