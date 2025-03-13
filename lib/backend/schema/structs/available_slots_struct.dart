// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvailableSlotsStruct extends BaseStruct {
  AvailableSlotsStruct({
    String? date,
    List<SlotsStruct>? slots,
  })  : _date = date,
        _slots = slots;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "slots" field.
  List<SlotsStruct>? _slots;
  List<SlotsStruct> get slots => _slots ?? const [];
  set slots(List<SlotsStruct>? val) => _slots = val;

  void updateSlots(Function(List<SlotsStruct>) updateFn) {
    updateFn(_slots ??= []);
  }

  bool hasSlots() => _slots != null;

  static AvailableSlotsStruct fromMap(Map<String, dynamic> data) =>
      AvailableSlotsStruct(
        date: data['date'] as String?,
        slots: getStructList(
          data['slots'],
          SlotsStruct.fromMap,
        ),
      );

  static AvailableSlotsStruct? maybeFromMap(dynamic data) => data is Map
      ? AvailableSlotsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'slots': _slots?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'slots': serializeParam(
          _slots,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AvailableSlotsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvailableSlotsStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        slots: deserializeStructParam<SlotsStruct>(
          data['slots'],
          ParamType.DataStruct,
          true,
          structBuilder: SlotsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AvailableSlotsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AvailableSlotsStruct &&
        date == other.date &&
        listEquality.equals(slots, other.slots);
  }

  @override
  int get hashCode => const ListEquality().hash([date, slots]);
}

AvailableSlotsStruct createAvailableSlotsStruct({
  String? date,
}) =>
    AvailableSlotsStruct(
      date: date,
    );
