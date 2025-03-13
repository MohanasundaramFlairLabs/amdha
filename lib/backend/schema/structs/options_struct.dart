// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionsStruct extends BaseStruct {
  OptionsStruct({
    String? text,
    String? option,
    bool? allowOther,
  })  : _text = text,
        _option = option,
        _allowOther = allowOther;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "option" field.
  String? _option;
  String get option => _option ?? '';
  set option(String? val) => _option = val;

  bool hasOption() => _option != null;

  // "allowOther" field.
  bool? _allowOther;
  bool get allowOther => _allowOther ?? false;
  set allowOther(bool? val) => _allowOther = val;

  bool hasAllowOther() => _allowOther != null;

  static OptionsStruct fromMap(Map<String, dynamic> data) => OptionsStruct(
        text: data['text'] as String?,
        option: data['option'] as String?,
        allowOther: data['allowOther'] as bool?,
      );

  static OptionsStruct? maybeFromMap(dynamic data) =>
      data is Map ? OptionsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'option': _option,
        'allowOther': _allowOther,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'option': serializeParam(
          _option,
          ParamType.String,
        ),
        'allowOther': serializeParam(
          _allowOther,
          ParamType.bool,
        ),
      }.withoutNulls;

  static OptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OptionsStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        option: deserializeParam(
          data['option'],
          ParamType.String,
          false,
        ),
        allowOther: deserializeParam(
          data['allowOther'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'OptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OptionsStruct &&
        text == other.text &&
        option == other.option &&
        allowOther == other.allowOther;
  }

  @override
  int get hashCode => const ListEquality().hash([text, option, allowOther]);
}

OptionsStruct createOptionsStruct({
  String? text,
  String? option,
  bool? allowOther,
}) =>
    OptionsStruct(
      text: text,
      option: option,
      allowOther: allowOther,
    );
