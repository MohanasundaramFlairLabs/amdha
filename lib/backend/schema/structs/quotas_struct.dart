// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuotasStruct extends BaseStruct {
  QuotasStruct({
    int? medicationReminders,
    int? fileUpload,
    int? wellbeingScore,
    int? careplixScan,
    int? addVitals,
    int? videoCall,
  })  : _medicationReminders = medicationReminders,
        _fileUpload = fileUpload,
        _wellbeingScore = wellbeingScore,
        _careplixScan = careplixScan,
        _addVitals = addVitals,
        _videoCall = videoCall;

  // "medication_reminders" field.
  int? _medicationReminders;
  int get medicationReminders => _medicationReminders ?? 0;
  set medicationReminders(int? val) => _medicationReminders = val;

  void incrementMedicationReminders(int amount) =>
      medicationReminders = medicationReminders + amount;

  bool hasMedicationReminders() => _medicationReminders != null;

  // "file_upload" field.
  int? _fileUpload;
  int get fileUpload => _fileUpload ?? 0;
  set fileUpload(int? val) => _fileUpload = val;

  void incrementFileUpload(int amount) => fileUpload = fileUpload + amount;

  bool hasFileUpload() => _fileUpload != null;

  // "wellbeing_score" field.
  int? _wellbeingScore;
  int get wellbeingScore => _wellbeingScore ?? 0;
  set wellbeingScore(int? val) => _wellbeingScore = val;

  void incrementWellbeingScore(int amount) =>
      wellbeingScore = wellbeingScore + amount;

  bool hasWellbeingScore() => _wellbeingScore != null;

  // "careplix_scan" field.
  int? _careplixScan;
  int get careplixScan => _careplixScan ?? 0;
  set careplixScan(int? val) => _careplixScan = val;

  void incrementCareplixScan(int amount) =>
      careplixScan = careplixScan + amount;

  bool hasCareplixScan() => _careplixScan != null;

  // "add_vitals" field.
  int? _addVitals;
  int get addVitals => _addVitals ?? 0;
  set addVitals(int? val) => _addVitals = val;

  void incrementAddVitals(int amount) => addVitals = addVitals + amount;

  bool hasAddVitals() => _addVitals != null;

  // "video_call" field.
  int? _videoCall;
  int get videoCall => _videoCall ?? 0;
  set videoCall(int? val) => _videoCall = val;

  void incrementVideoCall(int amount) => videoCall = videoCall + amount;

  bool hasVideoCall() => _videoCall != null;

  static QuotasStruct fromMap(Map<String, dynamic> data) => QuotasStruct(
        medicationReminders: castToType<int>(data['medication_reminders']),
        fileUpload: castToType<int>(data['file_upload']),
        wellbeingScore: castToType<int>(data['wellbeing_score']),
        careplixScan: castToType<int>(data['careplix_scan']),
        addVitals: castToType<int>(data['add_vitals']),
        videoCall: castToType<int>(data['video_call']),
      );

  static QuotasStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuotasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'medication_reminders': _medicationReminders,
        'file_upload': _fileUpload,
        'wellbeing_score': _wellbeingScore,
        'careplix_scan': _careplixScan,
        'add_vitals': _addVitals,
        'video_call': _videoCall,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medication_reminders': serializeParam(
          _medicationReminders,
          ParamType.int,
        ),
        'file_upload': serializeParam(
          _fileUpload,
          ParamType.int,
        ),
        'wellbeing_score': serializeParam(
          _wellbeingScore,
          ParamType.int,
        ),
        'careplix_scan': serializeParam(
          _careplixScan,
          ParamType.int,
        ),
        'add_vitals': serializeParam(
          _addVitals,
          ParamType.int,
        ),
        'video_call': serializeParam(
          _videoCall,
          ParamType.int,
        ),
      }.withoutNulls;

  static QuotasStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuotasStruct(
        medicationReminders: deserializeParam(
          data['medication_reminders'],
          ParamType.int,
          false,
        ),
        fileUpload: deserializeParam(
          data['file_upload'],
          ParamType.int,
          false,
        ),
        wellbeingScore: deserializeParam(
          data['wellbeing_score'],
          ParamType.int,
          false,
        ),
        careplixScan: deserializeParam(
          data['careplix_scan'],
          ParamType.int,
          false,
        ),
        addVitals: deserializeParam(
          data['add_vitals'],
          ParamType.int,
          false,
        ),
        videoCall: deserializeParam(
          data['video_call'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'QuotasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuotasStruct &&
        medicationReminders == other.medicationReminders &&
        fileUpload == other.fileUpload &&
        wellbeingScore == other.wellbeingScore &&
        careplixScan == other.careplixScan &&
        addVitals == other.addVitals &&
        videoCall == other.videoCall;
  }

  @override
  int get hashCode => const ListEquality().hash([
        medicationReminders,
        fileUpload,
        wellbeingScore,
        careplixScan,
        addVitals,
        videoCall
      ]);
}

QuotasStruct createQuotasStruct({
  int? medicationReminders,
  int? fileUpload,
  int? wellbeingScore,
  int? careplixScan,
  int? addVitals,
  int? videoCall,
}) =>
    QuotasStruct(
      medicationReminders: medicationReminders,
      fileUpload: fileUpload,
      wellbeingScore: wellbeingScore,
      careplixScan: careplixScan,
      addVitals: addVitals,
      videoCall: videoCall,
    );
