// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CareplixScanStruct extends BaseStruct {
  CareplixScanStruct({
    int? remaining,
    int? used,
    int? total,
  })  : _remaining = remaining,
        _used = used,
        _total = total;

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

  static CareplixScanStruct fromMap(Map<String, dynamic> data) =>
      CareplixScanStruct(
        remaining: castToType<int>(data['remaining']),
        used: castToType<int>(data['used']),
        total: castToType<int>(data['total']),
      );

  static CareplixScanStruct? maybeFromMap(dynamic data) => data is Map
      ? CareplixScanStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'remaining': _remaining,
        'used': _used,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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

  static CareplixScanStruct fromSerializableMap(Map<String, dynamic> data) =>
      CareplixScanStruct(
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
  String toString() => 'CareplixScanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CareplixScanStruct &&
        remaining == other.remaining &&
        used == other.used &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([remaining, used, total]);
}

CareplixScanStruct createCareplixScanStruct({
  int? remaining,
  int? used,
  int? total,
}) =>
    CareplixScanStruct(
      remaining: remaining,
      used: used,
      total: total,
    );
