// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsStruct extends BaseStruct {
  SettingsStruct({
    CancellationReasonsStruct? cancellationReasons,
    String? id,
    String? createdAt,
    String? updatedAt,
    List<FaqStruct>? faq,
    SyncStruct? healthDevice,
  })  : _cancellationReasons = cancellationReasons,
        _id = id,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _faq = faq,
        _healthDevice = healthDevice;

  // "cancellationReasons" field.
  CancellationReasonsStruct? _cancellationReasons;
  CancellationReasonsStruct get cancellationReasons =>
      _cancellationReasons ?? CancellationReasonsStruct();
  set cancellationReasons(CancellationReasonsStruct? val) =>
      _cancellationReasons = val;

  void updateCancellationReasons(Function(CancellationReasonsStruct) updateFn) {
    updateFn(_cancellationReasons ??= CancellationReasonsStruct());
  }

  bool hasCancellationReasons() => _cancellationReasons != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

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

  // "faq" field.
  List<FaqStruct>? _faq;
  List<FaqStruct> get faq => _faq ?? const [];
  set faq(List<FaqStruct>? val) => _faq = val;

  void updateFaq(Function(List<FaqStruct>) updateFn) {
    updateFn(_faq ??= []);
  }

  bool hasFaq() => _faq != null;

  // "healthDevice" field.
  SyncStruct? _healthDevice;
  SyncStruct get healthDevice => _healthDevice ?? SyncStruct();
  set healthDevice(SyncStruct? val) => _healthDevice = val;

  void updateHealthDevice(Function(SyncStruct) updateFn) {
    updateFn(_healthDevice ??= SyncStruct());
  }

  bool hasHealthDevice() => _healthDevice != null;

  static SettingsStruct fromMap(Map<String, dynamic> data) => SettingsStruct(
        cancellationReasons:
            data['cancellationReasons'] is CancellationReasonsStruct
                ? data['cancellationReasons']
                : CancellationReasonsStruct.maybeFromMap(
                    data['cancellationReasons']),
        id: data['id'] as String?,
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
        faq: getStructList(
          data['faq'],
          FaqStruct.fromMap,
        ),
        healthDevice: data['healthDevice'] is SyncStruct
            ? data['healthDevice']
            : SyncStruct.maybeFromMap(data['healthDevice']),
      );

  static SettingsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SettingsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'cancellationReasons': _cancellationReasons?.toMap(),
        'id': _id,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'faq': _faq?.map((e) => e.toMap()).toList(),
        'healthDevice': _healthDevice?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cancellationReasons': serializeParam(
          _cancellationReasons,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
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
        'faq': serializeParam(
          _faq,
          ParamType.DataStruct,
          isList: true,
        ),
        'healthDevice': serializeParam(
          _healthDevice,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsStruct(
        cancellationReasons: deserializeStructParam(
          data['cancellationReasons'],
          ParamType.DataStruct,
          false,
          structBuilder: CancellationReasonsStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
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
        faq: deserializeStructParam<FaqStruct>(
          data['faq'],
          ParamType.DataStruct,
          true,
          structBuilder: FaqStruct.fromSerializableMap,
        ),
        healthDevice: deserializeStructParam(
          data['healthDevice'],
          ParamType.DataStruct,
          false,
          structBuilder: SyncStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SettingsStruct &&
        cancellationReasons == other.cancellationReasons &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        listEquality.equals(faq, other.faq) &&
        healthDevice == other.healthDevice;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([cancellationReasons, id, createdAt, updatedAt, faq, healthDevice]);
}

SettingsStruct createSettingsStruct({
  CancellationReasonsStruct? cancellationReasons,
  String? id,
  String? createdAt,
  String? updatedAt,
  SyncStruct? healthDevice,
}) =>
    SettingsStruct(
      cancellationReasons: cancellationReasons ?? CancellationReasonsStruct(),
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      healthDevice: healthDevice ?? SyncStruct(),
    );
