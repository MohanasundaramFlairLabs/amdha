// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodTrackerStruct extends BaseStruct {
  FoodTrackerStruct({
    List<MealStruct>? meals,
  }) : _meals = meals;

  // "meals" field.
  List<MealStruct>? _meals;
  List<MealStruct> get meals => _meals ?? const [];
  set meals(List<MealStruct>? val) => _meals = val;

  void updateMeals(Function(List<MealStruct>) updateFn) {
    updateFn(_meals ??= []);
  }

  bool hasMeals() => _meals != null;

  static FoodTrackerStruct fromMap(Map<String, dynamic> data) =>
      FoodTrackerStruct(
        meals: getStructList(
          data['meals'],
          MealStruct.fromMap,
        ),
      );

  static FoodTrackerStruct? maybeFromMap(dynamic data) => data is Map
      ? FoodTrackerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'meals': _meals?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'meals': serializeParam(
          _meals,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static FoodTrackerStruct fromSerializableMap(Map<String, dynamic> data) =>
      FoodTrackerStruct(
        meals: deserializeStructParam<MealStruct>(
          data['meals'],
          ParamType.DataStruct,
          true,
          structBuilder: MealStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FoodTrackerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FoodTrackerStruct &&
        listEquality.equals(meals, other.meals);
  }

  @override
  int get hashCode => const ListEquality().hash([meals]);
}

FoodTrackerStruct createFoodTrackerStruct() => FoodTrackerStruct();
