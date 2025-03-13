// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramDataStruct extends BaseStruct {
  ProgramDataStruct({
    String? lmp,
  }) : _lmp = lmp;

  // "lmp" field.
  String? _lmp;
  String get lmp => _lmp ?? '';
  set lmp(String? val) => _lmp = val;

  bool hasLmp() => _lmp != null;

  static ProgramDataStruct fromMap(Map<String, dynamic> data) =>
      ProgramDataStruct(
        lmp: data['lmp'] as String?,
      );

  static ProgramDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lmp': _lmp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lmp': serializeParam(
          _lmp,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProgramDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramDataStruct(
        lmp: deserializeParam(
          data['lmp'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProgramDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramDataStruct && lmp == other.lmp;
  }

  @override
  int get hashCode => const ListEquality().hash([lmp]);
}

ProgramDataStruct createProgramDataStruct({
  String? lmp,
}) =>
    ProgramDataStruct(
      lmp: lmp,
    );
