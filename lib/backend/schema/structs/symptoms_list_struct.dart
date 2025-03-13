// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SymptomsListStruct extends BaseStruct {
  SymptomsListStruct({
    String? id,
    String? name,
    String? category,
    List<String>? severityOptions,
    List<String>? onsetOptions,
    SelectedSymptomStruct? selectedValues,
  })  : _id = id,
        _name = name,
        _category = category,
        _severityOptions = severityOptions,
        _onsetOptions = onsetOptions,
        _selectedValues = selectedValues;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "severityOptions" field.
  List<String>? _severityOptions;
  List<String> get severityOptions => _severityOptions ?? const [];
  set severityOptions(List<String>? val) => _severityOptions = val;

  void updateSeverityOptions(Function(List<String>) updateFn) {
    updateFn(_severityOptions ??= []);
  }

  bool hasSeverityOptions() => _severityOptions != null;

  // "onsetOptions" field.
  List<String>? _onsetOptions;
  List<String> get onsetOptions => _onsetOptions ?? const [];
  set onsetOptions(List<String>? val) => _onsetOptions = val;

  void updateOnsetOptions(Function(List<String>) updateFn) {
    updateFn(_onsetOptions ??= []);
  }

  bool hasOnsetOptions() => _onsetOptions != null;

  // "selectedValues" field.
  SelectedSymptomStruct? _selectedValues;
  SelectedSymptomStruct get selectedValues =>
      _selectedValues ?? SelectedSymptomStruct();
  set selectedValues(SelectedSymptomStruct? val) => _selectedValues = val;

  void updateSelectedValues(Function(SelectedSymptomStruct) updateFn) {
    updateFn(_selectedValues ??= SelectedSymptomStruct());
  }

  bool hasSelectedValues() => _selectedValues != null;

  static SymptomsListStruct fromMap(Map<String, dynamic> data) =>
      SymptomsListStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        category: data['category'] as String?,
        severityOptions: getDataList(data['severityOptions']),
        onsetOptions: getDataList(data['onsetOptions']),
        selectedValues: data['selectedValues'] is SelectedSymptomStruct
            ? data['selectedValues']
            : SelectedSymptomStruct.maybeFromMap(data['selectedValues']),
      );

  static SymptomsListStruct? maybeFromMap(dynamic data) => data is Map
      ? SymptomsListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'category': _category,
        'severityOptions': _severityOptions,
        'onsetOptions': _onsetOptions,
        'selectedValues': _selectedValues?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'severityOptions': serializeParam(
          _severityOptions,
          ParamType.String,
          isList: true,
        ),
        'onsetOptions': serializeParam(
          _onsetOptions,
          ParamType.String,
          isList: true,
        ),
        'selectedValues': serializeParam(
          _selectedValues,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SymptomsListStruct fromSerializableMap(Map<String, dynamic> data) =>
      SymptomsListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        severityOptions: deserializeParam<String>(
          data['severityOptions'],
          ParamType.String,
          true,
        ),
        onsetOptions: deserializeParam<String>(
          data['onsetOptions'],
          ParamType.String,
          true,
        ),
        selectedValues: deserializeStructParam(
          data['selectedValues'],
          ParamType.DataStruct,
          false,
          structBuilder: SelectedSymptomStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SymptomsListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SymptomsListStruct &&
        id == other.id &&
        name == other.name &&
        category == other.category &&
        listEquality.equals(severityOptions, other.severityOptions) &&
        listEquality.equals(onsetOptions, other.onsetOptions) &&
        selectedValues == other.selectedValues;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, name, category, severityOptions, onsetOptions, selectedValues]);
}

SymptomsListStruct createSymptomsListStruct({
  String? id,
  String? name,
  String? category,
  SelectedSymptomStruct? selectedValues,
}) =>
    SymptomsListStruct(
      id: id,
      name: name,
      category: category,
      selectedValues: selectedValues ?? SelectedSymptomStruct(),
    );
