// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColorPairStruct extends BaseStruct {
  ColorPairStruct({
    Color? primaryColor,
    Color? secondaryColor,
  })  : _primaryColor = primaryColor,
        _secondaryColor = secondaryColor;

  // "primaryColor" field.
  Color? _primaryColor;
  Color? get primaryColor => _primaryColor;
  set primaryColor(Color? val) => _primaryColor = val;

  bool hasPrimaryColor() => _primaryColor != null;

  // "secondaryColor" field.
  Color? _secondaryColor;
  Color? get secondaryColor => _secondaryColor;
  set secondaryColor(Color? val) => _secondaryColor = val;

  bool hasSecondaryColor() => _secondaryColor != null;

  static ColorPairStruct fromMap(Map<String, dynamic> data) => ColorPairStruct(
        primaryColor: getSchemaColor(data['primaryColor']),
        secondaryColor: getSchemaColor(data['secondaryColor']),
      );

  static ColorPairStruct? maybeFromMap(dynamic data) => data is Map
      ? ColorPairStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'primaryColor': _primaryColor,
        'secondaryColor': _secondaryColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'primaryColor': serializeParam(
          _primaryColor,
          ParamType.Color,
        ),
        'secondaryColor': serializeParam(
          _secondaryColor,
          ParamType.Color,
        ),
      }.withoutNulls;

  static ColorPairStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColorPairStruct(
        primaryColor: deserializeParam(
          data['primaryColor'],
          ParamType.Color,
          false,
        ),
        secondaryColor: deserializeParam(
          data['secondaryColor'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'ColorPairStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColorPairStruct &&
        primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor;
  }

  @override
  int get hashCode => const ListEquality().hash([primaryColor, secondaryColor]);
}

ColorPairStruct createColorPairStruct({
  Color? primaryColor,
  Color? secondaryColor,
}) =>
    ColorPairStruct(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
    );
