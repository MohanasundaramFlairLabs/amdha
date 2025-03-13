// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SyncStruct extends BaseStruct {
  SyncStruct({
    bool? sync,
  }) : _sync = sync;

  // "sync" field.
  bool? _sync;
  bool get sync => _sync ?? false;
  set sync(bool? val) => _sync = val;

  bool hasSync() => _sync != null;

  static SyncStruct fromMap(Map<String, dynamic> data) => SyncStruct(
        sync: data['sync'] as bool?,
      );

  static SyncStruct? maybeFromMap(dynamic data) =>
      data is Map ? SyncStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'sync': _sync,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sync': serializeParam(
          _sync,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SyncStruct fromSerializableMap(Map<String, dynamic> data) =>
      SyncStruct(
        sync: deserializeParam(
          data['sync'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SyncStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SyncStruct && sync == other.sync;
  }

  @override
  int get hashCode => const ListEquality().hash([sync]);
}

SyncStruct createSyncStruct({
  bool? sync,
}) =>
    SyncStruct(
      sync: sync,
    );
