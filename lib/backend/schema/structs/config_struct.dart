// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigStruct extends BaseStruct {
  ConfigStruct({
    ConfigDataStruct? configData,
    List<QuestionnaireStruct>? questions,
    String? type,
    String? category,
    String? severity,
    String? educationId,
    String? documentType,
    bool? critical,
  })  : _configData = configData,
        _questions = questions,
        _type = type,
        _category = category,
        _severity = severity,
        _educationId = educationId,
        _documentType = documentType,
        _critical = critical;

  // "config_data" field.
  ConfigDataStruct? _configData;
  ConfigDataStruct get configData => _configData ?? ConfigDataStruct();
  set configData(ConfigDataStruct? val) => _configData = val;

  void updateConfigData(Function(ConfigDataStruct) updateFn) {
    updateFn(_configData ??= ConfigDataStruct());
  }

  bool hasConfigData() => _configData != null;

  // "questions" field.
  List<QuestionnaireStruct>? _questions;
  List<QuestionnaireStruct> get questions => _questions ?? const [];
  set questions(List<QuestionnaireStruct>? val) => _questions = val;

  void updateQuestions(Function(List<QuestionnaireStruct>) updateFn) {
    updateFn(_questions ??= []);
  }

  bool hasQuestions() => _questions != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "severity" field.
  String? _severity;
  String get severity => _severity ?? '';
  set severity(String? val) => _severity = val;

  bool hasSeverity() => _severity != null;

  // "educationId" field.
  String? _educationId;
  String get educationId => _educationId ?? '';
  set educationId(String? val) => _educationId = val;

  bool hasEducationId() => _educationId != null;

  // "documentType" field.
  String? _documentType;
  String get documentType => _documentType ?? '';
  set documentType(String? val) => _documentType = val;

  bool hasDocumentType() => _documentType != null;

  // "critical" field.
  bool? _critical;
  bool get critical => _critical ?? false;
  set critical(bool? val) => _critical = val;

  bool hasCritical() => _critical != null;

  static ConfigStruct fromMap(Map<String, dynamic> data) => ConfigStruct(
        configData: data['config_data'] is ConfigDataStruct
            ? data['config_data']
            : ConfigDataStruct.maybeFromMap(data['config_data']),
        questions: getStructList(
          data['questions'],
          QuestionnaireStruct.fromMap,
        ),
        type: data['type'] as String?,
        category: data['category'] as String?,
        severity: data['severity'] as String?,
        educationId: data['educationId'] as String?,
        documentType: data['documentType'] as String?,
        critical: data['critical'] as bool?,
      );

  static ConfigStruct? maybeFromMap(dynamic data) =>
      data is Map ? ConfigStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'config_data': _configData?.toMap(),
        'questions': _questions?.map((e) => e.toMap()).toList(),
        'type': _type,
        'category': _category,
        'severity': _severity,
        'educationId': _educationId,
        'documentType': _documentType,
        'critical': _critical,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'config_data': serializeParam(
          _configData,
          ParamType.DataStruct,
        ),
        'questions': serializeParam(
          _questions,
          ParamType.DataStruct,
          isList: true,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'severity': serializeParam(
          _severity,
          ParamType.String,
        ),
        'educationId': serializeParam(
          _educationId,
          ParamType.String,
        ),
        'documentType': serializeParam(
          _documentType,
          ParamType.String,
        ),
        'critical': serializeParam(
          _critical,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ConfigStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigStruct(
        configData: deserializeStructParam(
          data['config_data'],
          ParamType.DataStruct,
          false,
          structBuilder: ConfigDataStruct.fromSerializableMap,
        ),
        questions: deserializeStructParam<QuestionnaireStruct>(
          data['questions'],
          ParamType.DataStruct,
          true,
          structBuilder: QuestionnaireStruct.fromSerializableMap,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        severity: deserializeParam(
          data['severity'],
          ParamType.String,
          false,
        ),
        educationId: deserializeParam(
          data['educationId'],
          ParamType.String,
          false,
        ),
        documentType: deserializeParam(
          data['documentType'],
          ParamType.String,
          false,
        ),
        critical: deserializeParam(
          data['critical'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConfigStruct &&
        configData == other.configData &&
        listEquality.equals(questions, other.questions) &&
        type == other.type &&
        category == other.category &&
        severity == other.severity &&
        educationId == other.educationId &&
        documentType == other.documentType &&
        critical == other.critical;
  }

  @override
  int get hashCode => const ListEquality().hash([
        configData,
        questions,
        type,
        category,
        severity,
        educationId,
        documentType,
        critical
      ]);
}

ConfigStruct createConfigStruct({
  ConfigDataStruct? configData,
  String? type,
  String? category,
  String? severity,
  String? educationId,
  String? documentType,
  bool? critical,
}) =>
    ConfigStruct(
      configData: configData ?? ConfigDataStruct(),
      type: type,
      category: category,
      severity: severity,
      educationId: educationId,
      documentType: documentType,
      critical: critical,
    );
