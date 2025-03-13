// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WelcomePageStruct extends BaseStruct {
  WelcomePageStruct({
    String? feature,
    String? detail,
  })  : _feature = feature,
        _detail = detail;

  // "feature" field.
  String? _feature;
  String get feature => _feature ?? '';
  set feature(String? val) => _feature = val;

  bool hasFeature() => _feature != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  set detail(String? val) => _detail = val;

  bool hasDetail() => _detail != null;

  static WelcomePageStruct fromMap(Map<String, dynamic> data) =>
      WelcomePageStruct(
        feature: data['feature'] as String?,
        detail: data['detail'] as String?,
      );

  static WelcomePageStruct? maybeFromMap(dynamic data) => data is Map
      ? WelcomePageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'feature': _feature,
        'detail': _detail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'feature': serializeParam(
          _feature,
          ParamType.String,
        ),
        'detail': serializeParam(
          _detail,
          ParamType.String,
        ),
      }.withoutNulls;

  static WelcomePageStruct fromSerializableMap(Map<String, dynamic> data) =>
      WelcomePageStruct(
        feature: deserializeParam(
          data['feature'],
          ParamType.String,
          false,
        ),
        detail: deserializeParam(
          data['detail'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WelcomePageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WelcomePageStruct &&
        feature == other.feature &&
        detail == other.detail;
  }

  @override
  int get hashCode => const ListEquality().hash([feature, detail]);
}

WelcomePageStruct createWelcomePageStruct({
  String? feature,
  String? detail,
}) =>
    WelcomePageStruct(
      feature: feature,
      detail: detail,
    );
