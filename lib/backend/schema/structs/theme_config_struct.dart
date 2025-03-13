// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThemeConfigStruct extends BaseStruct {
  ThemeConfigStruct({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroudPrimaryColor,
    Color? darkSecondaryColor,
  })  : _primaryColor = primaryColor,
        _secondaryColor = secondaryColor,
        _backgroudPrimaryColor = backgroudPrimaryColor,
        _darkSecondaryColor = darkSecondaryColor;

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

  // "backgroudPrimaryColor" field.
  Color? _backgroudPrimaryColor;
  Color? get backgroudPrimaryColor => _backgroudPrimaryColor;
  set backgroudPrimaryColor(Color? val) => _backgroudPrimaryColor = val;

  bool hasBackgroudPrimaryColor() => _backgroudPrimaryColor != null;

  // "darkSecondaryColor" field.
  Color? _darkSecondaryColor;
  Color? get darkSecondaryColor => _darkSecondaryColor;
  set darkSecondaryColor(Color? val) => _darkSecondaryColor = val;

  bool hasDarkSecondaryColor() => _darkSecondaryColor != null;

  static ThemeConfigStruct fromMap(Map<String, dynamic> data) =>
      ThemeConfigStruct(
        primaryColor: getSchemaColor(data['primaryColor']),
        secondaryColor: getSchemaColor(data['secondaryColor']),
        backgroudPrimaryColor: getSchemaColor(data['backgroudPrimaryColor']),
        darkSecondaryColor: getSchemaColor(data['darkSecondaryColor']),
      );

  static ThemeConfigStruct? maybeFromMap(dynamic data) => data is Map
      ? ThemeConfigStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'primaryColor': _primaryColor,
        'secondaryColor': _secondaryColor,
        'backgroudPrimaryColor': _backgroudPrimaryColor,
        'darkSecondaryColor': _darkSecondaryColor,
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
        'backgroudPrimaryColor': serializeParam(
          _backgroudPrimaryColor,
          ParamType.Color,
        ),
        'darkSecondaryColor': serializeParam(
          _darkSecondaryColor,
          ParamType.Color,
        ),
      }.withoutNulls;

  static ThemeConfigStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThemeConfigStruct(
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
        backgroudPrimaryColor: deserializeParam(
          data['backgroudPrimaryColor'],
          ParamType.Color,
          false,
        ),
        darkSecondaryColor: deserializeParam(
          data['darkSecondaryColor'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'ThemeConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThemeConfigStruct &&
        primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor &&
        backgroudPrimaryColor == other.backgroudPrimaryColor &&
        darkSecondaryColor == other.darkSecondaryColor;
  }

  @override
  int get hashCode => const ListEquality().hash([
        primaryColor,
        secondaryColor,
        backgroudPrimaryColor,
        darkSecondaryColor
      ]);
}

ThemeConfigStruct createThemeConfigStruct({
  Color? primaryColor,
  Color? secondaryColor,
  Color? backgroudPrimaryColor,
  Color? darkSecondaryColor,
}) =>
    ThemeConfigStruct(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      backgroudPrimaryColor: backgroudPrimaryColor,
      darkSecondaryColor: darkSecondaryColor,
    );
