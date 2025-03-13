import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'food_tracker_page_widget.dart' show FoodTrackerPageWidget;
import 'package:flutter/material.dart';

class FoodTrackerPageModel extends FlutterFlowModel<FoodTrackerPageWidget> {
  ///  Local state fields for this page.

  int? selectedIndex;

  MealStruct? meal;
  void updateMealStruct(Function(MealStruct) updateFn) {
    updateFn(meal ??= MealStruct());
  }

  DateTime? mealTime;

  MealItemStruct? foodLogs;
  void updateFoodLogsStruct(Function(MealItemStruct) updateFn) {
    updateFn(foodLogs ??= MealItemStruct());
  }

  bool isEditMode = false;

  int? foodIndex;

  bool isFoodAdded = false;

  bool isDataLoaded = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetFoodTracker)] action in FoodTrackerPage widget.
  ApiCallResponse? meals;
  DateTime? datePicked;
  // State field(s) for foodItem widget.
  FocusNode? foodItemFocusNode;
  TextEditingController? foodItemTextController;
  String? Function(BuildContext, String?)? foodItemTextControllerValidator;
  // State field(s) for portion widget.
  FocusNode? portionFocusNode;
  TextEditingController? portionTextController;
  String? Function(BuildContext, String?)? portionTextControllerValidator;
  // State field(s) for portionSize widget.
  FocusNode? portionSizeFocusNode;
  TextEditingController? portionSizeTextController;
  String? Function(BuildContext, String?)? portionSizeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    foodItemFocusNode?.dispose();
    foodItemTextController?.dispose();

    portionFocusNode?.dispose();
    portionTextController?.dispose();

    portionSizeFocusNode?.dispose();
    portionSizeTextController?.dispose();
  }
}
