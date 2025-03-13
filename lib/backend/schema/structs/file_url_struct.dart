// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileUrlStruct extends BaseStruct {
  FileUrlStruct({
    String? title,
    String? contentType,
    String? path,
  })  : _title = title,
        _contentType = contentType,
        _path = path;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "contentType" field.
  String? _contentType;
  String get contentType => _contentType ?? '';
  set contentType(String? val) => _contentType = val;

  bool hasContentType() => _contentType != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  static FileUrlStruct fromMap(Map<String, dynamic> data) => FileUrlStruct(
        title: data['title'] as String?,
        contentType: data['contentType'] as String?,
        path: data['path'] as String?,
      );

  static FileUrlStruct? maybeFromMap(dynamic data) =>
      data is Map ? FileUrlStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'contentType': _contentType,
        'path': _path,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'contentType': serializeParam(
          _contentType,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
      }.withoutNulls;

  static FileUrlStruct fromSerializableMap(Map<String, dynamic> data) =>
      FileUrlStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        contentType: deserializeParam(
          data['contentType'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FileUrlStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FileUrlStruct &&
        title == other.title &&
        contentType == other.contentType &&
        path == other.path;
  }

  @override
  int get hashCode => const ListEquality().hash([title, contentType, path]);
}

FileUrlStruct createFileUrlStruct({
  String? title,
  String? contentType,
  String? path,
}) =>
    FileUrlStruct(
      title: title,
      contentType: contentType,
      path: path,
    );
