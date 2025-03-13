// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuotaStruct extends BaseStruct {
  QuotaStruct({
    String? quotaType,
    int? remaining,
    int? used,
    int? total,
  })  : _quotaType = quotaType,
        _remaining = remaining,
        _used = used,
        _total = total;

  // "quota_type" field.
  String? _quotaType;
  String get quotaType => _quotaType ?? '';
  set quotaType(String? val) => _quotaType = val;

  bool hasQuotaType() => _quotaType != null;

  // "remaining" field.
  int? _remaining;
  int get remaining => _remaining ?? 0;
  set remaining(int? val) => _remaining = val;

  void incrementRemaining(int amount) => remaining = remaining + amount;

  bool hasRemaining() => _remaining != null;

  // "used" field.
  int? _used;
  int get used => _used ?? 0;
  set used(int? val) => _used = val;

  void incrementUsed(int amount) => used = used + amount;

  bool hasUsed() => _used != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static QuotaStruct fromMap(Map<String, dynamic> data) => QuotaStruct(
        quotaType: data['quota_type'] as String?,
        remaining: castToType<int>(data['remaining']),
        used: castToType<int>(data['used']),
        total: castToType<int>(data['total']),
      );

  static QuotaStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuotaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'quota_type': _quotaType,
        'remaining': _remaining,
        'used': _used,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quota_type': serializeParam(
          _quotaType,
          ParamType.String,
        ),
        'remaining': serializeParam(
          _remaining,
          ParamType.int,
        ),
        'used': serializeParam(
          _used,
          ParamType.int,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
      }.withoutNulls;

  static QuotaStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuotaStruct(
        quotaType: deserializeParam(
          data['quota_type'],
          ParamType.String,
          false,
        ),
        remaining: deserializeParam(
          data['remaining'],
          ParamType.int,
          false,
        ),
        used: deserializeParam(
          data['used'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'QuotaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuotaStruct &&
        quotaType == other.quotaType &&
        remaining == other.remaining &&
        used == other.used &&
        total == other.total;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([quotaType, remaining, used, total]);
}

QuotaStruct createQuotaStruct({
  String? quotaType,
  int? remaining,
  int? used,
  int? total,
}) =>
    QuotaStruct(
      quotaType: quotaType,
      remaining: remaining,
      used: used,
      total: total,
    );
