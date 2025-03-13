// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedSymptomStruct extends BaseStruct {
  SelectedSymptomStruct({
    String? duration,
    String? severity,
    String? name,
    String? onSetDate,
  })  : _duration = duration,
        _severity = severity,
        _name = name,
        _onSetDate = onSetDate;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  // "severity" field.
  String? _severity;
  String get severity => _severity ?? '';
  set severity(String? val) => _severity = val;

  bool hasSeverity() => _severity != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "onSetDate" field.
  String? _onSetDate;
  String get onSetDate => _onSetDate ?? '';
  set onSetDate(String? val) => _onSetDate = val;

  bool hasOnSetDate() => _onSetDate != null;

  static SelectedSymptomStruct fromMap(Map<String, dynamic> data) =>
      SelectedSymptomStruct(
        duration: data['duration'] as String?,
        severity: data['severity'] as String?,
        name: data['name'] as String?,
        onSetDate: data['onSetDate'] as String?,
      );

  static SelectedSymptomStruct? maybeFromMap(dynamic data) => data is Map
      ? SelectedSymptomStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'duration': _duration,
        'severity': _severity,
        'name': _name,
        'onSetDate': _onSetDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
        'severity': serializeParam(
          _severity,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'onSetDate': serializeParam(
          _onSetDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static SelectedSymptomStruct fromSerializableMap(Map<String, dynamic> data) =>
      SelectedSymptomStruct(
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
        severity: deserializeParam(
          data['severity'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        onSetDate: deserializeParam(
          data['onSetDate'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SelectedSymptomStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelectedSymptomStruct &&
        duration == other.duration &&
        severity == other.severity &&
        name == other.name &&
        onSetDate == other.onSetDate;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([duration, severity, name, onSetDate]);
}

SelectedSymptomStruct createSelectedSymptomStruct({
  String? duration,
  String? severity,
  String? name,
  String? onSetDate,
}) =>
    SelectedSymptomStruct(
      duration: duration,
      severity: severity,
      name: name,
      onSetDate: onSetDate,
    );
