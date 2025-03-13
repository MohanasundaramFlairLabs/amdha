// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecommendationColorsStruct extends BaseStruct {
  RecommendationColorsStruct({
    Color? primary,
    Color? secondary,
  })  : _primary = primary,
        _secondary = secondary;

  // "primary" field.
  Color? _primary;
  Color? get primary => _primary;
  set primary(Color? val) => _primary = val;

  bool hasPrimary() => _primary != null;

  // "secondary" field.
  Color? _secondary;
  Color? get secondary => _secondary;
  set secondary(Color? val) => _secondary = val;

  bool hasSecondary() => _secondary != null;

  static RecommendationColorsStruct fromMap(Map<String, dynamic> data) =>
      RecommendationColorsStruct(
        primary: getSchemaColor(data['primary']),
        secondary: getSchemaColor(data['secondary']),
      );

  static RecommendationColorsStruct? maybeFromMap(dynamic data) => data is Map
      ? RecommendationColorsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'primary': _primary,
        'secondary': _secondary,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'primary': serializeParam(
          _primary,
          ParamType.Color,
        ),
        'secondary': serializeParam(
          _secondary,
          ParamType.Color,
        ),
      }.withoutNulls;

  static RecommendationColorsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RecommendationColorsStruct(
        primary: deserializeParam(
          data['primary'],
          ParamType.Color,
          false,
        ),
        secondary: deserializeParam(
          data['secondary'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'RecommendationColorsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecommendationColorsStruct &&
        primary == other.primary &&
        secondary == other.secondary;
  }

  @override
  int get hashCode => const ListEquality().hash([primary, secondary]);
}

RecommendationColorsStruct createRecommendationColorsStruct({
  Color? primary,
  Color? secondary,
}) =>
    RecommendationColorsStruct(
      primary: primary,
      secondary: secondary,
    );
