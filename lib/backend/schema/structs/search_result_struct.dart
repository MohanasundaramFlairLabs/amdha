// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchResultStruct extends BaseStruct {
  SearchResultStruct({
    int? total,
    List<ResultsStruct>? results,
  })  : _total = total,
        _results = results;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "results" field.
  List<ResultsStruct>? _results;
  List<ResultsStruct> get results => _results ?? const [];
  set results(List<ResultsStruct>? val) => _results = val;

  void updateResults(Function(List<ResultsStruct>) updateFn) {
    updateFn(_results ??= []);
  }

  bool hasResults() => _results != null;

  static SearchResultStruct fromMap(Map<String, dynamic> data) =>
      SearchResultStruct(
        total: castToType<int>(data['total']),
        results: getStructList(
          data['results'],
          ResultsStruct.fromMap,
        ),
      );

  static SearchResultStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'total': _total,
        'results': _results?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
        'results': serializeParam(
          _results,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SearchResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchResultStruct(
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
        results: deserializeStructParam<ResultsStruct>(
          data['results'],
          ParamType.DataStruct,
          true,
          structBuilder: ResultsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SearchResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SearchResultStruct &&
        total == other.total &&
        listEquality.equals(results, other.results);
  }

  @override
  int get hashCode => const ListEquality().hash([total, results]);
}

SearchResultStruct createSearchResultStruct({
  int? total,
}) =>
    SearchResultStruct(
      total: total,
    );
