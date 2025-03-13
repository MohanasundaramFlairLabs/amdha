// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AggregationStruct extends BaseStruct {
  AggregationStruct({
    String? type,
    List<AggregateStruct>? value,
    List<AggregateStruct>? values,
  })  : _type = type,
        _value = value,
        _values = values;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "value" field.
  List<AggregateStruct>? _value;
  List<AggregateStruct> get value => _value ?? const [];
  set value(List<AggregateStruct>? val) => _value = val;

  void updateValue(Function(List<AggregateStruct>) updateFn) {
    updateFn(_value ??= []);
  }

  bool hasValue() => _value != null;

  // "values" field.
  List<AggregateStruct>? _values;
  List<AggregateStruct> get values => _values ?? const [];
  set values(List<AggregateStruct>? val) => _values = val;

  void updateValues(Function(List<AggregateStruct>) updateFn) {
    updateFn(_values ??= []);
  }

  bool hasValues() => _values != null;

  static AggregationStruct fromMap(Map<String, dynamic> data) =>
      AggregationStruct(
        type: data['type'] as String?,
        value: getStructList(
          data['value'],
          AggregateStruct.fromMap,
        ),
        values: getStructList(
          data['values'],
          AggregateStruct.fromMap,
        ),
      );

  static AggregationStruct? maybeFromMap(dynamic data) => data is Map
      ? AggregationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'value': _value?.map((e) => e.toMap()).toList(),
        'values': _values?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.DataStruct,
          isList: true,
        ),
        'values': serializeParam(
          _values,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AggregationStruct fromSerializableMap(Map<String, dynamic> data) =>
      AggregationStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        value: deserializeStructParam<AggregateStruct>(
          data['value'],
          ParamType.DataStruct,
          true,
          structBuilder: AggregateStruct.fromSerializableMap,
        ),
        values: deserializeStructParam<AggregateStruct>(
          data['values'],
          ParamType.DataStruct,
          true,
          structBuilder: AggregateStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AggregationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AggregationStruct &&
        type == other.type &&
        listEquality.equals(value, other.value) &&
        listEquality.equals(values, other.values);
  }

  @override
  int get hashCode => const ListEquality().hash([type, value, values]);
}

AggregationStruct createAggregationStruct({
  String? type,
}) =>
    AggregationStruct(
      type: type,
    );
