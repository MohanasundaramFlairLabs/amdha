// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsStruct extends BaseStruct {
  SubscriptionsStruct({
    String? id,
    String? tenantId,
    String? userId,
    String? planId,
    String? startDate,
    String? endDate,
    String? status,
    String? createdAt,
    String? updatedAt,
    List<QuotaStruct>? quota,
    PlanDetailsStruct? planDetails,
  })  : _id = id,
        _tenantId = tenantId,
        _userId = userId,
        _planId = planId,
        _startDate = startDate,
        _endDate = endDate,
        _status = status,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _quota = quota,
        _planDetails = planDetails;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "tenant_id" field.
  String? _tenantId;
  String get tenantId => _tenantId ?? '';
  set tenantId(String? val) => _tenantId = val;

  bool hasTenantId() => _tenantId != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "plan_id" field.
  String? _planId;
  String get planId => _planId ?? '';
  set planId(String? val) => _planId = val;

  bool hasPlanId() => _planId != null;

  // "start_date" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  set endDate(String? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "quota" field.
  List<QuotaStruct>? _quota;
  List<QuotaStruct> get quota => _quota ?? const [];
  set quota(List<QuotaStruct>? val) => _quota = val;

  void updateQuota(Function(List<QuotaStruct>) updateFn) {
    updateFn(_quota ??= []);
  }

  bool hasQuota() => _quota != null;

  // "planDetails" field.
  PlanDetailsStruct? _planDetails;
  PlanDetailsStruct get planDetails => _planDetails ?? PlanDetailsStruct();
  set planDetails(PlanDetailsStruct? val) => _planDetails = val;

  void updatePlanDetails(Function(PlanDetailsStruct) updateFn) {
    updateFn(_planDetails ??= PlanDetailsStruct());
  }

  bool hasPlanDetails() => _planDetails != null;

  static SubscriptionsStruct fromMap(Map<String, dynamic> data) =>
      SubscriptionsStruct(
        id: data['id'] as String?,
        tenantId: data['tenant_id'] as String?,
        userId: data['user_id'] as String?,
        planId: data['plan_id'] as String?,
        startDate: data['start_date'] as String?,
        endDate: data['end_date'] as String?,
        status: data['status'] as String?,
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
        quota: getStructList(
          data['quota'],
          QuotaStruct.fromMap,
        ),
        planDetails: data['planDetails'] is PlanDetailsStruct
            ? data['planDetails']
            : PlanDetailsStruct.maybeFromMap(data['planDetails']),
      );

  static SubscriptionsStruct? maybeFromMap(dynamic data) => data is Map
      ? SubscriptionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'tenant_id': _tenantId,
        'user_id': _userId,
        'plan_id': _planId,
        'start_date': _startDate,
        'end_date': _endDate,
        'status': _status,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'quota': _quota?.map((e) => e.toMap()).toList(),
        'planDetails': _planDetails?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'tenant_id': serializeParam(
          _tenantId,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'plan_id': serializeParam(
          _planId,
          ParamType.String,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'end_date': serializeParam(
          _endDate,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'quota': serializeParam(
          _quota,
          ParamType.DataStruct,
          isList: true,
        ),
        'planDetails': serializeParam(
          _planDetails,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SubscriptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubscriptionsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        tenantId: deserializeParam(
          data['tenant_id'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        planId: deserializeParam(
          data['plan_id'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.String,
          false,
        ),
        endDate: deserializeParam(
          data['end_date'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.String,
          false,
        ),
        quota: deserializeStructParam<QuotaStruct>(
          data['quota'],
          ParamType.DataStruct,
          true,
          structBuilder: QuotaStruct.fromSerializableMap,
        ),
        planDetails: deserializeStructParam(
          data['planDetails'],
          ParamType.DataStruct,
          false,
          structBuilder: PlanDetailsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SubscriptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SubscriptionsStruct &&
        id == other.id &&
        tenantId == other.tenantId &&
        userId == other.userId &&
        planId == other.planId &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        status == other.status &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        listEquality.equals(quota, other.quota) &&
        planDetails == other.planDetails;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        tenantId,
        userId,
        planId,
        startDate,
        endDate,
        status,
        createdAt,
        updatedAt,
        quota,
        planDetails
      ]);
}

SubscriptionsStruct createSubscriptionsStruct({
  String? id,
  String? tenantId,
  String? userId,
  String? planId,
  String? startDate,
  String? endDate,
  String? status,
  String? createdAt,
  String? updatedAt,
  PlanDetailsStruct? planDetails,
}) =>
    SubscriptionsStruct(
      id: id,
      tenantId: tenantId,
      userId: userId,
      planId: planId,
      startDate: startDate,
      endDate: endDate,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      planDetails: planDetails ?? PlanDetailsStruct(),
    );
