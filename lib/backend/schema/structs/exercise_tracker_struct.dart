// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseTrackerStruct extends BaseStruct {
  ExerciseTrackerStruct({
    List<ExerciseDataStruct>? exerciseData,
  }) : _exerciseData = exerciseData;

  // "exerciseData" field.
  List<ExerciseDataStruct>? _exerciseData;
  List<ExerciseDataStruct> get exerciseData => _exerciseData ?? const [];
  set exerciseData(List<ExerciseDataStruct>? val) => _exerciseData = val;

  void updateExerciseData(Function(List<ExerciseDataStruct>) updateFn) {
    updateFn(_exerciseData ??= []);
  }

  bool hasExerciseData() => _exerciseData != null;

  static ExerciseTrackerStruct fromMap(Map<String, dynamic> data) =>
      ExerciseTrackerStruct(
        exerciseData: getStructList(
          data['exerciseData'],
          ExerciseDataStruct.fromMap,
        ),
      );

  static ExerciseTrackerStruct? maybeFromMap(dynamic data) => data is Map
      ? ExerciseTrackerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'exerciseData': _exerciseData?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exerciseData': serializeParam(
          _exerciseData,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ExerciseTrackerStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExerciseTrackerStruct(
        exerciseData: deserializeStructParam<ExerciseDataStruct>(
          data['exerciseData'],
          ParamType.DataStruct,
          true,
          structBuilder: ExerciseDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ExerciseTrackerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ExerciseTrackerStruct &&
        listEquality.equals(exerciseData, other.exerciseData);
  }

  @override
  int get hashCode => const ListEquality().hash([exerciseData]);
}

ExerciseTrackerStruct createExerciseTrackerStruct() => ExerciseTrackerStruct();
