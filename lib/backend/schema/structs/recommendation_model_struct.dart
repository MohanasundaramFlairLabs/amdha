// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecommendationModelStruct extends BaseStruct {
  RecommendationModelStruct({
    List<RecommendationStruct>? recommendations,
    AdditionalDataStruct? additionalData,
  })  : _recommendations = recommendations,
        _additionalData = additionalData;

  // "recommendations" field.
  List<RecommendationStruct>? _recommendations;
  List<RecommendationStruct> get recommendations =>
      _recommendations ?? const [];
  set recommendations(List<RecommendationStruct>? val) =>
      _recommendations = val;

  void updateRecommendations(Function(List<RecommendationStruct>) updateFn) {
    updateFn(_recommendations ??= []);
  }

  bool hasRecommendations() => _recommendations != null;

  // "additionalData" field.
  AdditionalDataStruct? _additionalData;
  AdditionalDataStruct get additionalData =>
      _additionalData ?? AdditionalDataStruct();
  set additionalData(AdditionalDataStruct? val) => _additionalData = val;

  void updateAdditionalData(Function(AdditionalDataStruct) updateFn) {
    updateFn(_additionalData ??= AdditionalDataStruct());
  }

  bool hasAdditionalData() => _additionalData != null;

  static RecommendationModelStruct fromMap(Map<String, dynamic> data) =>
      RecommendationModelStruct(
        recommendations: getStructList(
          data['recommendations'],
          RecommendationStruct.fromMap,
        ),
        additionalData: data['additionalData'] is AdditionalDataStruct
            ? data['additionalData']
            : AdditionalDataStruct.maybeFromMap(data['additionalData']),
      );

  static RecommendationModelStruct? maybeFromMap(dynamic data) => data is Map
      ? RecommendationModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'recommendations': _recommendations?.map((e) => e.toMap()).toList(),
        'additionalData': _additionalData?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'recommendations': serializeParam(
          _recommendations,
          ParamType.DataStruct,
          isList: true,
        ),
        'additionalData': serializeParam(
          _additionalData,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static RecommendationModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RecommendationModelStruct(
        recommendations: deserializeStructParam<RecommendationStruct>(
          data['recommendations'],
          ParamType.DataStruct,
          true,
          structBuilder: RecommendationStruct.fromSerializableMap,
        ),
        additionalData: deserializeStructParam(
          data['additionalData'],
          ParamType.DataStruct,
          false,
          structBuilder: AdditionalDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RecommendationModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RecommendationModelStruct &&
        listEquality.equals(recommendations, other.recommendations) &&
        additionalData == other.additionalData;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([recommendations, additionalData]);
}

RecommendationModelStruct createRecommendationModelStruct({
  AdditionalDataStruct? additionalData,
}) =>
    RecommendationModelStruct(
      additionalData: additionalData ?? AdditionalDataStruct(),
    );
