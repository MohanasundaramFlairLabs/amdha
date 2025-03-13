// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionStruct extends BaseStruct {
  SubscriptionStruct({
    String? id,
    String? userId,
    String? planId,
    String? startDate,
    String? endDate,
    String? status,
    String? createdAt,
  })  : _id = id,
        _userId = userId,
        _planId = planId,
        _startDate = startDate,
        _endDate = endDate,
        _status = status,
        _createdAt = createdAt;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

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

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static SubscriptionStruct fromMap(Map<String, dynamic> data) =>
      SubscriptionStruct(
        id: data['id'] as String?,
        userId: data['user_id'] as String?,
        planId: data['plan_id'] as String?,
        startDate: data['start_date'] as String?,
        endDate: data['end_date'] as String?,
        status: data['status'] as String?,
        createdAt: data['created_at'] as String?,
      );

  static SubscriptionStruct? maybeFromMap(dynamic data) => data is Map
      ? SubscriptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user_id': _userId,
        'plan_id': _planId,
        'start_date': _startDate,
        'end_date': _endDate,
        'status': _status,
        'created_at': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
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
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static SubscriptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubscriptionStruct(
        id: deserializeParam(
          data['id'],
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
          data['created_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SubscriptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubscriptionStruct &&
        id == other.id &&
        userId == other.userId &&
        planId == other.planId &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        status == other.status &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, userId, planId, startDate, endDate, status, createdAt]);
}

SubscriptionStruct createSubscriptionStruct({
  String? id,
  String? userId,
  String? planId,
  String? startDate,
  String? endDate,
  String? status,
  String? createdAt,
}) =>
    SubscriptionStruct(
      id: id,
      userId: userId,
      planId: planId,
      startDate: startDate,
      endDate: endDate,
      status: status,
      createdAt: createdAt,
    );
