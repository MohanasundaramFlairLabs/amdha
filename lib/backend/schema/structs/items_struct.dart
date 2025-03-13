// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsStruct extends BaseStruct {
  ItemsStruct({
    String? title,
    String? description,
    String? contentType,
    String? addedBy,
    String? uri,
    String? thumbnailUrl,
    String? id,
    String? educationKey,
  })  : _title = title,
        _description = description,
        _contentType = contentType,
        _addedBy = addedBy,
        _uri = uri,
        _thumbnailUrl = thumbnailUrl,
        _id = id,
        _educationKey = educationKey;

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

  // "contentType" field.
  String? _contentType;
  String get contentType => _contentType ?? '';
  set contentType(String? val) => _contentType = val;

  bool hasContentType() => _contentType != null;

  // "addedBy" field.
  String? _addedBy;
  String get addedBy => _addedBy ?? '';
  set addedBy(String? val) => _addedBy = val;

  bool hasAddedBy() => _addedBy != null;

  // "uri" field.
  String? _uri;
  String get uri => _uri ?? '';
  set uri(String? val) => _uri = val;

  bool hasUri() => _uri != null;

  // "thumbnail_url" field.
  String? _thumbnailUrl;
  String get thumbnailUrl => _thumbnailUrl ?? '';
  set thumbnailUrl(String? val) => _thumbnailUrl = val;

  bool hasThumbnailUrl() => _thumbnailUrl != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "education_key" field.
  String? _educationKey;
  String get educationKey => _educationKey ?? '';
  set educationKey(String? val) => _educationKey = val;

  bool hasEducationKey() => _educationKey != null;

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        contentType: data['contentType'] as String?,
        addedBy: data['addedBy'] as String?,
        uri: data['uri'] as String?,
        thumbnailUrl: data['thumbnail_url'] as String?,
        id: data['id'] as String?,
        educationKey: data['education_key'] as String?,
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'contentType': _contentType,
        'addedBy': _addedBy,
        'uri': _uri,
        'thumbnail_url': _thumbnailUrl,
        'id': _id,
        'education_key': _educationKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'contentType': serializeParam(
          _contentType,
          ParamType.String,
        ),
        'addedBy': serializeParam(
          _addedBy,
          ParamType.String,
        ),
        'uri': serializeParam(
          _uri,
          ParamType.String,
        ),
        'thumbnail_url': serializeParam(
          _thumbnailUrl,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'education_key': serializeParam(
          _educationKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsStruct(
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
        contentType: deserializeParam(
          data['contentType'],
          ParamType.String,
          false,
        ),
        addedBy: deserializeParam(
          data['addedBy'],
          ParamType.String,
          false,
        ),
        uri: deserializeParam(
          data['uri'],
          ParamType.String,
          false,
        ),
        thumbnailUrl: deserializeParam(
          data['thumbnail_url'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        educationKey: deserializeParam(
          data['education_key'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsStruct &&
        title == other.title &&
        description == other.description &&
        contentType == other.contentType &&
        addedBy == other.addedBy &&
        uri == other.uri &&
        thumbnailUrl == other.thumbnailUrl &&
        id == other.id &&
        educationKey == other.educationKey;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        description,
        contentType,
        addedBy,
        uri,
        thumbnailUrl,
        id,
        educationKey
      ]);
}

ItemsStruct createItemsStruct({
  String? title,
  String? description,
  String? contentType,
  String? addedBy,
  String? uri,
  String? thumbnailUrl,
  String? id,
  String? educationKey,
}) =>
    ItemsStruct(
      title: title,
      description: description,
      contentType: contentType,
      addedBy: addedBy,
      uri: uri,
      thumbnailUrl: thumbnailUrl,
      id: id,
      educationKey: educationKey,
    );
