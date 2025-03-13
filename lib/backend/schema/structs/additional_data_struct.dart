// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionalDataStruct extends BaseStruct {
  AdditionalDataStruct({
    String? riskCategory,
    String? heartAge,
    String? risk,
    double? score,
    String? title,
    String? description,
  })  : _riskCategory = riskCategory,
        _heartAge = heartAge,
        _risk = risk,
        _score = score,
        _title = title,
        _description = description;

  // "riskCategory" field.
  String? _riskCategory;
  String get riskCategory => _riskCategory ?? '';
  set riskCategory(String? val) => _riskCategory = val;

  bool hasRiskCategory() => _riskCategory != null;

  // "heartAge" field.
  String? _heartAge;
  String get heartAge => _heartAge ?? '';
  set heartAge(String? val) => _heartAge = val;

  bool hasHeartAge() => _heartAge != null;

  // "risk" field.
  String? _risk;
  String get risk => _risk ?? '';
  set risk(String? val) => _risk = val;

  bool hasRisk() => _risk != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  set score(double? val) => _score = val;

  void incrementScore(double amount) => score = score + amount;

  bool hasScore() => _score != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static AdditionalDataStruct fromMap(Map<String, dynamic> data) =>
      AdditionalDataStruct(
        riskCategory: data['riskCategory'] as String?,
        heartAge: data['heartAge'] as String?,
        risk: data['risk'] as String?,
        score: castToType<double>(data['score']),
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  static AdditionalDataStruct? maybeFromMap(dynamic data) => data is Map
      ? AdditionalDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'riskCategory': _riskCategory,
        'heartAge': _heartAge,
        'risk': _risk,
        'score': _score,
        'title': _title,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'riskCategory': serializeParam(
          _riskCategory,
          ParamType.String,
        ),
        'heartAge': serializeParam(
          _heartAge,
          ParamType.String,
        ),
        'risk': serializeParam(
          _risk,
          ParamType.String,
        ),
        'score': serializeParam(
          _score,
          ParamType.double,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static AdditionalDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdditionalDataStruct(
        riskCategory: deserializeParam(
          data['riskCategory'],
          ParamType.String,
          false,
        ),
        heartAge: deserializeParam(
          data['heartAge'],
          ParamType.String,
          false,
        ),
        risk: deserializeParam(
          data['risk'],
          ParamType.String,
          false,
        ),
        score: deserializeParam(
          data['score'],
          ParamType.double,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AdditionalDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdditionalDataStruct &&
        riskCategory == other.riskCategory &&
        heartAge == other.heartAge &&
        risk == other.risk &&
        score == other.score &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([riskCategory, heartAge, risk, score, title, description]);
}

AdditionalDataStruct createAdditionalDataStruct({
  String? riskCategory,
  String? heartAge,
  String? risk,
  double? score,
  String? title,
  String? description,
}) =>
    AdditionalDataStruct(
      riskCategory: riskCategory,
      heartAge: heartAge,
      risk: risk,
      score: score,
      title: title,
      description: description,
    );
