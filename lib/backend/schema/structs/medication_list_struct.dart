// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationListStruct extends BaseStruct {
  MedicationListStruct({
    String? medicationName,
    String? dosage,
    String? unit,
    List<String>? frequency,
    String? startDate,
    String? period,
    String? endDate,
    String? additionalNote,
    String? often,
    bool? reminder,
  })  : _medicationName = medicationName,
        _dosage = dosage,
        _unit = unit,
        _frequency = frequency,
        _startDate = startDate,
        _period = period,
        _endDate = endDate,
        _additionalNote = additionalNote,
        _often = often,
        _reminder = reminder;

  // "medication_name" field.
  String? _medicationName;
  String get medicationName => _medicationName ?? '';
  set medicationName(String? val) => _medicationName = val;

  bool hasMedicationName() => _medicationName != null;

  // "dosage" field.
  String? _dosage;
  String get dosage => _dosage ?? '';
  set dosage(String? val) => _dosage = val;

  bool hasDosage() => _dosage != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  // "frequency" field.
  List<String>? _frequency;
  List<String> get frequency => _frequency ?? const [];
  set frequency(List<String>? val) => _frequency = val;

  void updateFrequency(Function(List<String>) updateFn) {
    updateFn(_frequency ??= []);
  }

  bool hasFrequency() => _frequency != null;

  // "start_date" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "period" field.
  String? _period;
  String get period => _period ?? '';
  set period(String? val) => _period = val;

  bool hasPeriod() => _period != null;

  // "end_date" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  set endDate(String? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "additional_note" field.
  String? _additionalNote;
  String get additionalNote => _additionalNote ?? '';
  set additionalNote(String? val) => _additionalNote = val;

  bool hasAdditionalNote() => _additionalNote != null;

  // "often" field.
  String? _often;
  String get often => _often ?? '';
  set often(String? val) => _often = val;

  bool hasOften() => _often != null;

  // "reminder" field.
  bool? _reminder;
  bool get reminder => _reminder ?? false;
  set reminder(bool? val) => _reminder = val;

  bool hasReminder() => _reminder != null;

  static MedicationListStruct fromMap(Map<String, dynamic> data) =>
      MedicationListStruct(
        medicationName: data['medication_name'] as String?,
        dosage: data['dosage'] as String?,
        unit: data['unit'] as String?,
        frequency: getDataList(data['frequency']),
        startDate: data['start_date'] as String?,
        period: data['period'] as String?,
        endDate: data['end_date'] as String?,
        additionalNote: data['additional_note'] as String?,
        often: data['often'] as String?,
        reminder: data['reminder'] as bool?,
      );

  static MedicationListStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicationListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'medication_name': _medicationName,
        'dosage': _dosage,
        'unit': _unit,
        'frequency': _frequency,
        'start_date': _startDate,
        'period': _period,
        'end_date': _endDate,
        'additional_note': _additionalNote,
        'often': _often,
        'reminder': _reminder,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medication_name': serializeParam(
          _medicationName,
          ParamType.String,
        ),
        'dosage': serializeParam(
          _dosage,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'frequency': serializeParam(
          _frequency,
          ParamType.String,
          isList: true,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'period': serializeParam(
          _period,
          ParamType.String,
        ),
        'end_date': serializeParam(
          _endDate,
          ParamType.String,
        ),
        'additional_note': serializeParam(
          _additionalNote,
          ParamType.String,
        ),
        'often': serializeParam(
          _often,
          ParamType.String,
        ),
        'reminder': serializeParam(
          _reminder,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MedicationListStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicationListStruct(
        medicationName: deserializeParam(
          data['medication_name'],
          ParamType.String,
          false,
        ),
        dosage: deserializeParam(
          data['dosage'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        frequency: deserializeParam<String>(
          data['frequency'],
          ParamType.String,
          true,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.String,
          false,
        ),
        period: deserializeParam(
          data['period'],
          ParamType.String,
          false,
        ),
        endDate: deserializeParam(
          data['end_date'],
          ParamType.String,
          false,
        ),
        additionalNote: deserializeParam(
          data['additional_note'],
          ParamType.String,
          false,
        ),
        often: deserializeParam(
          data['often'],
          ParamType.String,
          false,
        ),
        reminder: deserializeParam(
          data['reminder'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MedicationListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedicationListStruct &&
        medicationName == other.medicationName &&
        dosage == other.dosage &&
        unit == other.unit &&
        listEquality.equals(frequency, other.frequency) &&
        startDate == other.startDate &&
        period == other.period &&
        endDate == other.endDate &&
        additionalNote == other.additionalNote &&
        often == other.often &&
        reminder == other.reminder;
  }

  @override
  int get hashCode => const ListEquality().hash([
        medicationName,
        dosage,
        unit,
        frequency,
        startDate,
        period,
        endDate,
        additionalNote,
        often,
        reminder
      ]);
}

MedicationListStruct createMedicationListStruct({
  String? medicationName,
  String? dosage,
  String? unit,
  String? startDate,
  String? period,
  String? endDate,
  String? additionalNote,
  String? often,
  bool? reminder,
}) =>
    MedicationListStruct(
      medicationName: medicationName,
      dosage: dosage,
      unit: unit,
      startDate: startDate,
      period: period,
      endDate: endDate,
      additionalNote: additionalNote,
      often: often,
      reminder: reminder,
    );
