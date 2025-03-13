// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListofFilesModelStruct extends BaseStruct {
  ListofFilesModelStruct({
    String? internalId,
    String? externalId,
    String? name,
    String? path,
    String? extension,
    String? size,
    String? reportType,
    String? description,
    String? fileSignedURL,
    String? updatedAt,
    String? id,
    String? uploadDate,
    String? documentType,
  })  : _internalId = internalId,
        _externalId = externalId,
        _name = name,
        _path = path,
        _extension = extension,
        _size = size,
        _reportType = reportType,
        _description = description,
        _fileSignedURL = fileSignedURL,
        _updatedAt = updatedAt,
        _id = id,
        _uploadDate = uploadDate,
        _documentType = documentType;

  // "internalId" field.
  String? _internalId;
  String get internalId => _internalId ?? '';
  set internalId(String? val) => _internalId = val;

  bool hasInternalId() => _internalId != null;

  // "externalId" field.
  String? _externalId;
  String get externalId => _externalId ?? '';
  set externalId(String? val) => _externalId = val;

  bool hasExternalId() => _externalId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  // "extension" field.
  String? _extension;
  String get extension => _extension ?? '';
  set extension(String? val) => _extension = val;

  bool hasExtension() => _extension != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  set size(String? val) => _size = val;

  bool hasSize() => _size != null;

  // "reportType" field.
  String? _reportType;
  String get reportType => _reportType ?? '';
  set reportType(String? val) => _reportType = val;

  bool hasReportType() => _reportType != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "fileSignedURL" field.
  String? _fileSignedURL;
  String get fileSignedURL => _fileSignedURL ?? '';
  set fileSignedURL(String? val) => _fileSignedURL = val;

  bool hasFileSignedURL() => _fileSignedURL != null;

  // "updatedAt" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "upload_date" field.
  String? _uploadDate;
  String get uploadDate => _uploadDate ?? '';
  set uploadDate(String? val) => _uploadDate = val;

  bool hasUploadDate() => _uploadDate != null;

  // "documentType" field.
  String? _documentType;
  String get documentType => _documentType ?? '';
  set documentType(String? val) => _documentType = val;

  bool hasDocumentType() => _documentType != null;

  static ListofFilesModelStruct fromMap(Map<String, dynamic> data) =>
      ListofFilesModelStruct(
        internalId: data['internalId'] as String?,
        externalId: data['externalId'] as String?,
        name: data['name'] as String?,
        path: data['path'] as String?,
        extension: data['extension'] as String?,
        size: data['size'] as String?,
        reportType: data['reportType'] as String?,
        description: data['description'] as String?,
        fileSignedURL: data['fileSignedURL'] as String?,
        updatedAt: data['updatedAt'] as String?,
        id: data['id'] as String?,
        uploadDate: data['upload_date'] as String?,
        documentType: data['documentType'] as String?,
      );

  static ListofFilesModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ListofFilesModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'internalId': _internalId,
        'externalId': _externalId,
        'name': _name,
        'path': _path,
        'extension': _extension,
        'size': _size,
        'reportType': _reportType,
        'description': _description,
        'fileSignedURL': _fileSignedURL,
        'updatedAt': _updatedAt,
        'id': _id,
        'upload_date': _uploadDate,
        'documentType': _documentType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'internalId': serializeParam(
          _internalId,
          ParamType.String,
        ),
        'externalId': serializeParam(
          _externalId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
        'extension': serializeParam(
          _extension,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.String,
        ),
        'reportType': serializeParam(
          _reportType,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'fileSignedURL': serializeParam(
          _fileSignedURL,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'upload_date': serializeParam(
          _uploadDate,
          ParamType.String,
        ),
        'documentType': serializeParam(
          _documentType,
          ParamType.String,
        ),
      }.withoutNulls;

  static ListofFilesModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ListofFilesModelStruct(
        internalId: deserializeParam(
          data['internalId'],
          ParamType.String,
          false,
        ),
        externalId: deserializeParam(
          data['externalId'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
        extension: deserializeParam(
          data['extension'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.String,
          false,
        ),
        reportType: deserializeParam(
          data['reportType'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        fileSignedURL: deserializeParam(
          data['fileSignedURL'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        uploadDate: deserializeParam(
          data['upload_date'],
          ParamType.String,
          false,
        ),
        documentType: deserializeParam(
          data['documentType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ListofFilesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ListofFilesModelStruct &&
        internalId == other.internalId &&
        externalId == other.externalId &&
        name == other.name &&
        path == other.path &&
        extension == other.extension &&
        size == other.size &&
        reportType == other.reportType &&
        description == other.description &&
        fileSignedURL == other.fileSignedURL &&
        updatedAt == other.updatedAt &&
        id == other.id &&
        uploadDate == other.uploadDate &&
        documentType == other.documentType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        internalId,
        externalId,
        name,
        path,
        extension,
        size,
        reportType,
        description,
        fileSignedURL,
        updatedAt,
        id,
        uploadDate,
        documentType
      ]);
}

ListofFilesModelStruct createListofFilesModelStruct({
  String? internalId,
  String? externalId,
  String? name,
  String? path,
  String? extension,
  String? size,
  String? reportType,
  String? description,
  String? fileSignedURL,
  String? updatedAt,
  String? id,
  String? uploadDate,
  String? documentType,
}) =>
    ListofFilesModelStruct(
      internalId: internalId,
      externalId: externalId,
      name: name,
      path: path,
      extension: extension,
      size: size,
      reportType: reportType,
      description: description,
      fileSignedURL: fileSignedURL,
      updatedAt: updatedAt,
      id: id,
      uploadDate: uploadDate,
      documentType: documentType,
    );
