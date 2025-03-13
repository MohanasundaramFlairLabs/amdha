// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SlotModelStruct extends BaseStruct {
  SlotModelStruct({
    List<AvailableSlotsStruct>? availableSlots,
  }) : _availableSlots = availableSlots;

  // "availableSlots" field.
  List<AvailableSlotsStruct>? _availableSlots;
  List<AvailableSlotsStruct> get availableSlots => _availableSlots ?? const [];
  set availableSlots(List<AvailableSlotsStruct>? val) => _availableSlots = val;

  void updateAvailableSlots(Function(List<AvailableSlotsStruct>) updateFn) {
    updateFn(_availableSlots ??= []);
  }

  bool hasAvailableSlots() => _availableSlots != null;

  static SlotModelStruct fromMap(Map<String, dynamic> data) => SlotModelStruct(
        availableSlots: getStructList(
          data['availableSlots'],
          AvailableSlotsStruct.fromMap,
        ),
      );

  static SlotModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SlotModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'availableSlots': _availableSlots?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'availableSlots': serializeParam(
          _availableSlots,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SlotModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      SlotModelStruct(
        availableSlots: deserializeStructParam<AvailableSlotsStruct>(
          data['availableSlots'],
          ParamType.DataStruct,
          true,
          structBuilder: AvailableSlotsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SlotModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SlotModelStruct &&
        listEquality.equals(availableSlots, other.availableSlots);
  }

  @override
  int get hashCode => const ListEquality().hash([availableSlots]);
}

SlotModelStruct createSlotModelStruct() => SlotModelStruct();
