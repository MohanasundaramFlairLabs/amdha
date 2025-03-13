// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigDataStruct extends BaseStruct {
  ConfigDataStruct({
    String? title,
    String? label,
    String? documentType,
    String? reportType,
    bool? allowDropdown,
    String? description,
    List<MoodTypeStruct>? mood,
    String? question,
  })  : _title = title,
        _label = label,
        _documentType = documentType,
        _reportType = reportType,
        _allowDropdown = allowDropdown,
        _description = description,
        _mood = mood,
        _question = question;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "documentType" field.
  String? _documentType;
  String get documentType => _documentType ?? '';
  set documentType(String? val) => _documentType = val;

  bool hasDocumentType() => _documentType != null;

  // "reportType" field.
  String? _reportType;
  String get reportType => _reportType ?? '';
  set reportType(String? val) => _reportType = val;

  bool hasReportType() => _reportType != null;

  // "allowDropdown" field.
  bool? _allowDropdown;
  bool get allowDropdown => _allowDropdown ?? false;
  set allowDropdown(bool? val) => _allowDropdown = val;

  bool hasAllowDropdown() => _allowDropdown != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "mood" field.
  List<MoodTypeStruct>? _mood;
  List<MoodTypeStruct> get mood => _mood ?? const [];
  set mood(List<MoodTypeStruct>? val) => _mood = val;

  void updateMood(Function(List<MoodTypeStruct>) updateFn) {
    updateFn(_mood ??= []);
  }

  bool hasMood() => _mood != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  static ConfigDataStruct fromMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        title: data['title'] as String?,
        label: data['label'] as String?,
        documentType: data['documentType'] as String?,
        reportType: data['reportType'] as String?,
        allowDropdown: data['allowDropdown'] as bool?,
        description: data['description'] as String?,
        mood: getStructList(
          data['mood'],
          MoodTypeStruct.fromMap,
        ),
        question: data['question'] as String?,
      );

  static ConfigDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'label': _label,
        'documentType': _documentType,
        'reportType': _reportType,
        'allowDropdown': _allowDropdown,
        'description': _description,
        'mood': _mood?.map((e) => e.toMap()).toList(),
        'question': _question,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'documentType': serializeParam(
          _documentType,
          ParamType.String,
        ),
        'reportType': serializeParam(
          _reportType,
          ParamType.String,
        ),
        'allowDropdown': serializeParam(
          _allowDropdown,
          ParamType.bool,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'mood': serializeParam(
          _mood,
          ParamType.DataStruct,
          isList: true,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConfigDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigDataStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        documentType: deserializeParam(
          data['documentType'],
          ParamType.String,
          false,
        ),
        reportType: deserializeParam(
          data['reportType'],
          ParamType.String,
          false,
        ),
        allowDropdown: deserializeParam(
          data['allowDropdown'],
          ParamType.bool,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        mood: deserializeStructParam<MoodTypeStruct>(
          data['mood'],
          ParamType.DataStruct,
          true,
          structBuilder: MoodTypeStruct.fromSerializableMap,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConfigDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConfigDataStruct &&
        title == other.title &&
        label == other.label &&
        documentType == other.documentType &&
        reportType == other.reportType &&
        allowDropdown == other.allowDropdown &&
        description == other.description &&
        listEquality.equals(mood, other.mood) &&
        question == other.question;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        label,
        documentType,
        reportType,
        allowDropdown,
        description,
        mood,
        question
      ]);
}

ConfigDataStruct createConfigDataStruct({
  String? title,
  String? label,
  String? documentType,
  String? reportType,
  bool? allowDropdown,
  String? description,
  String? question,
}) =>
    ConfigDataStruct(
      title: title,
      label: label,
      documentType: documentType,
      reportType: reportType,
      allowDropdown: allowDropdown,
      description: description,
      question: question,
    );
