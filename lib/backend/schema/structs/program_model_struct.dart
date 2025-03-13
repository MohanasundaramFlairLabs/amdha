// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramModelStruct extends BaseStruct {
  ProgramModelStruct({
    List<ProgramsStruct>? programs,
  }) : _programs = programs;

  // "programs" field.
  List<ProgramsStruct>? _programs;
  List<ProgramsStruct> get programs => _programs ?? const [];
  set programs(List<ProgramsStruct>? val) => _programs = val;

  void updatePrograms(Function(List<ProgramsStruct>) updateFn) {
    updateFn(_programs ??= []);
  }

  bool hasPrograms() => _programs != null;

  static ProgramModelStruct fromMap(Map<String, dynamic> data) =>
      ProgramModelStruct(
        programs: getStructList(
          data['programs'],
          ProgramsStruct.fromMap,
        ),
      );

  static ProgramModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'programs': _programs?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'programs': serializeParam(
          _programs,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ProgramModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramModelStruct(
        programs: deserializeStructParam<ProgramsStruct>(
          data['programs'],
          ParamType.DataStruct,
          true,
          structBuilder: ProgramsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProgramModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProgramModelStruct &&
        listEquality.equals(programs, other.programs);
  }

  @override
  int get hashCode => const ListEquality().hash([programs]);
}

ProgramModelStruct createProgramModelStruct() => ProgramModelStruct();
