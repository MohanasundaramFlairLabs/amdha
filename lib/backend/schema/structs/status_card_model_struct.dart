// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusCardModelStruct extends BaseStruct {
  StatusCardModelStruct({
    Color? color,
    String? unit,
    String? icon,
    String? label,
    Color? iconColor,
    String? range,
  })  : _color = color,
        _unit = unit,
        _icon = icon,
        _label = label,
        _iconColor = iconColor,
        _range = range;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "iconColor" field.
  Color? _iconColor;
  Color? get iconColor => _iconColor;
  set iconColor(Color? val) => _iconColor = val;

  bool hasIconColor() => _iconColor != null;

  // "range" field.
  String? _range;
  String get range => _range ?? '';
  set range(String? val) => _range = val;

  bool hasRange() => _range != null;

  static StatusCardModelStruct fromMap(Map<String, dynamic> data) =>
      StatusCardModelStruct(
        color: getSchemaColor(data['color']),
        unit: data['unit'] as String?,
        icon: data['icon'] as String?,
        label: data['label'] as String?,
        iconColor: getSchemaColor(data['iconColor']),
        range: data['range'] as String?,
      );

  static StatusCardModelStruct? maybeFromMap(dynamic data) => data is Map
      ? StatusCardModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'color': _color,
        'unit': _unit,
        'icon': _icon,
        'label': _label,
        'iconColor': _iconColor,
        'range': _range,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'iconColor': serializeParam(
          _iconColor,
          ParamType.Color,
        ),
        'range': serializeParam(
          _range,
          ParamType.String,
        ),
      }.withoutNulls;

  static StatusCardModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatusCardModelStruct(
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        iconColor: deserializeParam(
          data['iconColor'],
          ParamType.Color,
          false,
        ),
        range: deserializeParam(
          data['range'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StatusCardModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusCardModelStruct &&
        color == other.color &&
        unit == other.unit &&
        icon == other.icon &&
        label == other.label &&
        iconColor == other.iconColor &&
        range == other.range;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([color, unit, icon, label, iconColor, range]);
}

StatusCardModelStruct createStatusCardModelStruct({
  Color? color,
  String? unit,
  String? icon,
  String? label,
  Color? iconColor,
  String? range,
}) =>
    StatusCardModelStruct(
      color: color,
      unit: unit,
      icon: icon,
      label: label,
      iconColor: iconColor,
      range: range,
    );
