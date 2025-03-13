// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealItemStruct extends BaseStruct {
  MealItemStruct({
    String? foodItem,
    String? portionSize,
    String? portion,
  })  : _foodItem = foodItem,
        _portionSize = portionSize,
        _portion = portion;

  // "foodItem" field.
  String? _foodItem;
  String get foodItem => _foodItem ?? '';
  set foodItem(String? val) => _foodItem = val;

  bool hasFoodItem() => _foodItem != null;

  // "portionSize" field.
  String? _portionSize;
  String get portionSize => _portionSize ?? '';
  set portionSize(String? val) => _portionSize = val;

  bool hasPortionSize() => _portionSize != null;

  // "portion" field.
  String? _portion;
  String get portion => _portion ?? '';
  set portion(String? val) => _portion = val;

  bool hasPortion() => _portion != null;

  static MealItemStruct fromMap(Map<String, dynamic> data) => MealItemStruct(
        foodItem: data['foodItem'] as String?,
        portionSize: data['portionSize'] as String?,
        portion: data['portion'] as String?,
      );

  static MealItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? MealItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'foodItem': _foodItem,
        'portionSize': _portionSize,
        'portion': _portion,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'foodItem': serializeParam(
          _foodItem,
          ParamType.String,
        ),
        'portionSize': serializeParam(
          _portionSize,
          ParamType.String,
        ),
        'portion': serializeParam(
          _portion,
          ParamType.String,
        ),
      }.withoutNulls;

  static MealItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      MealItemStruct(
        foodItem: deserializeParam(
          data['foodItem'],
          ParamType.String,
          false,
        ),
        portionSize: deserializeParam(
          data['portionSize'],
          ParamType.String,
          false,
        ),
        portion: deserializeParam(
          data['portion'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MealItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MealItemStruct &&
        foodItem == other.foodItem &&
        portionSize == other.portionSize &&
        portion == other.portion;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([foodItem, portionSize, portion]);
}

MealItemStruct createMealItemStruct({
  String? foodItem,
  String? portionSize,
  String? portion,
}) =>
    MealItemStruct(
      foodItem: foodItem,
      portionSize: portionSize,
      portion: portion,
    );
