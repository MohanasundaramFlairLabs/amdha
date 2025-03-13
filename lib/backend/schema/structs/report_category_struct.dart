// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportCategoryStruct extends BaseStruct {
  ReportCategoryStruct({
    String? id,
    String? reportType,
    List<String>? documentType,
    String? createdAt,
    String? updatedAt,
  })  : _id = id,
        _reportType = reportType,
        _documentType = documentType,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "reportType" field.
  String? _reportType;
  String get reportType => _reportType ?? '';
  set reportType(String? val) => _reportType = val;

  bool hasReportType() => _reportType != null;

  // "documentType" field.
  List<String>? _documentType;
  List<String> get documentType => _documentType ?? const [];
  set documentType(List<String>? val) => _documentType = val;

  void updateDocumentType(Function(List<String>) updateFn) {
    updateFn(_documentType ??= []);
  }

  bool hasDocumentType() => _documentType != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  static ReportCategoryStruct fromMap(Map<String, dynamic> data) =>
      ReportCategoryStruct(
        id: data['id'] as String?,
        reportType: data['reportType'] as String?,
        documentType: getDataList(data['documentType']),
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
      );

  static ReportCategoryStruct? maybeFromMap(dynamic data) => data is Map
      ? ReportCategoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'reportType': _reportType,
        'documentType': _documentType,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'reportType': serializeParam(
          _reportType,
          ParamType.String,
        ),
        'documentType': serializeParam(
          _documentType,
          ParamType.String,
          isList: true,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReportCategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReportCategoryStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        reportType: deserializeParam(
          data['reportType'],
          ParamType.String,
          false,
        ),
        documentType: deserializeParam<String>(
          data['documentType'],
          ParamType.String,
          true,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReportCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ReportCategoryStruct &&
        id == other.id &&
        reportType == other.reportType &&
        listEquality.equals(documentType, other.documentType) &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, reportType, documentType, createdAt, updatedAt]);
}

ReportCategoryStruct createReportCategoryStruct({
  String? id,
  String? reportType,
  String? createdAt,
  String? updatedAt,
}) =>
    ReportCategoryStruct(
      id: id,
      reportType: reportType,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
