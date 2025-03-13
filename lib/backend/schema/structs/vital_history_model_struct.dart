// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VitalHistoryModelStruct extends BaseStruct {
  VitalHistoryModelStruct({
    int? status,
    VitalStruct? vital,
  })  : _status = status,
        _vital = vital;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "vital" field.
  VitalStruct? _vital;
  VitalStruct get vital => _vital ?? VitalStruct();
  set vital(VitalStruct? val) => _vital = val;

  void updateVital(Function(VitalStruct) updateFn) {
    updateFn(_vital ??= VitalStruct());
  }

  bool hasVital() => _vital != null;

  static VitalHistoryModelStruct fromMap(Map<String, dynamic> data) =>
      VitalHistoryModelStruct(
        status: castToType<int>(data['status']),
        vital: data['vital'] is VitalStruct
            ? data['vital']
            : VitalStruct.maybeFromMap(data['vital']),
      );

  static VitalHistoryModelStruct? maybeFromMap(dynamic data) => data is Map
      ? VitalHistoryModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'vital': _vital?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'vital': serializeParam(
          _vital,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static VitalHistoryModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VitalHistoryModelStruct(
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        vital: deserializeStructParam(
          data['vital'],
          ParamType.DataStruct,
          false,
          structBuilder: VitalStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'VitalHistoryModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VitalHistoryModelStruct &&
        status == other.status &&
        vital == other.vital;
  }

  @override
  int get hashCode => const ListEquality().hash([status, vital]);
}

VitalHistoryModelStruct createVitalHistoryModelStruct({
  int? status,
  VitalStruct? vital,
}) =>
    VitalHistoryModelStruct(
      status: status,
      vital: vital ?? VitalStruct(),
    );
