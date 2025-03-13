// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuotaCategoryStruct extends BaseStruct {
  QuotaCategoryStruct({
    int? quota,
    String? quotaType,
  })  : _quota = quota,
        _quotaType = quotaType;

  // "quota" field.
  int? _quota;
  int get quota => _quota ?? 0;
  set quota(int? val) => _quota = val;

  void incrementQuota(int amount) => quota = quota + amount;

  bool hasQuota() => _quota != null;

  // "quotaType" field.
  String? _quotaType;
  String get quotaType => _quotaType ?? '';
  set quotaType(String? val) => _quotaType = val;

  bool hasQuotaType() => _quotaType != null;

  static QuotaCategoryStruct fromMap(Map<String, dynamic> data) =>
      QuotaCategoryStruct(
        quota: castToType<int>(data['quota']),
        quotaType: data['quotaType'] as String?,
      );

  static QuotaCategoryStruct? maybeFromMap(dynamic data) => data is Map
      ? QuotaCategoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'quota': _quota,
        'quotaType': _quotaType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quota': serializeParam(
          _quota,
          ParamType.int,
        ),
        'quotaType': serializeParam(
          _quotaType,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuotaCategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuotaCategoryStruct(
        quota: deserializeParam(
          data['quota'],
          ParamType.int,
          false,
        ),
        quotaType: deserializeParam(
          data['quotaType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuotaCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuotaCategoryStruct &&
        quota == other.quota &&
        quotaType == other.quotaType;
  }

  @override
  int get hashCode => const ListEquality().hash([quota, quotaType]);
}

QuotaCategoryStruct createQuotaCategoryStruct({
  int? quota,
  String? quotaType,
}) =>
    QuotaCategoryStruct(
      quota: quota,
      quotaType: quotaType,
    );
