// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LineDataStruct extends BaseStruct {
  LineDataStruct({
    List<double>? data,
  }) : _data = data;

  // "data" field.
  List<double>? _data;
  List<double> get data => _data ?? const [];
  set data(List<double>? val) => _data = val;

  void updateData(Function(List<double>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static LineDataStruct fromMap(Map<String, dynamic> data) => LineDataStruct(
        data: getDataList(data['data']),
      );

  static LineDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? LineDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'data': _data,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.double,
          isList: true,
        ),
      }.withoutNulls;

  static LineDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      LineDataStruct(
        data: deserializeParam<double>(
          data['data'],
          ParamType.double,
          true,
        ),
      );

  @override
  String toString() => 'LineDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LineDataStruct && listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

LineDataStruct createLineDataStruct() => LineDataStruct();
