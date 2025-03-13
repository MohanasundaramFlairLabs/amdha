// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuotaModelStruct extends BaseStruct {
  QuotaModelStruct({
    QuotasStruct? quotas,
  }) : _quotas = quotas;

  // "quotas" field.
  QuotasStruct? _quotas;
  QuotasStruct get quotas => _quotas ?? QuotasStruct();
  set quotas(QuotasStruct? val) => _quotas = val;

  void updateQuotas(Function(QuotasStruct) updateFn) {
    updateFn(_quotas ??= QuotasStruct());
  }

  bool hasQuotas() => _quotas != null;

  static QuotaModelStruct fromMap(Map<String, dynamic> data) =>
      QuotaModelStruct(
        quotas: data['quotas'] is QuotasStruct
            ? data['quotas']
            : QuotasStruct.maybeFromMap(data['quotas']),
      );

  static QuotaModelStruct? maybeFromMap(dynamic data) => data is Map
      ? QuotaModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'quotas': _quotas?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quotas': serializeParam(
          _quotas,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static QuotaModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuotaModelStruct(
        quotas: deserializeStructParam(
          data['quotas'],
          ParamType.DataStruct,
          false,
          structBuilder: QuotasStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'QuotaModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuotaModelStruct && quotas == other.quotas;
  }

  @override
  int get hashCode => const ListEquality().hash([quotas]);
}

QuotaModelStruct createQuotaModelStruct({
  QuotasStruct? quotas,
}) =>
    QuotaModelStruct(
      quotas: quotas ?? QuotasStruct(),
    );
