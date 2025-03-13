// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DomainDataStruct extends BaseStruct {
  DomainDataStruct({
    String? reason,
    String? cancellationReason,
  })  : _reason = reason,
        _cancellationReason = cancellationReason;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  set reason(String? val) => _reason = val;

  bool hasReason() => _reason != null;

  // "cancellationReason" field.
  String? _cancellationReason;
  String get cancellationReason => _cancellationReason ?? '';
  set cancellationReason(String? val) => _cancellationReason = val;

  bool hasCancellationReason() => _cancellationReason != null;

  static DomainDataStruct fromMap(Map<String, dynamic> data) =>
      DomainDataStruct(
        reason: data['reason'] as String?,
        cancellationReason: data['cancellationReason'] as String?,
      );

  static DomainDataStruct? maybeFromMap(dynamic data) => data is Map
      ? DomainDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'reason': _reason,
        'cancellationReason': _cancellationReason,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'reason': serializeParam(
          _reason,
          ParamType.String,
        ),
        'cancellationReason': serializeParam(
          _cancellationReason,
          ParamType.String,
        ),
      }.withoutNulls;

  static DomainDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      DomainDataStruct(
        reason: deserializeParam(
          data['reason'],
          ParamType.String,
          false,
        ),
        cancellationReason: deserializeParam(
          data['cancellationReason'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DomainDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DomainDataStruct &&
        reason == other.reason &&
        cancellationReason == other.cancellationReason;
  }

  @override
  int get hashCode => const ListEquality().hash([reason, cancellationReason]);
}

DomainDataStruct createDomainDataStruct({
  String? reason,
  String? cancellationReason,
}) =>
    DomainDataStruct(
      reason: reason,
      cancellationReason: cancellationReason,
    );
