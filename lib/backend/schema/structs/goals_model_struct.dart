// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalsModelStruct extends BaseStruct {
  GoalsModelStruct({
    int? status,
    List<GoalsListStruct>? data,
  })  : _status = status,
        _data = data;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "data" field.
  List<GoalsListStruct>? _data;
  List<GoalsListStruct> get data => _data ?? const [];
  set data(List<GoalsListStruct>? val) => _data = val;

  void updateData(Function(List<GoalsListStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static GoalsModelStruct fromMap(Map<String, dynamic> data) =>
      GoalsModelStruct(
        status: castToType<int>(data['status']),
        data: getStructList(
          data['data'],
          GoalsListStruct.fromMap,
        ),
      );

  static GoalsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? GoalsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static GoalsModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      GoalsModelStruct(
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        data: deserializeStructParam<GoalsListStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: GoalsListStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'GoalsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GoalsModelStruct &&
        status == other.status &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([status, data]);
}

GoalsModelStruct createGoalsModelStruct({
  int? status,
}) =>
    GoalsModelStruct(
      status: status,
    );
