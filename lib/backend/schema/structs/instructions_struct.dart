// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstructionsStruct extends BaseStruct {
  InstructionsStruct({
    String? title,
    String? content,
  })  : _title = title,
        _content = content;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  static InstructionsStruct fromMap(Map<String, dynamic> data) =>
      InstructionsStruct(
        title: data['title'] as String?,
        content: data['content'] as String?,
      );

  static InstructionsStruct? maybeFromMap(dynamic data) => data is Map
      ? InstructionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static InstructionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      InstructionsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InstructionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InstructionsStruct &&
        title == other.title &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([title, content]);
}

InstructionsStruct createInstructionsStruct({
  String? title,
  String? content,
}) =>
    InstructionsStruct(
      title: title,
      content: content,
    );
