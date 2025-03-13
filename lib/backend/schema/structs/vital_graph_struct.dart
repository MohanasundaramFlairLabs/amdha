// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VitalGraphStruct extends BaseStruct {
  VitalGraphStruct({
    String? goal,
    List<AggregationStruct>? aggregation,
    String? graph,
  })  : _goal = goal,
        _aggregation = aggregation,
        _graph = graph;

  // "goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  set goal(String? val) => _goal = val;

  bool hasGoal() => _goal != null;

  // "aggregation" field.
  List<AggregationStruct>? _aggregation;
  List<AggregationStruct> get aggregation => _aggregation ?? const [];
  set aggregation(List<AggregationStruct>? val) => _aggregation = val;

  void updateAggregation(Function(List<AggregationStruct>) updateFn) {
    updateFn(_aggregation ??= []);
  }

  bool hasAggregation() => _aggregation != null;

  // "graph" field.
  String? _graph;
  String get graph => _graph ?? '';
  set graph(String? val) => _graph = val;

  bool hasGraph() => _graph != null;

  static VitalGraphStruct fromMap(Map<String, dynamic> data) =>
      VitalGraphStruct(
        goal: data['goal'] as String?,
        aggregation: getStructList(
          data['aggregation'],
          AggregationStruct.fromMap,
        ),
        graph: data['graph'] as String?,
      );

  static VitalGraphStruct? maybeFromMap(dynamic data) => data is Map
      ? VitalGraphStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'goal': _goal,
        'aggregation': _aggregation?.map((e) => e.toMap()).toList(),
        'graph': _graph,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'goal': serializeParam(
          _goal,
          ParamType.String,
        ),
        'aggregation': serializeParam(
          _aggregation,
          ParamType.DataStruct,
          isList: true,
        ),
        'graph': serializeParam(
          _graph,
          ParamType.String,
        ),
      }.withoutNulls;

  static VitalGraphStruct fromSerializableMap(Map<String, dynamic> data) =>
      VitalGraphStruct(
        goal: deserializeParam(
          data['goal'],
          ParamType.String,
          false,
        ),
        aggregation: deserializeStructParam<AggregationStruct>(
          data['aggregation'],
          ParamType.DataStruct,
          true,
          structBuilder: AggregationStruct.fromSerializableMap,
        ),
        graph: deserializeParam(
          data['graph'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VitalGraphStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VitalGraphStruct &&
        goal == other.goal &&
        listEquality.equals(aggregation, other.aggregation) &&
        graph == other.graph;
  }

  @override
  int get hashCode => const ListEquality().hash([goal, aggregation, graph]);
}

VitalGraphStruct createVitalGraphStruct({
  String? goal,
  String? graph,
}) =>
    VitalGraphStruct(
      goal: goal,
      graph: graph,
    );
