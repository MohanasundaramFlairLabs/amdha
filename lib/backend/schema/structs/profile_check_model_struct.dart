// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileCheckModelStruct extends BaseStruct {
  ProfileCheckModelStruct({
    bool? showAdditionalDetailsPage,
  }) : _showAdditionalDetailsPage = showAdditionalDetailsPage;

  // "showAdditionalDetailsPage" field.
  bool? _showAdditionalDetailsPage;
  bool get showAdditionalDetailsPage => _showAdditionalDetailsPage ?? false;
  set showAdditionalDetailsPage(bool? val) => _showAdditionalDetailsPage = val;

  bool hasShowAdditionalDetailsPage() => _showAdditionalDetailsPage != null;

  static ProfileCheckModelStruct fromMap(Map<String, dynamic> data) =>
      ProfileCheckModelStruct(
        showAdditionalDetailsPage: data['showAdditionalDetailsPage'] as bool?,
      );

  static ProfileCheckModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ProfileCheckModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'showAdditionalDetailsPage': _showAdditionalDetailsPage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'showAdditionalDetailsPage': serializeParam(
          _showAdditionalDetailsPage,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ProfileCheckModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProfileCheckModelStruct(
        showAdditionalDetailsPage: deserializeParam(
          data['showAdditionalDetailsPage'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ProfileCheckModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileCheckModelStruct &&
        showAdditionalDetailsPage == other.showAdditionalDetailsPage;
  }

  @override
  int get hashCode => const ListEquality().hash([showAdditionalDetailsPage]);
}

ProfileCheckModelStruct createProfileCheckModelStruct({
  bool? showAdditionalDetailsPage,
}) =>
    ProfileCheckModelStruct(
      showAdditionalDetailsPage: showAdditionalDetailsPage,
    );
