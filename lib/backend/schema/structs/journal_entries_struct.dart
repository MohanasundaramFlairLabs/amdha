// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JournalEntriesStruct extends BaseStruct {
  JournalEntriesStruct({
    String? internalId,
    String? date,
    String? firstAnswer,
    String? secondAnswer,
    String? thirdAnswer,
    QuestionIdStruct? question,
    String? id,
    String? createdAt,
    String? answer,
  })  : _internalId = internalId,
        _date = date,
        _firstAnswer = firstAnswer,
        _secondAnswer = secondAnswer,
        _thirdAnswer = thirdAnswer,
        _question = question,
        _id = id,
        _createdAt = createdAt,
        _answer = answer;

  // "internalId" field.
  String? _internalId;
  String get internalId => _internalId ?? '';
  set internalId(String? val) => _internalId = val;

  bool hasInternalId() => _internalId != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "firstAnswer" field.
  String? _firstAnswer;
  String get firstAnswer => _firstAnswer ?? '';
  set firstAnswer(String? val) => _firstAnswer = val;

  bool hasFirstAnswer() => _firstAnswer != null;

  // "secondAnswer" field.
  String? _secondAnswer;
  String get secondAnswer => _secondAnswer ?? '';
  set secondAnswer(String? val) => _secondAnswer = val;

  bool hasSecondAnswer() => _secondAnswer != null;

  // "thirdAnswer" field.
  String? _thirdAnswer;
  String get thirdAnswer => _thirdAnswer ?? '';
  set thirdAnswer(String? val) => _thirdAnswer = val;

  bool hasThirdAnswer() => _thirdAnswer != null;

  // "question" field.
  QuestionIdStruct? _question;
  QuestionIdStruct get question => _question ?? QuestionIdStruct();
  set question(QuestionIdStruct? val) => _question = val;

  void updateQuestion(Function(QuestionIdStruct) updateFn) {
    updateFn(_question ??= QuestionIdStruct());
  }

  bool hasQuestion() => _question != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  static JournalEntriesStruct fromMap(Map<String, dynamic> data) =>
      JournalEntriesStruct(
        internalId: data['internalId'] as String?,
        date: data['date'] as String?,
        firstAnswer: data['firstAnswer'] as String?,
        secondAnswer: data['secondAnswer'] as String?,
        thirdAnswer: data['thirdAnswer'] as String?,
        question: data['question'] is QuestionIdStruct
            ? data['question']
            : QuestionIdStruct.maybeFromMap(data['question']),
        id: data['id'] as String?,
        createdAt: data['createdAt'] as String?,
        answer: data['answer'] as String?,
      );

  static JournalEntriesStruct? maybeFromMap(dynamic data) => data is Map
      ? JournalEntriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'internalId': _internalId,
        'date': _date,
        'firstAnswer': _firstAnswer,
        'secondAnswer': _secondAnswer,
        'thirdAnswer': _thirdAnswer,
        'question': _question?.toMap(),
        'id': _id,
        'createdAt': _createdAt,
        'answer': _answer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'internalId': serializeParam(
          _internalId,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'firstAnswer': serializeParam(
          _firstAnswer,
          ParamType.String,
        ),
        'secondAnswer': serializeParam(
          _secondAnswer,
          ParamType.String,
        ),
        'thirdAnswer': serializeParam(
          _thirdAnswer,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
      }.withoutNulls;

  static JournalEntriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      JournalEntriesStruct(
        internalId: deserializeParam(
          data['internalId'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        firstAnswer: deserializeParam(
          data['firstAnswer'],
          ParamType.String,
          false,
        ),
        secondAnswer: deserializeParam(
          data['secondAnswer'],
          ParamType.String,
          false,
        ),
        thirdAnswer: deserializeParam(
          data['thirdAnswer'],
          ParamType.String,
          false,
        ),
        question: deserializeStructParam(
          data['question'],
          ParamType.DataStruct,
          false,
          structBuilder: QuestionIdStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'JournalEntriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JournalEntriesStruct &&
        internalId == other.internalId &&
        date == other.date &&
        firstAnswer == other.firstAnswer &&
        secondAnswer == other.secondAnswer &&
        thirdAnswer == other.thirdAnswer &&
        question == other.question &&
        id == other.id &&
        createdAt == other.createdAt &&
        answer == other.answer;
  }

  @override
  int get hashCode => const ListEquality().hash([
        internalId,
        date,
        firstAnswer,
        secondAnswer,
        thirdAnswer,
        question,
        id,
        createdAt,
        answer
      ]);
}

JournalEntriesStruct createJournalEntriesStruct({
  String? internalId,
  String? date,
  String? firstAnswer,
  String? secondAnswer,
  String? thirdAnswer,
  QuestionIdStruct? question,
  String? id,
  String? createdAt,
  String? answer,
}) =>
    JournalEntriesStruct(
      internalId: internalId,
      date: date,
      firstAnswer: firstAnswer,
      secondAnswer: secondAnswer,
      thirdAnswer: thirdAnswer,
      question: question ?? QuestionIdStruct(),
      id: id,
      createdAt: createdAt,
      answer: answer,
    );
