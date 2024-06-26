// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VitalsModelStruct extends BaseStruct {
  VitalsModelStruct({
    List<VitalsStruct>? vitals,
  }) : _vitals = vitals;

  // "vitals" field.
  List<VitalsStruct>? _vitals;
  List<VitalsStruct> get vitals => _vitals ?? const [];
  set vitals(List<VitalsStruct>? val) => _vitals = val;

  void updateVitals(Function(List<VitalsStruct>) updateFn) {
    updateFn(_vitals ??= []);
  }

  bool hasVitals() => _vitals != null;

  static VitalsModelStruct fromMap(Map<String, dynamic> data) =>
      VitalsModelStruct(
        vitals: getStructList(
          data['vitals'],
          VitalsStruct.fromMap,
        ),
      );

  static VitalsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? VitalsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vitals': _vitals?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vitals': serializeParam(
          _vitals,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static VitalsModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      VitalsModelStruct(
        vitals: deserializeStructParam<VitalsStruct>(
          data['vitals'],
          ParamType.DataStruct,
          true,
          structBuilder: VitalsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'VitalsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VitalsModelStruct &&
        listEquality.equals(vitals, other.vitals);
  }

  @override
  int get hashCode => const ListEquality().hash([vitals]);
}

VitalsModelStruct createVitalsModelStruct() => VitalsModelStruct();
