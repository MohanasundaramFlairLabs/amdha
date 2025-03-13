// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScanHistoryStruct extends BaseStruct {
  ScanHistoryStruct({
    String? userId,
    String? featureId,
    String? featureName,
    String? quotaType,
    int? used,
    int? remaining,
    String? createdAt,
    String? updatedAt,
  })  : _userId = userId,
        _featureId = featureId,
        _featureName = featureName,
        _quotaType = quotaType,
        _used = used,
        _remaining = remaining,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "feature_id" field.
  String? _featureId;
  String get featureId => _featureId ?? '';
  set featureId(String? val) => _featureId = val;

  bool hasFeatureId() => _featureId != null;

  // "feature_name" field.
  String? _featureName;
  String get featureName => _featureName ?? '';
  set featureName(String? val) => _featureName = val;

  bool hasFeatureName() => _featureName != null;

  // "quota_type" field.
  String? _quotaType;
  String get quotaType => _quotaType ?? '';
  set quotaType(String? val) => _quotaType = val;

  bool hasQuotaType() => _quotaType != null;

  // "used" field.
  int? _used;
  int get used => _used ?? 0;
  set used(int? val) => _used = val;

  void incrementUsed(int amount) => used = used + amount;

  bool hasUsed() => _used != null;

  // "remaining" field.
  int? _remaining;
  int get remaining => _remaining ?? 0;
  set remaining(int? val) => _remaining = val;

  void incrementRemaining(int amount) => remaining = remaining + amount;

  bool hasRemaining() => _remaining != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  static ScanHistoryStruct fromMap(Map<String, dynamic> data) =>
      ScanHistoryStruct(
        userId: data['user_id'] as String?,
        featureId: data['feature_id'] as String?,
        featureName: data['feature_name'] as String?,
        quotaType: data['quota_type'] as String?,
        used: castToType<int>(data['used']),
        remaining: castToType<int>(data['remaining']),
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
      );

  static ScanHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? ScanHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'feature_id': _featureId,
        'feature_name': _featureName,
        'quota_type': _quotaType,
        'used': _used,
        'remaining': _remaining,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'feature_id': serializeParam(
          _featureId,
          ParamType.String,
        ),
        'feature_name': serializeParam(
          _featureName,
          ParamType.String,
        ),
        'quota_type': serializeParam(
          _quotaType,
          ParamType.String,
        ),
        'used': serializeParam(
          _used,
          ParamType.int,
        ),
        'remaining': serializeParam(
          _remaining,
          ParamType.int,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static ScanHistoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScanHistoryStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        featureId: deserializeParam(
          data['feature_id'],
          ParamType.String,
          false,
        ),
        featureName: deserializeParam(
          data['feature_name'],
          ParamType.String,
          false,
        ),
        quotaType: deserializeParam(
          data['quota_type'],
          ParamType.String,
          false,
        ),
        used: deserializeParam(
          data['used'],
          ParamType.int,
          false,
        ),
        remaining: deserializeParam(
          data['remaining'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ScanHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScanHistoryStruct &&
        userId == other.userId &&
        featureId == other.featureId &&
        featureName == other.featureName &&
        quotaType == other.quotaType &&
        used == other.used &&
        remaining == other.remaining &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        featureId,
        featureName,
        quotaType,
        used,
        remaining,
        createdAt,
        updatedAt
      ]);
}

ScanHistoryStruct createScanHistoryStruct({
  String? userId,
  String? featureId,
  String? featureName,
  String? quotaType,
  int? used,
  int? remaining,
  String? createdAt,
  String? updatedAt,
}) =>
    ScanHistoryStruct(
      userId: userId,
      featureId: featureId,
      featureName: featureName,
      quotaType: quotaType,
      used: used,
      remaining: remaining,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
