// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionIdStruct extends BaseStruct {
  QuestionIdStruct({
    String? question,
    String? createdAt,
  })  : _question = question,
        _createdAt = createdAt;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static QuestionIdStruct fromMap(Map<String, dynamic> data) =>
      QuestionIdStruct(
        question: data['question'] as String?,
        createdAt: data['createdAt'] as String?,
      );

  static QuestionIdStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'createdAt': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionIdStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionIdStruct &&
        question == other.question &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality().hash([question, createdAt]);
}

QuestionIdStruct createQuestionIdStruct({
  String? question,
  String? createdAt,
}) =>
    QuestionIdStruct(
      question: question,
      createdAt: createdAt,
    );
