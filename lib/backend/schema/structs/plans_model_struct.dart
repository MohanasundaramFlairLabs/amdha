// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlansModelStruct extends BaseStruct {
  PlansModelStruct({
    List<PlansStruct>? plans,
  }) : _plans = plans;

  // "plans" field.
  List<PlansStruct>? _plans;
  List<PlansStruct> get plans => _plans ?? const [];
  set plans(List<PlansStruct>? val) => _plans = val;

  void updatePlans(Function(List<PlansStruct>) updateFn) {
    updateFn(_plans ??= []);
  }

  bool hasPlans() => _plans != null;

  static PlansModelStruct fromMap(Map<String, dynamic> data) =>
      PlansModelStruct(
        plans: getStructList(
          data['plans'],
          PlansStruct.fromMap,
        ),
      );

  static PlansModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PlansModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'plans': _plans?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'plans': serializeParam(
          _plans,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PlansModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlansModelStruct(
        plans: deserializeStructParam<PlansStruct>(
          data['plans'],
          ParamType.DataStruct,
          true,
          structBuilder: PlansStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PlansModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlansModelStruct && listEquality.equals(plans, other.plans);
  }

  @override
  int get hashCode => const ListEquality().hash([plans]);
}

PlansModelStruct createPlansModelStruct() => PlansModelStruct();
