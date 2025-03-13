// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsentModelStruct extends BaseStruct {
  ConsentModelStruct({
    List<FileUrlStruct>? fileUrl,
  }) : _fileUrl = fileUrl;

  // "fileUrl" field.
  List<FileUrlStruct>? _fileUrl;
  List<FileUrlStruct> get fileUrl => _fileUrl ?? const [];
  set fileUrl(List<FileUrlStruct>? val) => _fileUrl = val;

  void updateFileUrl(Function(List<FileUrlStruct>) updateFn) {
    updateFn(_fileUrl ??= []);
  }

  bool hasFileUrl() => _fileUrl != null;

  static ConsentModelStruct fromMap(Map<String, dynamic> data) =>
      ConsentModelStruct(
        fileUrl: getStructList(
          data['fileUrl'],
          FileUrlStruct.fromMap,
        ),
      );

  static ConsentModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ConsentModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fileUrl': _fileUrl?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fileUrl': serializeParam(
          _fileUrl,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ConsentModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConsentModelStruct(
        fileUrl: deserializeStructParam<FileUrlStruct>(
          data['fileUrl'],
          ParamType.DataStruct,
          true,
          structBuilder: FileUrlStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ConsentModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConsentModelStruct &&
        listEquality.equals(fileUrl, other.fileUrl);
  }

  @override
  int get hashCode => const ListEquality().hash([fileUrl]);
}

ConsentModelStruct createConsentModelStruct() => ConsentModelStruct();
