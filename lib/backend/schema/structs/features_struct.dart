// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeaturesStruct extends BaseStruct {
  FeaturesStruct({
    String? featureName,
    String? description,
  })  : _featureName = featureName,
        _description = description;

  // "feature_name" field.
  String? _featureName;
  String get featureName => _featureName ?? '';
  set featureName(String? val) => _featureName = val;

  bool hasFeatureName() => _featureName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static FeaturesStruct fromMap(Map<String, dynamic> data) => FeaturesStruct(
        featureName: data['feature_name'] as String?,
        description: data['description'] as String?,
      );

  static FeaturesStruct? maybeFromMap(dynamic data) =>
      data is Map ? FeaturesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'feature_name': _featureName,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'feature_name': serializeParam(
          _featureName,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static FeaturesStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeaturesStruct(
        featureName: deserializeParam(
          data['feature_name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FeaturesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeaturesStruct &&
        featureName == other.featureName &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([featureName, description]);
}

FeaturesStruct createFeaturesStruct({
  String? featureName,
  String? description,
}) =>
    FeaturesStruct(
      featureName: featureName,
      description: description,
    );
