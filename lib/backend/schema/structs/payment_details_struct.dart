// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentDetailsStruct extends BaseStruct {
  PaymentDetailsStruct({
    int? amount,
    int? amountDue,
    int? amountPaid,
    int? attempts,
    int? createdAt,
    String? currency,
    String? entity,
    List<String>? notes,
    String? offerId,
    String? receipt,
    String? status,
    String? id,
  })  : _amount = amount,
        _amountDue = amountDue,
        _amountPaid = amountPaid,
        _attempts = attempts,
        _createdAt = createdAt,
        _currency = currency,
        _entity = entity,
        _notes = notes,
        _offerId = offerId,
        _receipt = receipt,
        _status = status,
        _id = id;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;

  void incrementAmount(int amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "amount_due" field.
  int? _amountDue;
  int get amountDue => _amountDue ?? 0;
  set amountDue(int? val) => _amountDue = val;

  void incrementAmountDue(int amount) => amountDue = amountDue + amount;

  bool hasAmountDue() => _amountDue != null;

  // "amount_paid" field.
  int? _amountPaid;
  int get amountPaid => _amountPaid ?? 0;
  set amountPaid(int? val) => _amountPaid = val;

  void incrementAmountPaid(int amount) => amountPaid = amountPaid + amount;

  bool hasAmountPaid() => _amountPaid != null;

  // "attempts" field.
  int? _attempts;
  int get attempts => _attempts ?? 0;
  set attempts(int? val) => _attempts = val;

  void incrementAttempts(int amount) => attempts = attempts + amount;

  bool hasAttempts() => _attempts != null;

  // "created_at" field.
  int? _createdAt;
  int get createdAt => _createdAt ?? 0;
  set createdAt(int? val) => _createdAt = val;

  void incrementCreatedAt(int amount) => createdAt = createdAt + amount;

  bool hasCreatedAt() => _createdAt != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  // "entity" field.
  String? _entity;
  String get entity => _entity ?? '';
  set entity(String? val) => _entity = val;

  bool hasEntity() => _entity != null;

  // "notes" field.
  List<String>? _notes;
  List<String> get notes => _notes ?? const [];
  set notes(List<String>? val) => _notes = val;

  void updateNotes(Function(List<String>) updateFn) {
    updateFn(_notes ??= []);
  }

  bool hasNotes() => _notes != null;

  // "offer_id" field.
  String? _offerId;
  String get offerId => _offerId ?? '';
  set offerId(String? val) => _offerId = val;

  bool hasOfferId() => _offerId != null;

  // "receipt" field.
  String? _receipt;
  String get receipt => _receipt ?? '';
  set receipt(String? val) => _receipt = val;

  bool hasReceipt() => _receipt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static PaymentDetailsStruct fromMap(Map<String, dynamic> data) =>
      PaymentDetailsStruct(
        amount: castToType<int>(data['amount']),
        amountDue: castToType<int>(data['amount_due']),
        amountPaid: castToType<int>(data['amount_paid']),
        attempts: castToType<int>(data['attempts']),
        createdAt: castToType<int>(data['created_at']),
        currency: data['currency'] as String?,
        entity: data['entity'] as String?,
        notes: getDataList(data['notes']),
        offerId: data['offer_id'] as String?,
        receipt: data['receipt'] as String?,
        status: data['status'] as String?,
        id: data['id'] as String?,
      );

  static PaymentDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'amount': _amount,
        'amount_due': _amountDue,
        'amount_paid': _amountPaid,
        'attempts': _attempts,
        'created_at': _createdAt,
        'currency': _currency,
        'entity': _entity,
        'notes': _notes,
        'offer_id': _offerId,
        'receipt': _receipt,
        'status': _status,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'amount_due': serializeParam(
          _amountDue,
          ParamType.int,
        ),
        'amount_paid': serializeParam(
          _amountPaid,
          ParamType.int,
        ),
        'attempts': serializeParam(
          _attempts,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.int,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'entity': serializeParam(
          _entity,
          ParamType.String,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
          isList: true,
        ),
        'offer_id': serializeParam(
          _offerId,
          ParamType.String,
        ),
        'receipt': serializeParam(
          _receipt,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentDetailsStruct(
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        amountDue: deserializeParam(
          data['amount_due'],
          ParamType.int,
          false,
        ),
        amountPaid: deserializeParam(
          data['amount_paid'],
          ParamType.int,
          false,
        ),
        attempts: deserializeParam(
          data['attempts'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.int,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        entity: deserializeParam(
          data['entity'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam<String>(
          data['notes'],
          ParamType.String,
          true,
        ),
        offerId: deserializeParam(
          data['offer_id'],
          ParamType.String,
          false,
        ),
        receipt: deserializeParam(
          data['receipt'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PaymentDetailsStruct &&
        amount == other.amount &&
        amountDue == other.amountDue &&
        amountPaid == other.amountPaid &&
        attempts == other.attempts &&
        createdAt == other.createdAt &&
        currency == other.currency &&
        entity == other.entity &&
        listEquality.equals(notes, other.notes) &&
        offerId == other.offerId &&
        receipt == other.receipt &&
        status == other.status &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([
        amount,
        amountDue,
        amountPaid,
        attempts,
        createdAt,
        currency,
        entity,
        notes,
        offerId,
        receipt,
        status,
        id
      ]);
}

PaymentDetailsStruct createPaymentDetailsStruct({
  int? amount,
  int? amountDue,
  int? amountPaid,
  int? attempts,
  int? createdAt,
  String? currency,
  String? entity,
  String? offerId,
  String? receipt,
  String? status,
  String? id,
}) =>
    PaymentDetailsStruct(
      amount: amount,
      amountDue: amountDue,
      amountPaid: amountPaid,
      attempts: attempts,
      createdAt: createdAt,
      currency: currency,
      entity: entity,
      offerId: offerId,
      receipt: receipt,
      status: status,
      id: id,
    );
