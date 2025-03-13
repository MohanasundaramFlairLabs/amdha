// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class YourVisitsStruct extends BaseStruct {
  YourVisitsStruct({
    List<String>? notes,
    String? tenantId,
    String? internalId,
    String? externalId,
    String? consultedOn,
    String? doctorId,
    String? caseSheetId,
    DoctorDetailsStruct? doctorDetails,
    List<MedicationModelStruct>? medication,
    String? consultationType,
  })  : _notes = notes,
        _tenantId = tenantId,
        _internalId = internalId,
        _externalId = externalId,
        _consultedOn = consultedOn,
        _doctorId = doctorId,
        _caseSheetId = caseSheetId,
        _doctorDetails = doctorDetails,
        _medication = medication,
        _consultationType = consultationType;

  // "notes" field.
  List<String>? _notes;
  List<String> get notes => _notes ?? const [];
  set notes(List<String>? val) => _notes = val;

  void updateNotes(Function(List<String>) updateFn) {
    updateFn(_notes ??= []);
  }

  bool hasNotes() => _notes != null;

  // "tenantId" field.
  String? _tenantId;
  String get tenantId => _tenantId ?? '';
  set tenantId(String? val) => _tenantId = val;

  bool hasTenantId() => _tenantId != null;

  // "internalId" field.
  String? _internalId;
  String get internalId => _internalId ?? '';
  set internalId(String? val) => _internalId = val;

  bool hasInternalId() => _internalId != null;

  // "externalId" field.
  String? _externalId;
  String get externalId => _externalId ?? '';
  set externalId(String? val) => _externalId = val;

  bool hasExternalId() => _externalId != null;

  // "consultedOn" field.
  String? _consultedOn;
  String get consultedOn => _consultedOn ?? '';
  set consultedOn(String? val) => _consultedOn = val;

  bool hasConsultedOn() => _consultedOn != null;

  // "doctorId" field.
  String? _doctorId;
  String get doctorId => _doctorId ?? '';
  set doctorId(String? val) => _doctorId = val;

  bool hasDoctorId() => _doctorId != null;

  // "caseSheetId" field.
  String? _caseSheetId;
  String get caseSheetId => _caseSheetId ?? '';
  set caseSheetId(String? val) => _caseSheetId = val;

  bool hasCaseSheetId() => _caseSheetId != null;

  // "doctorDetails" field.
  DoctorDetailsStruct? _doctorDetails;
  DoctorDetailsStruct get doctorDetails =>
      _doctorDetails ?? DoctorDetailsStruct();
  set doctorDetails(DoctorDetailsStruct? val) => _doctorDetails = val;

  void updateDoctorDetails(Function(DoctorDetailsStruct) updateFn) {
    updateFn(_doctorDetails ??= DoctorDetailsStruct());
  }

  bool hasDoctorDetails() => _doctorDetails != null;

  // "medication" field.
  List<MedicationModelStruct>? _medication;
  List<MedicationModelStruct> get medication => _medication ?? const [];
  set medication(List<MedicationModelStruct>? val) => _medication = val;

  void updateMedication(Function(List<MedicationModelStruct>) updateFn) {
    updateFn(_medication ??= []);
  }

  bool hasMedication() => _medication != null;

  // "consultationType" field.
  String? _consultationType;
  String get consultationType => _consultationType ?? '';
  set consultationType(String? val) => _consultationType = val;

  bool hasConsultationType() => _consultationType != null;

  static YourVisitsStruct fromMap(Map<String, dynamic> data) =>
      YourVisitsStruct(
        notes: getDataList(data['notes']),
        tenantId: data['tenantId'] as String?,
        internalId: data['internalId'] as String?,
        externalId: data['externalId'] as String?,
        consultedOn: data['consultedOn'] as String?,
        doctorId: data['doctorId'] as String?,
        caseSheetId: data['caseSheetId'] as String?,
        doctorDetails: data['doctorDetails'] is DoctorDetailsStruct
            ? data['doctorDetails']
            : DoctorDetailsStruct.maybeFromMap(data['doctorDetails']),
        medication: getStructList(
          data['medication'],
          MedicationModelStruct.fromMap,
        ),
        consultationType: data['consultationType'] as String?,
      );

  static YourVisitsStruct? maybeFromMap(dynamic data) => data is Map
      ? YourVisitsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'notes': _notes,
        'tenantId': _tenantId,
        'internalId': _internalId,
        'externalId': _externalId,
        'consultedOn': _consultedOn,
        'doctorId': _doctorId,
        'caseSheetId': _caseSheetId,
        'doctorDetails': _doctorDetails?.toMap(),
        'medication': _medication?.map((e) => e.toMap()).toList(),
        'consultationType': _consultationType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'notes': serializeParam(
          _notes,
          ParamType.String,
          isList: true,
        ),
        'tenantId': serializeParam(
          _tenantId,
          ParamType.String,
        ),
        'internalId': serializeParam(
          _internalId,
          ParamType.String,
        ),
        'externalId': serializeParam(
          _externalId,
          ParamType.String,
        ),
        'consultedOn': serializeParam(
          _consultedOn,
          ParamType.String,
        ),
        'doctorId': serializeParam(
          _doctorId,
          ParamType.String,
        ),
        'caseSheetId': serializeParam(
          _caseSheetId,
          ParamType.String,
        ),
        'doctorDetails': serializeParam(
          _doctorDetails,
          ParamType.DataStruct,
        ),
        'medication': serializeParam(
          _medication,
          ParamType.DataStruct,
          isList: true,
        ),
        'consultationType': serializeParam(
          _consultationType,
          ParamType.String,
        ),
      }.withoutNulls;

  static YourVisitsStruct fromSerializableMap(Map<String, dynamic> data) =>
      YourVisitsStruct(
        notes: deserializeParam<String>(
          data['notes'],
          ParamType.String,
          true,
        ),
        tenantId: deserializeParam(
          data['tenantId'],
          ParamType.String,
          false,
        ),
        internalId: deserializeParam(
          data['internalId'],
          ParamType.String,
          false,
        ),
        externalId: deserializeParam(
          data['externalId'],
          ParamType.String,
          false,
        ),
        consultedOn: deserializeParam(
          data['consultedOn'],
          ParamType.String,
          false,
        ),
        doctorId: deserializeParam(
          data['doctorId'],
          ParamType.String,
          false,
        ),
        caseSheetId: deserializeParam(
          data['caseSheetId'],
          ParamType.String,
          false,
        ),
        doctorDetails: deserializeStructParam(
          data['doctorDetails'],
          ParamType.DataStruct,
          false,
          structBuilder: DoctorDetailsStruct.fromSerializableMap,
        ),
        medication: deserializeStructParam<MedicationModelStruct>(
          data['medication'],
          ParamType.DataStruct,
          true,
          structBuilder: MedicationModelStruct.fromSerializableMap,
        ),
        consultationType: deserializeParam(
          data['consultationType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'YourVisitsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is YourVisitsStruct &&
        listEquality.equals(notes, other.notes) &&
        tenantId == other.tenantId &&
        internalId == other.internalId &&
        externalId == other.externalId &&
        consultedOn == other.consultedOn &&
        doctorId == other.doctorId &&
        caseSheetId == other.caseSheetId &&
        doctorDetails == other.doctorDetails &&
        listEquality.equals(medication, other.medication) &&
        consultationType == other.consultationType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        notes,
        tenantId,
        internalId,
        externalId,
        consultedOn,
        doctorId,
        caseSheetId,
        doctorDetails,
        medication,
        consultationType
      ]);
}

YourVisitsStruct createYourVisitsStruct({
  String? tenantId,
  String? internalId,
  String? externalId,
  String? consultedOn,
  String? doctorId,
  String? caseSheetId,
  DoctorDetailsStruct? doctorDetails,
  String? consultationType,
}) =>
    YourVisitsStruct(
      tenantId: tenantId,
      internalId: internalId,
      externalId: externalId,
      consultedOn: consultedOn,
      doctorId: doctorId,
      caseSheetId: caseSheetId,
      doctorDetails: doctorDetails ?? DoctorDetailsStruct(),
      consultationType: consultationType,
    );
