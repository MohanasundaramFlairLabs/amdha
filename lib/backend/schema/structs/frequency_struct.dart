// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FrequencyStruct extends BaseStruct {
  FrequencyStruct({
    String? often,
    bool? isSelected,
  })  : _often = often,
        _isSelected = isSelected;

  // "often" field.
  String? _often;
  String get often => _often ?? '';
  set often(String? val) => _often = val;

  bool hasOften() => _often != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;

  bool hasIsSelected() => _isSelected != null;

  static FrequencyStruct fromMap(Map<String, dynamic> data) => FrequencyStruct(
        often: data['often'] as String?,
        isSelected: data['isSelected'] as bool?,
      );

  static FrequencyStruct? maybeFromMap(dynamic data) => data is Map
      ? FrequencyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'often': _often,
        'isSelected': _isSelected,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'often': serializeParam(
          _often,
          ParamType.String,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FrequencyStruct fromSerializableMap(Map<String, dynamic> data) =>
      FrequencyStruct(
        often: deserializeParam(
          data['often'],
          ParamType.String,
          false,
        ),
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FrequencyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FrequencyStruct &&
        often == other.often &&
        isSelected == other.isSelected;
  }

  @override
  int get hashCode => const ListEquality().hash([often, isSelected]);
}

FrequencyStruct createFrequencyStruct({
  String? often,
  bool? isSelected,
}) =>
    FrequencyStruct(
      often: often,
      isSelected: isSelected,
    );
