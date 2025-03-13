// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CaseSheetModelStruct extends BaseStruct {
  CaseSheetModelStruct({
    List<YourVisitsStruct>? yourVisits,
    List<OtherVisitsStruct>? otherVisits,
  })  : _yourVisits = yourVisits,
        _otherVisits = otherVisits;

  // "yourVisits" field.
  List<YourVisitsStruct>? _yourVisits;
  List<YourVisitsStruct> get yourVisits => _yourVisits ?? const [];
  set yourVisits(List<YourVisitsStruct>? val) => _yourVisits = val;

  void updateYourVisits(Function(List<YourVisitsStruct>) updateFn) {
    updateFn(_yourVisits ??= []);
  }

  bool hasYourVisits() => _yourVisits != null;

  // "otherVisits" field.
  List<OtherVisitsStruct>? _otherVisits;
  List<OtherVisitsStruct> get otherVisits => _otherVisits ?? const [];
  set otherVisits(List<OtherVisitsStruct>? val) => _otherVisits = val;

  void updateOtherVisits(Function(List<OtherVisitsStruct>) updateFn) {
    updateFn(_otherVisits ??= []);
  }

  bool hasOtherVisits() => _otherVisits != null;

  static CaseSheetModelStruct fromMap(Map<String, dynamic> data) =>
      CaseSheetModelStruct(
        yourVisits: getStructList(
          data['yourVisits'],
          YourVisitsStruct.fromMap,
        ),
        otherVisits: getStructList(
          data['otherVisits'],
          OtherVisitsStruct.fromMap,
        ),
      );

  static CaseSheetModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CaseSheetModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'yourVisits': _yourVisits?.map((e) => e.toMap()).toList(),
        'otherVisits': _otherVisits?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'yourVisits': serializeParam(
          _yourVisits,
          ParamType.DataStruct,
          isList: true,
        ),
        'otherVisits': serializeParam(
          _otherVisits,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CaseSheetModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CaseSheetModelStruct(
        yourVisits: deserializeStructParam<YourVisitsStruct>(
          data['yourVisits'],
          ParamType.DataStruct,
          true,
          structBuilder: YourVisitsStruct.fromSerializableMap,
        ),
        otherVisits: deserializeStructParam<OtherVisitsStruct>(
          data['otherVisits'],
          ParamType.DataStruct,
          true,
          structBuilder: OtherVisitsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CaseSheetModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CaseSheetModelStruct &&
        listEquality.equals(yourVisits, other.yourVisits) &&
        listEquality.equals(otherVisits, other.otherVisits);
  }

  @override
  int get hashCode => const ListEquality().hash([yourVisits, otherVisits]);
}

CaseSheetModelStruct createCaseSheetModelStruct() => CaseSheetModelStruct();
