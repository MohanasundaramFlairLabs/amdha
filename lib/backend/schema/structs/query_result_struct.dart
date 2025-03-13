// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QueryResultStruct extends BaseStruct {
  QueryResultStruct({
    String? result,
    String? unit,
  })  : _result = result,
        _unit = unit;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  set result(String? val) => _result = val;

  bool hasResult() => _result != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  static QueryResultStruct fromMap(Map<String, dynamic> data) =>
      QueryResultStruct(
        result: data['result'] as String?,
        unit: data['unit'] as String?,
      );

  static QueryResultStruct? maybeFromMap(dynamic data) => data is Map
      ? QueryResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'result': _result,
        'unit': _unit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'result': serializeParam(
          _result,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
      }.withoutNulls;

  static QueryResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      QueryResultStruct(
        result: deserializeParam(
          data['result'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QueryResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QueryResultStruct &&
        result == other.result &&
        unit == other.unit;
  }

  @override
  int get hashCode => const ListEquality().hash([result, unit]);
}

QueryResultStruct createQueryResultStruct({
  String? result,
  String? unit,
}) =>
    QueryResultStruct(
      result: result,
      unit: unit,
    );
