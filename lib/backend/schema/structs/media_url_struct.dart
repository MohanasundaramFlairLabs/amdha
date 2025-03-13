// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MediaUrlStruct extends BaseStruct {
  MediaUrlStruct({
    String? contentType,
    String? uri,
  })  : _contentType = contentType,
        _uri = uri;

  // "contentType" field.
  String? _contentType;
  String get contentType => _contentType ?? '';
  set contentType(String? val) => _contentType = val;

  bool hasContentType() => _contentType != null;

  // "uri" field.
  String? _uri;
  String get uri => _uri ?? '';
  set uri(String? val) => _uri = val;

  bool hasUri() => _uri != null;

  static MediaUrlStruct fromMap(Map<String, dynamic> data) => MediaUrlStruct(
        contentType: data['contentType'] as String?,
        uri: data['uri'] as String?,
      );

  static MediaUrlStruct? maybeFromMap(dynamic data) =>
      data is Map ? MediaUrlStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'contentType': _contentType,
        'uri': _uri,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contentType': serializeParam(
          _contentType,
          ParamType.String,
        ),
        'uri': serializeParam(
          _uri,
          ParamType.String,
        ),
      }.withoutNulls;

  static MediaUrlStruct fromSerializableMap(Map<String, dynamic> data) =>
      MediaUrlStruct(
        contentType: deserializeParam(
          data['contentType'],
          ParamType.String,
          false,
        ),
        uri: deserializeParam(
          data['uri'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MediaUrlStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MediaUrlStruct &&
        contentType == other.contentType &&
        uri == other.uri;
  }

  @override
  int get hashCode => const ListEquality().hash([contentType, uri]);
}

MediaUrlStruct createMediaUrlStruct({
  String? contentType,
  String? uri,
}) =>
    MediaUrlStruct(
      contentType: contentType,
      uri: uri,
    );
