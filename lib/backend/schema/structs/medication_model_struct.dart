// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicationModelStruct extends BaseStruct {
  MedicationModelStruct({
    List<String>? time,
    ReminderTimingsStruct? reminderTimings,
    String? internalId,
    String? externalId,
    String? name,
    String? dosage,
    String? howOften,
    String? startDate,
    int? period,
    String? endDate,
    bool? isCritical,
    String? additionalNote,
    bool? autoReminder,
    String? addedBy,
    String? id,
    String? instruction,
    String? units,
  })  : _time = time,
        _reminderTimings = reminderTimings,
        _internalId = internalId,
        _externalId = externalId,
        _name = name,
        _dosage = dosage,
        _howOften = howOften,
        _startDate = startDate,
        _period = period,
        _endDate = endDate,
        _isCritical = isCritical,
        _additionalNote = additionalNote,
        _autoReminder = autoReminder,
        _addedBy = addedBy,
        _id = id,
        _instruction = instruction,
        _units = units;

  // "time" field.
  List<String>? _time;
  List<String> get time => _time ?? const [];
  set time(List<String>? val) => _time = val;

  void updateTime(Function(List<String>) updateFn) {
    updateFn(_time ??= []);
  }

  bool hasTime() => _time != null;

  // "reminderTimings" field.
  ReminderTimingsStruct? _reminderTimings;
  ReminderTimingsStruct get reminderTimings =>
      _reminderTimings ?? ReminderTimingsStruct();
  set reminderTimings(ReminderTimingsStruct? val) => _reminderTimings = val;

  void updateReminderTimings(Function(ReminderTimingsStruct) updateFn) {
    updateFn(_reminderTimings ??= ReminderTimingsStruct());
  }

  bool hasReminderTimings() => _reminderTimings != null;

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

  // "dosage" field.
  String? _dosage;
  String get dosage => _dosage ?? '';
  set dosage(String? val) => _dosage = val;

  bool hasDosage() => _dosage != null;

  // "howOften" field.
  String? _howOften;
  String get howOften => _howOften ?? '';
  set howOften(String? val) => _howOften = val;

  bool hasHowOften() => _howOften != null;

  // "startDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "period" field.
  int? _period;
  int get period => _period ?? 0;
  set period(int? val) => _period = val;

  void incrementPeriod(int amount) => period = period + amount;

  bool hasPeriod() => _period != null;

  // "endDate" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  set endDate(String? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "isCritical" field.
  bool? _isCritical;
  bool get isCritical => _isCritical ?? false;
  set isCritical(bool? val) => _isCritical = val;

  bool hasIsCritical() => _isCritical != null;

  // "additionalNote" field.
  String? _additionalNote;
  String get additionalNote => _additionalNote ?? '';
  set additionalNote(String? val) => _additionalNote = val;

  bool hasAdditionalNote() => _additionalNote != null;

  // "autoReminder" field.
  bool? _autoReminder;
  bool get autoReminder => _autoReminder ?? false;
  set autoReminder(bool? val) => _autoReminder = val;

  bool hasAutoReminder() => _autoReminder != null;

  // "addedBy" field.
  String? _addedBy;
  String get addedBy => _addedBy ?? '';
  set addedBy(String? val) => _addedBy = val;

  bool hasAddedBy() => _addedBy != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "instruction" field.
  String? _instruction;
  String get instruction => _instruction ?? '';
  set instruction(String? val) => _instruction = val;

  bool hasInstruction() => _instruction != null;

  // "units" field.
  String? _units;
  String get units => _units ?? '';
  set units(String? val) => _units = val;

  bool hasUnits() => _units != null;

  static MedicationModelStruct fromMap(Map<String, dynamic> data) =>
      MedicationModelStruct(
        time: getDataList(data['time']),
        reminderTimings: data['reminderTimings'] is ReminderTimingsStruct
            ? data['reminderTimings']
            : ReminderTimingsStruct.maybeFromMap(data['reminderTimings']),
        internalId: data['internalId'] as String?,
        externalId: data['externalId'] as String?,
        name: data['name'] as String?,
        dosage: data['dosage'] as String?,
        howOften: data['howOften'] as String?,
        startDate: data['startDate'] as String?,
        period: castToType<int>(data['period']),
        endDate: data['endDate'] as String?,
        isCritical: data['isCritical'] as bool?,
        additionalNote: data['additionalNote'] as String?,
        autoReminder: data['autoReminder'] as bool?,
        addedBy: data['addedBy'] as String?,
        id: data['id'] as String?,
        instruction: data['instruction'] as String?,
        units: data['units'] as String?,
      );

  static MedicationModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MedicationModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'reminderTimings': _reminderTimings?.toMap(),
        'internalId': _internalId,
        'externalId': _externalId,
        'name': _name,
        'dosage': _dosage,
        'howOften': _howOften,
        'startDate': _startDate,
        'period': _period,
        'endDate': _endDate,
        'isCritical': _isCritical,
        'additionalNote': _additionalNote,
        'autoReminder': _autoReminder,
        'addedBy': _addedBy,
        'id': _id,
        'instruction': _instruction,
        'units': _units,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.String,
          isList: true,
        ),
        'reminderTimings': serializeParam(
          _reminderTimings,
          ParamType.DataStruct,
        ),
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
        'dosage': serializeParam(
          _dosage,
          ParamType.String,
        ),
        'howOften': serializeParam(
          _howOften,
          ParamType.String,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'period': serializeParam(
          _period,
          ParamType.int,
        ),
        'endDate': serializeParam(
          _endDate,
          ParamType.String,
        ),
        'isCritical': serializeParam(
          _isCritical,
          ParamType.bool,
        ),
        'additionalNote': serializeParam(
          _additionalNote,
          ParamType.String,
        ),
        'autoReminder': serializeParam(
          _autoReminder,
          ParamType.bool,
        ),
        'addedBy': serializeParam(
          _addedBy,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'instruction': serializeParam(
          _instruction,
          ParamType.String,
        ),
        'units': serializeParam(
          _units,
          ParamType.String,
        ),
      }.withoutNulls;

  static MedicationModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicationModelStruct(
        time: deserializeParam<String>(
          data['time'],
          ParamType.String,
          true,
        ),
        reminderTimings: deserializeStructParam(
          data['reminderTimings'],
          ParamType.DataStruct,
          false,
          structBuilder: ReminderTimingsStruct.fromSerializableMap,
        ),
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
        dosage: deserializeParam(
          data['dosage'],
          ParamType.String,
          false,
        ),
        howOften: deserializeParam(
          data['howOften'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.String,
          false,
        ),
        period: deserializeParam(
          data['period'],
          ParamType.int,
          false,
        ),
        endDate: deserializeParam(
          data['endDate'],
          ParamType.String,
          false,
        ),
        isCritical: deserializeParam(
          data['isCritical'],
          ParamType.bool,
          false,
        ),
        additionalNote: deserializeParam(
          data['additionalNote'],
          ParamType.String,
          false,
        ),
        autoReminder: deserializeParam(
          data['autoReminder'],
          ParamType.bool,
          false,
        ),
        addedBy: deserializeParam(
          data['addedBy'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        instruction: deserializeParam(
          data['instruction'],
          ParamType.String,
          false,
        ),
        units: deserializeParam(
          data['units'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MedicationModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MedicationModelStruct &&
        listEquality.equals(time, other.time) &&
        reminderTimings == other.reminderTimings &&
        internalId == other.internalId &&
        externalId == other.externalId &&
        name == other.name &&
        dosage == other.dosage &&
        howOften == other.howOften &&
        startDate == other.startDate &&
        period == other.period &&
        endDate == other.endDate &&
        isCritical == other.isCritical &&
        additionalNote == other.additionalNote &&
        autoReminder == other.autoReminder &&
        addedBy == other.addedBy &&
        id == other.id &&
        instruction == other.instruction &&
        units == other.units;
  }

  @override
  int get hashCode => const ListEquality().hash([
        time,
        reminderTimings,
        internalId,
        externalId,
        name,
        dosage,
        howOften,
        startDate,
        period,
        endDate,
        isCritical,
        additionalNote,
        autoReminder,
        addedBy,
        id,
        instruction,
        units
      ]);
}

MedicationModelStruct createMedicationModelStruct({
  ReminderTimingsStruct? reminderTimings,
  String? internalId,
  String? externalId,
  String? name,
  String? dosage,
  String? howOften,
  String? startDate,
  int? period,
  String? endDate,
  bool? isCritical,
  String? additionalNote,
  bool? autoReminder,
  String? addedBy,
  String? id,
  String? instruction,
  String? units,
}) =>
    MedicationModelStruct(
      reminderTimings: reminderTimings ?? ReminderTimingsStruct(),
      internalId: internalId,
      externalId: externalId,
      name: name,
      dosage: dosage,
      howOften: howOften,
      startDate: startDate,
      period: period,
      endDate: endDate,
      isCritical: isCritical,
      additionalNote: additionalNote,
      autoReminder: autoReminder,
      addedBy: addedBy,
      id: id,
      instruction: instruction,
      units: units,
    );
