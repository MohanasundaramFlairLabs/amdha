// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AggregationStructStruct extends BaseStruct {
  AggregationStructStruct({
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

  static AggregationStructStruct fromMap(Map<String, dynamic> data) =>
      AggregationStructStruct(
        data: getDataList(data['data']),
      );

  static AggregationStructStruct? maybeFromMap(dynamic data) => data is Map
      ? AggregationStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static AggregationStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AggregationStructStruct(
        data: deserializeParam<double>(
          data['data'],
          ParamType.double,
          true,
        ),
      );

  @override
  String toString() => 'AggregationStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AggregationStructStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

AggregationStructStruct createAggregationStructStruct() =>
    AggregationStructStruct();
