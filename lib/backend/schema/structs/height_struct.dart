// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HeightStruct extends BaseStruct {
  HeightStruct({
    String? color,
    String? icon,
    String? unit,
  })  : _color = color,
        _icon = icon,
        _unit = unit;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;

  bool hasColor() => _color != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  static HeightStruct fromMap(Map<String, dynamic> data) => HeightStruct(
        color: data['color'] as String?,
        icon: data['icon'] as String?,
        unit: data['unit'] as String?,
      );

  static HeightStruct? maybeFromMap(dynamic data) =>
      data is Map ? HeightStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'color': _color,
        'icon': _icon,
        'unit': _unit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
      }.withoutNulls;

  static HeightStruct fromSerializableMap(Map<String, dynamic> data) =>
      HeightStruct(
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
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
  String toString() => 'HeightStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HeightStruct &&
        color == other.color &&
        icon == other.icon &&
        unit == other.unit;
  }

  @override
  int get hashCode => const ListEquality().hash([color, icon, unit]);
}

HeightStruct createHeightStruct({
  String? color,
  String? icon,
  String? unit,
}) =>
    HeightStruct(
      color: color,
      icon: icon,
      unit: unit,
    );
