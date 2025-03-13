// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JournalModelStruct extends BaseStruct {
  JournalModelStruct({
    List<JournalEntriesStruct>? journalEntries,
  }) : _journalEntries = journalEntries;

  // "journalEntries" field.
  List<JournalEntriesStruct>? _journalEntries;
  List<JournalEntriesStruct> get journalEntries => _journalEntries ?? const [];
  set journalEntries(List<JournalEntriesStruct>? val) => _journalEntries = val;

  void updateJournalEntries(Function(List<JournalEntriesStruct>) updateFn) {
    updateFn(_journalEntries ??= []);
  }

  bool hasJournalEntries() => _journalEntries != null;

  static JournalModelStruct fromMap(Map<String, dynamic> data) =>
      JournalModelStruct(
        journalEntries: getStructList(
          data['journalEntries'],
          JournalEntriesStruct.fromMap,
        ),
      );

  static JournalModelStruct? maybeFromMap(dynamic data) => data is Map
      ? JournalModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'journalEntries': _journalEntries?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'journalEntries': serializeParam(
          _journalEntries,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static JournalModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      JournalModelStruct(
        journalEntries: deserializeStructParam<JournalEntriesStruct>(
          data['journalEntries'],
          ParamType.DataStruct,
          true,
          structBuilder: JournalEntriesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'JournalModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is JournalModelStruct &&
        listEquality.equals(journalEntries, other.journalEntries);
  }

  @override
  int get hashCode => const ListEquality().hash([journalEntries]);
}

JournalModelStruct createJournalModelStruct() => JournalModelStruct();
