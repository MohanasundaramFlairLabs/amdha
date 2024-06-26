// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EducationStruct extends BaseStruct {
  EducationStruct({
    String? categoryLabel,
    List<ItemsStruct>? items,
  })  : _categoryLabel = categoryLabel,
        _items = items;

  // "category_label" field.
  String? _categoryLabel;
  String get categoryLabel => _categoryLabel ?? '';
  set categoryLabel(String? val) => _categoryLabel = val;

  bool hasCategoryLabel() => _categoryLabel != null;

  // "items" field.
  List<ItemsStruct>? _items;
  List<ItemsStruct> get items => _items ?? const [];
  set items(List<ItemsStruct>? val) => _items = val;

  void updateItems(Function(List<ItemsStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  static EducationStruct fromMap(Map<String, dynamic> data) => EducationStruct(
        categoryLabel: data['category_label'] as String?,
        items: getStructList(
          data['items'],
          ItemsStruct.fromMap,
        ),
      );

  static EducationStruct? maybeFromMap(dynamic data) => data is Map
      ? EducationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'category_label': _categoryLabel,
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category_label': serializeParam(
          _categoryLabel,
          ParamType.String,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static EducationStruct fromSerializableMap(Map<String, dynamic> data) =>
      EducationStruct(
        categoryLabel: deserializeParam(
          data['category_label'],
          ParamType.String,
          false,
        ),
        items: deserializeStructParam<ItemsStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'EducationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EducationStruct &&
        categoryLabel == other.categoryLabel &&
        listEquality.equals(items, other.items);
  }

  @override
  int get hashCode => const ListEquality().hash([categoryLabel, items]);
}

EducationStruct createEducationStruct({
  String? categoryLabel,
}) =>
    EducationStruct(
      categoryLabel: categoryLabel,
    );
