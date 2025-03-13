// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllPlansStruct extends BaseStruct {
  AllPlansStruct({
    List<PlansStruct>? plans,
    List<SubscriptionsStruct>? subscriptions,
  })  : _plans = plans,
        _subscriptions = subscriptions;

  // "plans" field.
  List<PlansStruct>? _plans;
  List<PlansStruct> get plans => _plans ?? const [];
  set plans(List<PlansStruct>? val) => _plans = val;

  void updatePlans(Function(List<PlansStruct>) updateFn) {
    updateFn(_plans ??= []);
  }

  bool hasPlans() => _plans != null;

  // "subscriptions" field.
  List<SubscriptionsStruct>? _subscriptions;
  List<SubscriptionsStruct> get subscriptions => _subscriptions ?? const [];
  set subscriptions(List<SubscriptionsStruct>? val) => _subscriptions = val;

  void updateSubscriptions(Function(List<SubscriptionsStruct>) updateFn) {
    updateFn(_subscriptions ??= []);
  }

  bool hasSubscriptions() => _subscriptions != null;

  static AllPlansStruct fromMap(Map<String, dynamic> data) => AllPlansStruct(
        plans: getStructList(
          data['plans'],
          PlansStruct.fromMap,
        ),
        subscriptions: getStructList(
          data['subscriptions'],
          SubscriptionsStruct.fromMap,
        ),
      );

  static AllPlansStruct? maybeFromMap(dynamic data) =>
      data is Map ? AllPlansStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'plans': _plans?.map((e) => e.toMap()).toList(),
        'subscriptions': _subscriptions?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'plans': serializeParam(
          _plans,
          ParamType.DataStruct,
          isList: true,
        ),
        'subscriptions': serializeParam(
          _subscriptions,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AllPlansStruct fromSerializableMap(Map<String, dynamic> data) =>
      AllPlansStruct(
        plans: deserializeStructParam<PlansStruct>(
          data['plans'],
          ParamType.DataStruct,
          true,
          structBuilder: PlansStruct.fromSerializableMap,
        ),
        subscriptions: deserializeStructParam<SubscriptionsStruct>(
          data['subscriptions'],
          ParamType.DataStruct,
          true,
          structBuilder: SubscriptionsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AllPlansStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AllPlansStruct &&
        listEquality.equals(plans, other.plans) &&
        listEquality.equals(subscriptions, other.subscriptions);
  }

  @override
  int get hashCode => const ListEquality().hash([plans, subscriptions]);
}

AllPlansStruct createAllPlansStruct() => AllPlansStruct();
