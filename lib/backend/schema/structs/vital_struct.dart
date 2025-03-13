// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VitalStruct extends BaseStruct {
  VitalStruct({
    String? goal,
    List<VitalsStruct>? history,
  })  : _goal = goal,
        _history = history;

  // "goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  set goal(String? val) => _goal = val;

  bool hasGoal() => _goal != null;

  // "history" field.
  List<VitalsStruct>? _history;
  List<VitalsStruct> get history => _history ?? const [];
  set history(List<VitalsStruct>? val) => _history = val;

  void updateHistory(Function(List<VitalsStruct>) updateFn) {
    updateFn(_history ??= []);
  }

  bool hasHistory() => _history != null;

  static VitalStruct fromMap(Map<String, dynamic> data) => VitalStruct(
        goal: data['goal'] as String?,
        history: getStructList(
          data['history'],
          VitalsStruct.fromMap,
        ),
      );

  static VitalStruct? maybeFromMap(dynamic data) =>
      data is Map ? VitalStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'goal': _goal,
        'history': _history?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'goal': serializeParam(
          _goal,
          ParamType.String,
        ),
        'history': serializeParam(
          _history,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static VitalStruct fromSerializableMap(Map<String, dynamic> data) =>
      VitalStruct(
        goal: deserializeParam(
          data['goal'],
          ParamType.String,
          false,
        ),
        history: deserializeStructParam<VitalsStruct>(
          data['history'],
          ParamType.DataStruct,
          true,
          structBuilder: VitalsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'VitalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VitalStruct &&
        goal == other.goal &&
        listEquality.equals(history, other.history);
  }

  @override
  int get hashCode => const ListEquality().hash([goal, history]);
}

VitalStruct createVitalStruct({
  String? goal,
}) =>
    VitalStruct(
      goal: goal,
    );
