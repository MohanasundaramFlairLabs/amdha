// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WellbeingStruct extends BaseStruct {
  WellbeingStruct({
    WellbeingScoreStruct? wellbeingScore,
  }) : _wellbeingScore = wellbeingScore;

  // "wellbeingScore" field.
  WellbeingScoreStruct? _wellbeingScore;
  WellbeingScoreStruct get wellbeingScore =>
      _wellbeingScore ?? WellbeingScoreStruct();
  set wellbeingScore(WellbeingScoreStruct? val) => _wellbeingScore = val;

  void updateWellbeingScore(Function(WellbeingScoreStruct) updateFn) {
    updateFn(_wellbeingScore ??= WellbeingScoreStruct());
  }

  bool hasWellbeingScore() => _wellbeingScore != null;

  static WellbeingStruct fromMap(Map<String, dynamic> data) => WellbeingStruct(
        wellbeingScore: data['wellbeingScore'] is WellbeingScoreStruct
            ? data['wellbeingScore']
            : WellbeingScoreStruct.maybeFromMap(data['wellbeingScore']),
      );

  static WellbeingStruct? maybeFromMap(dynamic data) => data is Map
      ? WellbeingStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'wellbeingScore': _wellbeingScore?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'wellbeingScore': serializeParam(
          _wellbeingScore,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static WellbeingStruct fromSerializableMap(Map<String, dynamic> data) =>
      WellbeingStruct(
        wellbeingScore: deserializeStructParam(
          data['wellbeingScore'],
          ParamType.DataStruct,
          false,
          structBuilder: WellbeingScoreStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WellbeingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WellbeingStruct && wellbeingScore == other.wellbeingScore;
  }

  @override
  int get hashCode => const ListEquality().hash([wellbeingScore]);
}

WellbeingStruct createWellbeingStruct({
  WellbeingScoreStruct? wellbeingScore,
}) =>
    WellbeingStruct(
      wellbeingScore: wellbeingScore ?? WellbeingScoreStruct(),
    );
