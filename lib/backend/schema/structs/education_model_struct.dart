// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EducationModelStruct extends BaseStruct {
  EducationModelStruct({
    List<EducationStruct>? education,
  }) : _education = education;

  // "education" field.
  List<EducationStruct>? _education;
  List<EducationStruct> get education => _education ?? const [];
  set education(List<EducationStruct>? val) => _education = val;

  void updateEducation(Function(List<EducationStruct>) updateFn) {
    updateFn(_education ??= []);
  }

  bool hasEducation() => _education != null;

  static EducationModelStruct fromMap(Map<String, dynamic> data) =>
      EducationModelStruct(
        education: getStructList(
          data['education'],
          EducationStruct.fromMap,
        ),
      );

  static EducationModelStruct? maybeFromMap(dynamic data) => data is Map
      ? EducationModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'education': _education?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'education': serializeParam(
          _education,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static EducationModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      EducationModelStruct(
        education: deserializeStructParam<EducationStruct>(
          data['education'],
          ParamType.DataStruct,
          true,
          structBuilder: EducationStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'EducationModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EducationModelStruct &&
        listEquality.equals(education, other.education);
  }

  @override
  int get hashCode => const ListEquality().hash([education]);
}

EducationModelStruct createEducationModelStruct() => EducationModelStruct();
