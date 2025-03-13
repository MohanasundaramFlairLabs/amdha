// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecommendationStruct extends BaseStruct {
  RecommendationStruct({
    String? title,
    List<DataStruct>? data,
    String? preText,
  })  : _title = title,
        _data = data,
        _preText = preText;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "data" field.
  List<DataStruct>? _data;
  List<DataStruct> get data => _data ?? const [];
  set data(List<DataStruct>? val) => _data = val;

  void updateData(Function(List<DataStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  // "preText" field.
  String? _preText;
  String get preText => _preText ?? '';
  set preText(String? val) => _preText = val;

  bool hasPreText() => _preText != null;

  static RecommendationStruct fromMap(Map<String, dynamic> data) =>
      RecommendationStruct(
        title: data['title'] as String?,
        data: getStructList(
          data['data'],
          DataStruct.fromMap,
        ),
        preText: data['preText'] as String?,
      );

  static RecommendationStruct? maybeFromMap(dynamic data) => data is Map
      ? RecommendationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'data': _data?.map((e) => e.toMap()).toList(),
        'preText': _preText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
        'preText': serializeParam(
          _preText,
          ParamType.String,
        ),
      }.withoutNulls;

  static RecommendationStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecommendationStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        data: deserializeStructParam<DataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DataStruct.fromSerializableMap,
        ),
        preText: deserializeParam(
          data['preText'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RecommendationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RecommendationStruct &&
        title == other.title &&
        listEquality.equals(data, other.data) &&
        preText == other.preText;
  }

  @override
  int get hashCode => const ListEquality().hash([title, data, preText]);
}

RecommendationStruct createRecommendationStruct({
  String? title,
  String? preText,
}) =>
    RecommendationStruct(
      title: title,
      preText: preText,
    );
