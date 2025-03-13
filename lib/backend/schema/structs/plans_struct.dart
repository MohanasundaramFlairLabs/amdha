// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlansStruct extends BaseStruct {
  PlansStruct({
    String? planName,
    int? amount,
    String? billingPeriod,
    List<FeaturesStruct>? features,
    String? planId,
  })  : _planName = planName,
        _amount = amount,
        _billingPeriod = billingPeriod,
        _features = features,
        _planId = planId;

  // "plan_name" field.
  String? _planName;
  String get planName => _planName ?? '';
  set planName(String? val) => _planName = val;

  bool hasPlanName() => _planName != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;

  void incrementAmount(int amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "billing_period" field.
  String? _billingPeriod;
  String get billingPeriod => _billingPeriod ?? '';
  set billingPeriod(String? val) => _billingPeriod = val;

  bool hasBillingPeriod() => _billingPeriod != null;

  // "features" field.
  List<FeaturesStruct>? _features;
  List<FeaturesStruct> get features => _features ?? const [];
  set features(List<FeaturesStruct>? val) => _features = val;

  void updateFeatures(Function(List<FeaturesStruct>) updateFn) {
    updateFn(_features ??= []);
  }

  bool hasFeatures() => _features != null;

  // "plan_id" field.
  String? _planId;
  String get planId => _planId ?? '';
  set planId(String? val) => _planId = val;

  bool hasPlanId() => _planId != null;

  static PlansStruct fromMap(Map<String, dynamic> data) => PlansStruct(
        planName: data['plan_name'] as String?,
        amount: castToType<int>(data['amount']),
        billingPeriod: data['billing_period'] as String?,
        features: getStructList(
          data['features'],
          FeaturesStruct.fromMap,
        ),
        planId: data['plan_id'] as String?,
      );

  static PlansStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlansStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'plan_name': _planName,
        'amount': _amount,
        'billing_period': _billingPeriod,
        'features': _features?.map((e) => e.toMap()).toList(),
        'plan_id': _planId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'plan_name': serializeParam(
          _planName,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'billing_period': serializeParam(
          _billingPeriod,
          ParamType.String,
        ),
        'features': serializeParam(
          _features,
          ParamType.DataStruct,
          isList: true,
        ),
        'plan_id': serializeParam(
          _planId,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlansStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlansStruct(
        planName: deserializeParam(
          data['plan_name'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        billingPeriod: deserializeParam(
          data['billing_period'],
          ParamType.String,
          false,
        ),
        features: deserializeStructParam<FeaturesStruct>(
          data['features'],
          ParamType.DataStruct,
          true,
          structBuilder: FeaturesStruct.fromSerializableMap,
        ),
        planId: deserializeParam(
          data['plan_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlansStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlansStruct &&
        planName == other.planName &&
        amount == other.amount &&
        billingPeriod == other.billingPeriod &&
        listEquality.equals(features, other.features) &&
        planId == other.planId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([planName, amount, billingPeriod, features, planId]);
}

PlansStruct createPlansStruct({
  String? planName,
  int? amount,
  String? billingPeriod,
  String? planId,
}) =>
    PlansStruct(
      planName: planName,
      amount: amount,
      billingPeriod: billingPeriod,
      planId: planId,
    );
