// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoodTypeStruct extends BaseStruct {
  MoodTypeStruct({
    String? label,
    List<String>? emotions,
    String? outroTitle,
    String? outroSubTitle,
  })  : _label = label,
        _emotions = emotions,
        _outroTitle = outroTitle,
        _outroSubTitle = outroSubTitle;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "emotions" field.
  List<String>? _emotions;
  List<String> get emotions => _emotions ?? const [];
  set emotions(List<String>? val) => _emotions = val;

  void updateEmotions(Function(List<String>) updateFn) {
    updateFn(_emotions ??= []);
  }

  bool hasEmotions() => _emotions != null;

  // "outro_title" field.
  String? _outroTitle;
  String get outroTitle => _outroTitle ?? '';
  set outroTitle(String? val) => _outroTitle = val;

  bool hasOutroTitle() => _outroTitle != null;

  // "outro_sub_title" field.
  String? _outroSubTitle;
  String get outroSubTitle => _outroSubTitle ?? '';
  set outroSubTitle(String? val) => _outroSubTitle = val;

  bool hasOutroSubTitle() => _outroSubTitle != null;

  static MoodTypeStruct fromMap(Map<String, dynamic> data) => MoodTypeStruct(
        label: data['label'] as String?,
        emotions: getDataList(data['emotions']),
        outroTitle: data['outro_title'] as String?,
        outroSubTitle: data['outro_sub_title'] as String?,
      );

  static MoodTypeStruct? maybeFromMap(dynamic data) =>
      data is Map ? MoodTypeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'emotions': _emotions,
        'outro_title': _outroTitle,
        'outro_sub_title': _outroSubTitle,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'emotions': serializeParam(
          _emotions,
          ParamType.String,
          isList: true,
        ),
        'outro_title': serializeParam(
          _outroTitle,
          ParamType.String,
        ),
        'outro_sub_title': serializeParam(
          _outroSubTitle,
          ParamType.String,
        ),
      }.withoutNulls;

  static MoodTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      MoodTypeStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        emotions: deserializeParam<String>(
          data['emotions'],
          ParamType.String,
          true,
        ),
        outroTitle: deserializeParam(
          data['outro_title'],
          ParamType.String,
          false,
        ),
        outroSubTitle: deserializeParam(
          data['outro_sub_title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MoodTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MoodTypeStruct &&
        label == other.label &&
        listEquality.equals(emotions, other.emotions) &&
        outroTitle == other.outroTitle &&
        outroSubTitle == other.outroSubTitle;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([label, emotions, outroTitle, outroSubTitle]);
}

MoodTypeStruct createMoodTypeStruct({
  String? label,
  String? outroTitle,
  String? outroSubTitle,
}) =>
    MoodTypeStruct(
      label: label,
      outroTitle: outroTitle,
      outroSubTitle: outroSubTitle,
    );
