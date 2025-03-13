// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealStruct extends BaseStruct {
  MealStruct({
    String? mealType,
    String? mealTime,
    List<MealItemStruct>? items,
  })  : _mealType = mealType,
        _mealTime = mealTime,
        _items = items;

  // "mealType" field.
  String? _mealType;
  String get mealType => _mealType ?? '';
  set mealType(String? val) => _mealType = val;

  bool hasMealType() => _mealType != null;

  // "mealTime" field.
  String? _mealTime;
  String get mealTime => _mealTime ?? '';
  set mealTime(String? val) => _mealTime = val;

  bool hasMealTime() => _mealTime != null;

  // "items" field.
  List<MealItemStruct>? _items;
  List<MealItemStruct> get items => _items ?? const [];
  set items(List<MealItemStruct>? val) => _items = val;

  void updateItems(Function(List<MealItemStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  static MealStruct fromMap(Map<String, dynamic> data) => MealStruct(
        mealType: data['mealType'] as String?,
        mealTime: data['mealTime'] as String?,
        items: getStructList(
          data['items'],
          MealItemStruct.fromMap,
        ),
      );

  static MealStruct? maybeFromMap(dynamic data) =>
      data is Map ? MealStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'mealType': _mealType,
        'mealTime': _mealTime,
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mealType': serializeParam(
          _mealType,
          ParamType.String,
        ),
        'mealTime': serializeParam(
          _mealTime,
          ParamType.String,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MealStruct fromSerializableMap(Map<String, dynamic> data) =>
      MealStruct(
        mealType: deserializeParam(
          data['mealType'],
          ParamType.String,
          false,
        ),
        mealTime: deserializeParam(
          data['mealTime'],
          ParamType.String,
          false,
        ),
        items: deserializeStructParam<MealItemStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: MealItemStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MealStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MealStruct &&
        mealType == other.mealType &&
        mealTime == other.mealTime &&
        listEquality.equals(items, other.items);
  }

  @override
  int get hashCode => const ListEquality().hash([mealType, mealTime, items]);
}

MealStruct createMealStruct({
  String? mealType,
  String? mealTime,
}) =>
    MealStruct(
      mealType: mealType,
      mealTime: mealTime,
    );
