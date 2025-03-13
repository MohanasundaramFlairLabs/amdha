// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ValidateResultStruct extends BaseStruct {
  ValidateResultStruct({
    bool? isValid,
    String? errorMessage,
  })  : _isValid = isValid,
        _errorMessage = errorMessage;

  // "isValid" field.
  bool? _isValid;
  bool get isValid => _isValid ?? false;
  set isValid(bool? val) => _isValid = val;

  bool hasIsValid() => _isValid != null;

  // "errorMessage" field.
  String? _errorMessage;
  String get errorMessage => _errorMessage ?? '';
  set errorMessage(String? val) => _errorMessage = val;

  bool hasErrorMessage() => _errorMessage != null;

  static ValidateResultStruct fromMap(Map<String, dynamic> data) =>
      ValidateResultStruct(
        isValid: data['isValid'] as bool?,
        errorMessage: data['errorMessage'] as String?,
      );

  static ValidateResultStruct? maybeFromMap(dynamic data) => data is Map
      ? ValidateResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isValid': _isValid,
        'errorMessage': _errorMessage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isValid': serializeParam(
          _isValid,
          ParamType.bool,
        ),
        'errorMessage': serializeParam(
          _errorMessage,
          ParamType.String,
        ),
      }.withoutNulls;

  static ValidateResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      ValidateResultStruct(
        isValid: deserializeParam(
          data['isValid'],
          ParamType.bool,
          false,
        ),
        errorMessage: deserializeParam(
          data['errorMessage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ValidateResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ValidateResultStruct &&
        isValid == other.isValid &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode => const ListEquality().hash([isValid, errorMessage]);
}

ValidateResultStruct createValidateResultStruct({
  bool? isValid,
  String? errorMessage,
}) =>
    ValidateResultStruct(
      isValid: isValid,
      errorMessage: errorMessage,
    );
