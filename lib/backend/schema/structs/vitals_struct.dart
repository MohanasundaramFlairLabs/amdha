// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VitalsStruct extends BaseStruct {
  VitalsStruct({
    String? type,
    String? value,
    String? note,
    String? entryType,
    String? date,
    String? time,
    String? id,
    ObjectStruct? object,
    String? severity,
    String? unit,
    String? label,
    String? description,
    List<MultiVItalsStruct>? multiVitals,
  })  : _type = type,
        _value = value,
        _note = note,
        _entryType = entryType,
        _date = date,
        _time = time,
        _id = id,
        _object = object,
        _severity = severity,
        _unit = unit,
        _label = label,
        _description = description,
        _multiVitals = multiVitals;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "entryType" field.
  String? _entryType;
  String get entryType => _entryType ?? '';
  set entryType(String? val) => _entryType = val;

  bool hasEntryType() => _entryType != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "object" field.
  ObjectStruct? _object;
  ObjectStruct get object => _object ?? ObjectStruct();
  set object(ObjectStruct? val) => _object = val;

  void updateObject(Function(ObjectStruct) updateFn) {
    updateFn(_object ??= ObjectStruct());
  }

  bool hasObject() => _object != null;

  // "severity" field.
  String? _severity;
  String get severity => _severity ?? '';
  set severity(String? val) => _severity = val;

  bool hasSeverity() => _severity != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "multiVitals" field.
  List<MultiVItalsStruct>? _multiVitals;
  List<MultiVItalsStruct> get multiVitals => _multiVitals ?? const [];
  set multiVitals(List<MultiVItalsStruct>? val) => _multiVitals = val;

  void updateMultiVitals(Function(List<MultiVItalsStruct>) updateFn) {
    updateFn(_multiVitals ??= []);
  }

  bool hasMultiVitals() => _multiVitals != null;

  static VitalsStruct fromMap(Map<String, dynamic> data) => VitalsStruct(
        type: data['type'] as String?,
        value: data['value'] as String?,
        note: data['note'] as String?,
        entryType: data['entryType'] as String?,
        date: data['date'] as String?,
        time: data['time'] as String?,
        id: data['id'] as String?,
        object: data['object'] is ObjectStruct
            ? data['object']
            : ObjectStruct.maybeFromMap(data['object']),
        severity: data['severity'] as String?,
        unit: data['unit'] as String?,
        label: data['label'] as String?,
        description: data['description'] as String?,
        multiVitals: getStructList(
          data['multiVitals'],
          MultiVItalsStruct.fromMap,
        ),
      );

  static VitalsStruct? maybeFromMap(dynamic data) =>
      data is Map ? VitalsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'value': _value,
        'note': _note,
        'entryType': _entryType,
        'date': _date,
        'time': _time,
        'id': _id,
        'object': _object?.toMap(),
        'severity': _severity,
        'unit': _unit,
        'label': _label,
        'description': _description,
        'multiVitals': _multiVitals?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'entryType': serializeParam(
          _entryType,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'object': serializeParam(
          _object,
          ParamType.DataStruct,
        ),
        'severity': serializeParam(
          _severity,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'multiVitals': serializeParam(
          _multiVitals,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static VitalsStruct fromSerializableMap(Map<String, dynamic> data) =>
      VitalsStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        entryType: deserializeParam(
          data['entryType'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        object: deserializeStructParam(
          data['object'],
          ParamType.DataStruct,
          false,
          structBuilder: ObjectStruct.fromSerializableMap,
        ),
        severity: deserializeParam(
          data['severity'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        multiVitals: deserializeStructParam<MultiVItalsStruct>(
          data['multiVitals'],
          ParamType.DataStruct,
          true,
          structBuilder: MultiVItalsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'VitalsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VitalsStruct &&
        type == other.type &&
        value == other.value &&
        note == other.note &&
        entryType == other.entryType &&
        date == other.date &&
        time == other.time &&
        id == other.id &&
        object == other.object &&
        severity == other.severity &&
        unit == other.unit &&
        label == other.label &&
        description == other.description &&
        listEquality.equals(multiVitals, other.multiVitals);
  }

  @override
  int get hashCode => const ListEquality().hash([
        type,
        value,
        note,
        entryType,
        date,
        time,
        id,
        object,
        severity,
        unit,
        label,
        description,
        multiVitals
      ]);
}

VitalsStruct createVitalsStruct({
  String? type,
  String? value,
  String? note,
  String? entryType,
  String? date,
  String? time,
  String? id,
  ObjectStruct? object,
  String? severity,
  String? unit,
  String? label,
  String? description,
}) =>
    VitalsStruct(
      type: type,
      value: value,
      note: note,
      entryType: entryType,
      date: date,
      time: time,
      id: id,
      object: object ?? ObjectStruct(),
      severity: severity,
      unit: unit,
      label: label,
      description: description,
    );
