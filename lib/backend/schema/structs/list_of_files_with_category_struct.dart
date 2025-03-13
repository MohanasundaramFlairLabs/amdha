// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListOfFilesWithCategoryStruct extends BaseStruct {
  ListOfFilesWithCategoryStruct({
    String? category,
    List<ListofFilesModelStruct>? list,
  })  : _category = category,
        _list = list;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "list" field.
  List<ListofFilesModelStruct>? _list;
  List<ListofFilesModelStruct> get list => _list ?? const [];
  set list(List<ListofFilesModelStruct>? val) => _list = val;

  void updateList(Function(List<ListofFilesModelStruct>) updateFn) {
    updateFn(_list ??= []);
  }

  bool hasList() => _list != null;

  static ListOfFilesWithCategoryStruct fromMap(Map<String, dynamic> data) =>
      ListOfFilesWithCategoryStruct(
        category: data['category'] as String?,
        list: getStructList(
          data['list'],
          ListofFilesModelStruct.fromMap,
        ),
      );

  static ListOfFilesWithCategoryStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ListOfFilesWithCategoryStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'list': _list?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'list': serializeParam(
          _list,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ListOfFilesWithCategoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ListOfFilesWithCategoryStruct(
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        list: deserializeStructParam<ListofFilesModelStruct>(
          data['list'],
          ParamType.DataStruct,
          true,
          structBuilder: ListofFilesModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListOfFilesWithCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListOfFilesWithCategoryStruct &&
        category == other.category &&
        listEquality.equals(list, other.list);
  }

  @override
  int get hashCode => const ListEquality().hash([category, list]);
}

ListOfFilesWithCategoryStruct createListOfFilesWithCategoryStruct({
  String? category,
}) =>
    ListOfFilesWithCategoryStruct(
      category: category,
    );
