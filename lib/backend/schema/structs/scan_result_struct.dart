// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScanResultStruct extends BaseStruct {
  ScanResultStruct({
    String? label,
    QueryResultStruct? value,
  })  : _label = label,
        _value = value;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "value" field.
  QueryResultStruct? _value;
  QueryResultStruct get value => _value ?? QueryResultStruct();
  set value(QueryResultStruct? val) => _value = val;

  void updateValue(Function(QueryResultStruct) updateFn) {
    updateFn(_value ??= QueryResultStruct());
  }

  bool hasValue() => _value != null;

  static ScanResultStruct fromMap(Map<String, dynamic> data) =>
      ScanResultStruct(
        label: data['label'] as String?,
        value: data['value'] is QueryResultStruct
            ? data['value']
            : QueryResultStruct.maybeFromMap(data['value']),
      );

  static ScanResultStruct? maybeFromMap(dynamic data) => data is Map
      ? ScanResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'value': _value?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ScanResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScanResultStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        value: deserializeStructParam(
          data['value'],
          ParamType.DataStruct,
          false,
          structBuilder: QueryResultStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ScanResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScanResultStruct &&
        label == other.label &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([label, value]);
}

ScanResultStruct createScanResultStruct({
  String? label,
  QueryResultStruct? value,
}) =>
    ScanResultStruct(
      label: label,
      value: value ?? QueryResultStruct(),
    );
