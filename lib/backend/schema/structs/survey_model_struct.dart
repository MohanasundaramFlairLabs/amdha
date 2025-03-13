// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SurveyModelStruct extends BaseStruct {
  SurveyModelStruct({
    String? id,
    String? question,
    String? type,
    List<String>? options,
    List<String>? selectedoptions,
  })  : _id = id,
        _question = question,
        _type = type,
        _options = options,
        _selectedoptions = selectedoptions;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "selectedoptions" field.
  List<String>? _selectedoptions;
  List<String> get selectedoptions => _selectedoptions ?? const [];
  set selectedoptions(List<String>? val) => _selectedoptions = val;

  void updateSelectedoptions(Function(List<String>) updateFn) {
    updateFn(_selectedoptions ??= []);
  }

  bool hasSelectedoptions() => _selectedoptions != null;

  static SurveyModelStruct fromMap(Map<String, dynamic> data) =>
      SurveyModelStruct(
        id: data['id'] as String?,
        question: data['question'] as String?,
        type: data['type'] as String?,
        options: getDataList(data['options']),
        selectedoptions: getDataList(data['selectedoptions']),
      );

  static SurveyModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SurveyModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'question': _question,
        'type': _type,
        'options': _options,
        'selectedoptions': _selectedoptions,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
        'selectedoptions': serializeParam(
          _selectedoptions,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static SurveyModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SurveyModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        selectedoptions: deserializeParam<String>(
          data['selectedoptions'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'SurveyModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SurveyModelStruct &&
        id == other.id &&
        question == other.question &&
        type == other.type &&
        listEquality.equals(options, other.options) &&
        listEquality.equals(selectedoptions, other.selectedoptions);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, question, type, options, selectedoptions]);
}

SurveyModelStruct createSurveyModelStruct({
  String? id,
  String? question,
  String? type,
}) =>
    SurveyModelStruct(
      id: id,
      question: question,
      type: type,
    );
