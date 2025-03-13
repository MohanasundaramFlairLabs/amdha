// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanDetailsStruct extends BaseStruct {
  PlanDetailsStruct({
    String? planName,
    String? duration,
  })  : _planName = planName,
        _duration = duration;

  // "planName" field.
  String? _planName;
  String get planName => _planName ?? '';
  set planName(String? val) => _planName = val;

  bool hasPlanName() => _planName != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  static PlanDetailsStruct fromMap(Map<String, dynamic> data) =>
      PlanDetailsStruct(
        planName: data['planName'] as String?,
        duration: data['duration'] as String?,
      );

  static PlanDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? PlanDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'planName': _planName,
        'duration': _duration,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'planName': serializeParam(
          _planName,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlanDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlanDetailsStruct(
        planName: deserializeParam(
          data['planName'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlanDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlanDetailsStruct &&
        planName == other.planName &&
        duration == other.duration;
  }

  @override
  int get hashCode => const ListEquality().hash([planName, duration]);
}

PlanDetailsStruct createPlanDetailsStruct({
  String? planName,
  String? duration,
}) =>
    PlanDetailsStruct(
      planName: planName,
      duration: duration,
    );
