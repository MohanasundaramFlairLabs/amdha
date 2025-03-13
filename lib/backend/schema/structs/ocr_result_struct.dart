// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OcrResultStruct extends BaseStruct {
  OcrResultStruct({
    String? ocrStatus,
    List<ScanResultStruct>? ocrScanResult,
    String? ocrJobId,
    bool? enabled,
  })  : _ocrStatus = ocrStatus,
        _ocrScanResult = ocrScanResult,
        _ocrJobId = ocrJobId,
        _enabled = enabled;

  // "ocrStatus" field.
  String? _ocrStatus;
  String get ocrStatus => _ocrStatus ?? '';
  set ocrStatus(String? val) => _ocrStatus = val;

  bool hasOcrStatus() => _ocrStatus != null;

  // "ocrScanResult" field.
  List<ScanResultStruct>? _ocrScanResult;
  List<ScanResultStruct> get ocrScanResult => _ocrScanResult ?? const [];
  set ocrScanResult(List<ScanResultStruct>? val) => _ocrScanResult = val;

  void updateOcrScanResult(Function(List<ScanResultStruct>) updateFn) {
    updateFn(_ocrScanResult ??= []);
  }

  bool hasOcrScanResult() => _ocrScanResult != null;

  // "ocrJobId" field.
  String? _ocrJobId;
  String get ocrJobId => _ocrJobId ?? '';
  set ocrJobId(String? val) => _ocrJobId = val;

  bool hasOcrJobId() => _ocrJobId != null;

  // "enabled" field.
  bool? _enabled;
  bool get enabled => _enabled ?? false;
  set enabled(bool? val) => _enabled = val;

  bool hasEnabled() => _enabled != null;

  static OcrResultStruct fromMap(Map<String, dynamic> data) => OcrResultStruct(
        ocrStatus: data['ocrStatus'] as String?,
        ocrScanResult: getStructList(
          data['ocrScanResult'],
          ScanResultStruct.fromMap,
        ),
        ocrJobId: data['ocrJobId'] as String?,
        enabled: data['enabled'] as bool?,
      );

  static OcrResultStruct? maybeFromMap(dynamic data) => data is Map
      ? OcrResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ocrStatus': _ocrStatus,
        'ocrScanResult': _ocrScanResult?.map((e) => e.toMap()).toList(),
        'ocrJobId': _ocrJobId,
        'enabled': _enabled,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ocrStatus': serializeParam(
          _ocrStatus,
          ParamType.String,
        ),
        'ocrScanResult': serializeParam(
          _ocrScanResult,
          ParamType.DataStruct,
          isList: true,
        ),
        'ocrJobId': serializeParam(
          _ocrJobId,
          ParamType.String,
        ),
        'enabled': serializeParam(
          _enabled,
          ParamType.bool,
        ),
      }.withoutNulls;

  static OcrResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      OcrResultStruct(
        ocrStatus: deserializeParam(
          data['ocrStatus'],
          ParamType.String,
          false,
        ),
        ocrScanResult: deserializeStructParam<ScanResultStruct>(
          data['ocrScanResult'],
          ParamType.DataStruct,
          true,
          structBuilder: ScanResultStruct.fromSerializableMap,
        ),
        ocrJobId: deserializeParam(
          data['ocrJobId'],
          ParamType.String,
          false,
        ),
        enabled: deserializeParam(
          data['enabled'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'OcrResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OcrResultStruct &&
        ocrStatus == other.ocrStatus &&
        listEquality.equals(ocrScanResult, other.ocrScanResult) &&
        ocrJobId == other.ocrJobId &&
        enabled == other.enabled;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([ocrStatus, ocrScanResult, ocrJobId, enabled]);
}

OcrResultStruct createOcrResultStruct({
  String? ocrStatus,
  String? ocrJobId,
  bool? enabled,
}) =>
    OcrResultStruct(
      ocrStatus: ocrStatus,
      ocrJobId: ocrJobId,
      enabled: enabled,
    );
