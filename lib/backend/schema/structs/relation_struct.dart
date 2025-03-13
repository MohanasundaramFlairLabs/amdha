// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RelationStruct extends BaseStruct {
  RelationStruct({
    String? name,
    String? relation,
    String? phoneNumber,
  })  : _name = name,
        _relation = relation,
        _phoneNumber = phoneNumber;

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

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  static RelationStruct fromMap(Map<String, dynamic> data) => RelationStruct(
        name: data['name'] as String?,
        relation: data['relation'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
      );

  static RelationStruct? maybeFromMap(dynamic data) =>
      data is Map ? RelationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'relation': _relation,
        'phoneNumber': _phoneNumber,
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
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static RelationStruct fromSerializableMap(Map<String, dynamic> data) =>
      RelationStruct(
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
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RelationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RelationStruct &&
        name == other.name &&
        relation == other.relation &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([name, relation, phoneNumber]);
}

RelationStruct createRelationStruct({
  String? name,
  String? relation,
  String? phoneNumber,
}) =>
    RelationStruct(
      name: name,
      relation: relation,
      phoneNumber: phoneNumber,
    );
