// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskModelStruct extends BaseStruct {
  TaskModelStruct({
    List<TasksStruct>? tasks,
  }) : _tasks = tasks;

  // "tasks" field.
  List<TasksStruct>? _tasks;
  List<TasksStruct> get tasks => _tasks ?? const [];
  set tasks(List<TasksStruct>? val) => _tasks = val;

  void updateTasks(Function(List<TasksStruct>) updateFn) {
    updateFn(_tasks ??= []);
  }

  bool hasTasks() => _tasks != null;

  static TaskModelStruct fromMap(Map<String, dynamic> data) => TaskModelStruct(
        tasks: getStructList(
          data['tasks'],
          TasksStruct.fromMap,
        ),
      );

  static TaskModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TaskModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tasks': _tasks?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tasks': serializeParam(
          _tasks,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TaskModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskModelStruct(
        tasks: deserializeStructParam<TasksStruct>(
          data['tasks'],
          ParamType.DataStruct,
          true,
          structBuilder: TasksStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TaskModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TaskModelStruct && listEquality.equals(tasks, other.tasks);
  }

  @override
  int get hashCode => const ListEquality().hash([tasks]);
}

TaskModelStruct createTaskModelStruct() => TaskModelStruct();
