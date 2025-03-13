// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResultsStruct extends BaseStruct {
  ResultsStruct({
    String? shortName,
    String? fullName,
    String? unitIdentifier,
    String? medicineType,
  })  : _shortName = shortName,
        _fullName = fullName,
        _unitIdentifier = unitIdentifier,
        _medicineType = medicineType;

  // "ShortName" field.
  String? _shortName;
  String get shortName => _shortName ?? '';
  set shortName(String? val) => _shortName = val;

  bool hasShortName() => _shortName != null;

  // "FullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "UnitIdentifier" field.
  String? _unitIdentifier;
  String get unitIdentifier => _unitIdentifier ?? '';
  set unitIdentifier(String? val) => _unitIdentifier = val;

  bool hasUnitIdentifier() => _unitIdentifier != null;

  // "MedicineType" field.
  String? _medicineType;
  String get medicineType => _medicineType ?? '';
  set medicineType(String? val) => _medicineType = val;

  bool hasMedicineType() => _medicineType != null;

  static ResultsStruct fromMap(Map<String, dynamic> data) => ResultsStruct(
        shortName: data['ShortName'] as String?,
        fullName: data['FullName'] as String?,
        unitIdentifier: data['UnitIdentifier'] as String?,
        medicineType: data['MedicineType'] as String?,
      );

  static ResultsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ResultsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ShortName': _shortName,
        'FullName': _fullName,
        'UnitIdentifier': _unitIdentifier,
        'MedicineType': _medicineType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ShortName': serializeParam(
          _shortName,
          ParamType.String,
        ),
        'FullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'UnitIdentifier': serializeParam(
          _unitIdentifier,
          ParamType.String,
        ),
        'MedicineType': serializeParam(
          _medicineType,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResultsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResultsStruct(
        shortName: deserializeParam(
          data['ShortName'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['FullName'],
          ParamType.String,
          false,
        ),
        unitIdentifier: deserializeParam(
          data['UnitIdentifier'],
          ParamType.String,
          false,
        ),
        medicineType: deserializeParam(
          data['MedicineType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResultsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResultsStruct &&
        shortName == other.shortName &&
        fullName == other.fullName &&
        unitIdentifier == other.unitIdentifier &&
        medicineType == other.medicineType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([shortName, fullName, unitIdentifier, medicineType]);
}

ResultsStruct createResultsStruct({
  String? shortName,
  String? fullName,
  String? unitIdentifier,
  String? medicineType,
}) =>
    ResultsStruct(
      shortName: shortName,
      fullName: fullName,
      unitIdentifier: unitIdentifier,
      medicineType: medicineType,
    );
