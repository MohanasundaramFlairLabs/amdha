// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStageDetailsStruct extends BaseStruct {
  UserStageDetailsStruct({
    int? week,
    String? fetusStatus,
    List<String>? fetusGrowth,
    List<String>? youMayFeel,
    List<String>? prerequiste,
    String? edd,
    String? trimester,
  })  : _week = week,
        _fetusStatus = fetusStatus,
        _fetusGrowth = fetusGrowth,
        _youMayFeel = youMayFeel,
        _prerequiste = prerequiste,
        _edd = edd,
        _trimester = trimester;

  // "week" field.
  int? _week;
  int get week => _week ?? 0;
  set week(int? val) => _week = val;

  void incrementWeek(int amount) => week = week + amount;

  bool hasWeek() => _week != null;

  // "fetusStatus" field.
  String? _fetusStatus;
  String get fetusStatus => _fetusStatus ?? '';
  set fetusStatus(String? val) => _fetusStatus = val;

  bool hasFetusStatus() => _fetusStatus != null;

  // "fetusGrowth" field.
  List<String>? _fetusGrowth;
  List<String> get fetusGrowth => _fetusGrowth ?? const [];
  set fetusGrowth(List<String>? val) => _fetusGrowth = val;

  void updateFetusGrowth(Function(List<String>) updateFn) {
    updateFn(_fetusGrowth ??= []);
  }

  bool hasFetusGrowth() => _fetusGrowth != null;

  // "youMayFeel" field.
  List<String>? _youMayFeel;
  List<String> get youMayFeel => _youMayFeel ?? const [];
  set youMayFeel(List<String>? val) => _youMayFeel = val;

  void updateYouMayFeel(Function(List<String>) updateFn) {
    updateFn(_youMayFeel ??= []);
  }

  bool hasYouMayFeel() => _youMayFeel != null;

  // "prerequiste" field.
  List<String>? _prerequiste;
  List<String> get prerequiste => _prerequiste ?? const [];
  set prerequiste(List<String>? val) => _prerequiste = val;

  void updatePrerequiste(Function(List<String>) updateFn) {
    updateFn(_prerequiste ??= []);
  }

  bool hasPrerequiste() => _prerequiste != null;

  // "edd" field.
  String? _edd;
  String get edd => _edd ?? '';
  set edd(String? val) => _edd = val;

  bool hasEdd() => _edd != null;

  // "trimester" field.
  String? _trimester;
  String get trimester => _trimester ?? '';
  set trimester(String? val) => _trimester = val;

  bool hasTrimester() => _trimester != null;

  static UserStageDetailsStruct fromMap(Map<String, dynamic> data) =>
      UserStageDetailsStruct(
        week: castToType<int>(data['week']),
        fetusStatus: data['fetusStatus'] as String?,
        fetusGrowth: getDataList(data['fetusGrowth']),
        youMayFeel: getDataList(data['youMayFeel']),
        prerequiste: getDataList(data['prerequiste']),
        edd: data['edd'] as String?,
        trimester: data['trimester'] as String?,
      );

  static UserStageDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserStageDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'week': _week,
        'fetusStatus': _fetusStatus,
        'fetusGrowth': _fetusGrowth,
        'youMayFeel': _youMayFeel,
        'prerequiste': _prerequiste,
        'edd': _edd,
        'trimester': _trimester,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'week': serializeParam(
          _week,
          ParamType.int,
        ),
        'fetusStatus': serializeParam(
          _fetusStatus,
          ParamType.String,
        ),
        'fetusGrowth': serializeParam(
          _fetusGrowth,
          ParamType.String,
          isList: true,
        ),
        'youMayFeel': serializeParam(
          _youMayFeel,
          ParamType.String,
          isList: true,
        ),
        'prerequiste': serializeParam(
          _prerequiste,
          ParamType.String,
          isList: true,
        ),
        'edd': serializeParam(
          _edd,
          ParamType.String,
        ),
        'trimester': serializeParam(
          _trimester,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStageDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserStageDetailsStruct(
        week: deserializeParam(
          data['week'],
          ParamType.int,
          false,
        ),
        fetusStatus: deserializeParam(
          data['fetusStatus'],
          ParamType.String,
          false,
        ),
        fetusGrowth: deserializeParam<String>(
          data['fetusGrowth'],
          ParamType.String,
          true,
        ),
        youMayFeel: deserializeParam<String>(
          data['youMayFeel'],
          ParamType.String,
          true,
        ),
        prerequiste: deserializeParam<String>(
          data['prerequiste'],
          ParamType.String,
          true,
        ),
        edd: deserializeParam(
          data['edd'],
          ParamType.String,
          false,
        ),
        trimester: deserializeParam(
          data['trimester'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStageDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStageDetailsStruct &&
        week == other.week &&
        fetusStatus == other.fetusStatus &&
        listEquality.equals(fetusGrowth, other.fetusGrowth) &&
        listEquality.equals(youMayFeel, other.youMayFeel) &&
        listEquality.equals(prerequiste, other.prerequiste) &&
        edd == other.edd &&
        trimester == other.trimester;
  }

  @override
  int get hashCode => const ListEquality().hash([
        week,
        fetusStatus,
        fetusGrowth,
        youMayFeel,
        prerequiste,
        edd,
        trimester
      ]);
}

UserStageDetailsStruct createUserStageDetailsStruct({
  int? week,
  String? fetusStatus,
  String? edd,
  String? trimester,
}) =>
    UserStageDetailsStruct(
      week: week,
      fetusStatus: fetusStatus,
      edd: edd,
      trimester: trimester,
    );
