// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmergencyContactStruct extends BaseStruct {
  EmergencyContactStruct({
    String? name,
    String? relation,
    String? phone,
  })  : _name = name,
        _relation = relation,
        _phone = phone;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "relation" field.
  String? _relation;
  String get relation => _relation ?? '';
  set relation(String? val) => _relation = val;

  bool hasRelation() => _relation != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  static EmergencyContactStruct fromMap(Map<String, dynamic> data) =>
      EmergencyContactStruct(
        name: data['name'] as String?,
        relation: data['relation'] as String?,
        phone: data['phone'] as String?,
      );

  static EmergencyContactStruct? maybeFromMap(dynamic data) => data is Map
      ? EmergencyContactStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'relation': _relation,
        'phone': _phone,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'relation': serializeParam(
          _relation,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
      }.withoutNulls;

  static EmergencyContactStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EmergencyContactStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        relation: deserializeParam(
          data['relation'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EmergencyContactStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmergencyContactStruct &&
        name == other.name &&
        relation == other.relation &&
        phone == other.phone;
  }

  @override
  int get hashCode => const ListEquality().hash([name, relation, phone]);
}

EmergencyContactStruct createEmergencyContactStruct({
  String? name,
  String? relation,
  String? phone,
}) =>
    EmergencyContactStruct(
      name: name,
      relation: relation,
      phone: phone,
    );
