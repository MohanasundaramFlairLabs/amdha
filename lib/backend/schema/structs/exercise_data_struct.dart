// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseDataStruct extends BaseStruct {
  ExerciseDataStruct({
    String? exerciseType,
    String? time,
    String? duration,
  })  : _exerciseType = exerciseType,
        _time = time,
        _duration = duration;

  // "exerciseType" field.
  String? _exerciseType;
  String get exerciseType => _exerciseType ?? '';
  set exerciseType(String? val) => _exerciseType = val;

  bool hasExerciseType() => _exerciseType != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  static ExerciseDataStruct fromMap(Map<String, dynamic> data) =>
      ExerciseDataStruct(
        exerciseType: data['exerciseType'] as String?,
        time: data['time'] as String?,
        duration: data['duration'] as String?,
      );

  static ExerciseDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ExerciseDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'exerciseType': _exerciseType,
        'time': _time,
        'duration': _duration,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exerciseType': serializeParam(
          _exerciseType,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExerciseDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExerciseDataStruct(
        exerciseType: deserializeParam(
          data['exerciseType'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExerciseDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExerciseDataStruct &&
        exerciseType == other.exerciseType &&
        time == other.time &&
        duration == other.duration;
  }

  @override
  int get hashCode => const ListEquality().hash([exerciseType, time, duration]);
}

ExerciseDataStruct createExerciseDataStruct({
  String? exerciseType,
  String? time,
  String? duration,
}) =>
    ExerciseDataStruct(
      exerciseType: exerciseType,
      time: time,
      duration: duration,
    );
