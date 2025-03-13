// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeatureModelStruct extends BaseStruct {
  FeatureModelStruct({
    bool? available,
  }) : _available = available;

  // "available" field.
  bool? _available;
  bool get available => _available ?? false;
  set available(bool? val) => _available = val;

  bool hasAvailable() => _available != null;

  static FeatureModelStruct fromMap(Map<String, dynamic> data) =>
      FeatureModelStruct(
        available: data['available'] as bool?,
      );

  static FeatureModelStruct? maybeFromMap(dynamic data) => data is Map
      ? FeatureModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'available': _available,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'available': serializeParam(
          _available,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FeatureModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeatureModelStruct(
        available: deserializeParam(
          data['available'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FeatureModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeatureModelStruct && available == other.available;
  }

  @override
  int get hashCode => const ListEquality().hash([available]);
}

FeatureModelStruct createFeatureModelStruct({
  bool? available,
}) =>
    FeatureModelStruct(
      available: available,
    );
