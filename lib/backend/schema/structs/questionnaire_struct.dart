// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionnaireStruct extends BaseStruct {
  QuestionnaireStruct({
    String? question,
    String? type,
    List<OptionsStruct>? options,
    bool? required,
    List<int>? selectedIndex,
    int? number,
    String? otherText,
    AdditionalDataStruct? additionalData,
  })  : _question = question,
        _type = type,
        _options = options,
        _required = required,
        _selectedIndex = selectedIndex,
        _number = number,
        _otherText = otherText,
        _additionalData = additionalData;

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
  List<OptionsStruct>? _options;
  List<OptionsStruct> get options => _options ?? const [];
  set options(List<OptionsStruct>? val) => _options = val;

  void updateOptions(Function(List<OptionsStruct>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "required" field.
  bool? _required;
  bool get required => _required ?? false;
  set required(bool? val) => _required = val;

  bool hasRequired() => _required != null;

  // "selectedIndex" field.
  List<int>? _selectedIndex;
  List<int> get selectedIndex => _selectedIndex ?? const [];
  set selectedIndex(List<int>? val) => _selectedIndex = val;

  void updateSelectedIndex(Function(List<int>) updateFn) {
    updateFn(_selectedIndex ??= []);
  }

  bool hasSelectedIndex() => _selectedIndex != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;

  void incrementNumber(int amount) => number = number + amount;

  bool hasNumber() => _number != null;

  // "otherText" field.
  String? _otherText;
  String get otherText => _otherText ?? '';
  set otherText(String? val) => _otherText = val;

  bool hasOtherText() => _otherText != null;

  // "additionalData" field.
  AdditionalDataStruct? _additionalData;
  AdditionalDataStruct get additionalData =>
      _additionalData ?? AdditionalDataStruct();
  set additionalData(AdditionalDataStruct? val) => _additionalData = val;

  void updateAdditionalData(Function(AdditionalDataStruct) updateFn) {
    updateFn(_additionalData ??= AdditionalDataStruct());
  }

  bool hasAdditionalData() => _additionalData != null;

  static QuestionnaireStruct fromMap(Map<String, dynamic> data) =>
      QuestionnaireStruct(
        question: data['question'] as String?,
        type: data['type'] as String?,
        options: getStructList(
          data['options'],
          OptionsStruct.fromMap,
        ),
        required: data['required'] as bool?,
        selectedIndex: getDataList(data['selectedIndex']),
        number: castToType<int>(data['number']),
        otherText: data['otherText'] as String?,
        additionalData: data['additionalData'] is AdditionalDataStruct
            ? data['additionalData']
            : AdditionalDataStruct.maybeFromMap(data['additionalData']),
      );

  static QuestionnaireStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionnaireStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'type': _type,
        'options': _options?.map((e) => e.toMap()).toList(),
        'required': _required,
        'selectedIndex': _selectedIndex,
        'number': _number,
        'otherText': _otherText,
        'additionalData': _additionalData?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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
          ParamType.DataStruct,
          isList: true,
        ),
        'required': serializeParam(
          _required,
          ParamType.bool,
        ),
        'selectedIndex': serializeParam(
          _selectedIndex,
          ParamType.int,
          isList: true,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'otherText': serializeParam(
          _otherText,
          ParamType.String,
        ),
        'additionalData': serializeParam(
          _additionalData,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static QuestionnaireStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionnaireStruct(
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
        options: deserializeStructParam<OptionsStruct>(
          data['options'],
          ParamType.DataStruct,
          true,
          structBuilder: OptionsStruct.fromSerializableMap,
        ),
        required: deserializeParam(
          data['required'],
          ParamType.bool,
          false,
        ),
        selectedIndex: deserializeParam<int>(
          data['selectedIndex'],
          ParamType.int,
          true,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        otherText: deserializeParam(
          data['otherText'],
          ParamType.String,
          false,
        ),
        additionalData: deserializeStructParam(
          data['additionalData'],
          ParamType.DataStruct,
          false,
          structBuilder: AdditionalDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'QuestionnaireStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionnaireStruct &&
        question == other.question &&
        type == other.type &&
        listEquality.equals(options, other.options) &&
        required == other.required &&
        listEquality.equals(selectedIndex, other.selectedIndex) &&
        number == other.number &&
        otherText == other.otherText &&
        additionalData == other.additionalData;
  }

  @override
  int get hashCode => const ListEquality().hash([
        question,
        type,
        options,
        required,
        selectedIndex,
        number,
        otherText,
        additionalData
      ]);
}

QuestionnaireStruct createQuestionnaireStruct({
  String? question,
  String? type,
  bool? required,
  int? number,
  String? otherText,
  AdditionalDataStruct? additionalData,
}) =>
    QuestionnaireStruct(
      question: question,
      type: type,
      required: required,
      number: number,
      otherText: otherText,
      additionalData: additionalData ?? AdditionalDataStruct(),
    );
