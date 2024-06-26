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
  })  : _title = title,
        _description = description,
        _contentType = contentType,
        _addedBy = addedBy,
        _uri = uri;

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

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        contentType: data['contentType'] as String?,
        addedBy: data['addedBy'] as String?,
        uri: data['uri'] as String?,
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'contentType': _contentType,
        'addedBy': _addedBy,
        'uri': _uri,
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
        uri == other.uri;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, description, contentType, addedBy, uri]);
}

ItemsStruct createItemsStruct({
  String? title,
  String? description,
  String? contentType,
  String? addedBy,
  String? uri,
}) =>
    ItemsStruct(
      title: title,
      description: description,
      contentType: contentType,
      addedBy: addedBy,
      uri: uri,
    );
