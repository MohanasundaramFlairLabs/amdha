import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start HOC Group Code

class HocGroup {
  static String getBaseUrl({
    String? baseurl = '',
  }) =>
      '${baseurl}/activity/api/auth';
  static Map<String, String> headers = {};
  static MedicationCall medicationCall = MedicationCall();
  static HomeCall homeCall = HomeCall();
  static MoreCall moreCall = MoreCall();
  static EducationCall educationCall = EducationCall();
  static AddMedicationCall addMedicationCall = AddMedicationCall();
  static SearchMedicationCall searchMedicationCall = SearchMedicationCall();
  static GetJournalCall getJournalCall = GetJournalCall();
  static AddJournalCall addJournalCall = AddJournalCall();
  static GetQuestionCall getQuestionCall = GetQuestionCall();
  static GetProfileCall getProfileCall = GetProfileCall();
  static WellbeingScoreCall wellbeingScoreCall = WellbeingScoreCall();
  static UpdateMedicationCall updateMedicationCall = UpdateMedicationCall();
  static UpcomingMedicationCall upcomingMedicationCall =
      UpcomingMedicationCall();
  static CreateprofileCall createprofileCall = CreateprofileCall();
  static ScanHistoryCall scanHistoryCall = ScanHistoryCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static DeleteJournalCall deleteJournalCall = DeleteJournalCall();
  static DeleteHealthFileCall deleteHealthFileCall = DeleteHealthFileCall();
  static GetMedicationByIdCall getMedicationByIdCall = GetMedicationByIdCall();
  static DeleteVitalCall deleteVitalCall = DeleteVitalCall();
  static DeleteMedicationCall deleteMedicationCall = DeleteMedicationCall();
  static GetConnectionsCall getConnectionsCall = GetConnectionsCall();
  static GetUserCall getUserCall = GetUserCall();
  static GetReportTypeCall getReportTypeCall = GetReportTypeCall();
  static GetMediaUriCall getMediaUriCall = GetMediaUriCall();
  static GetConsentDocumentsCall getConsentDocumentsCall =
      GetConsentDocumentsCall();
  static SubmitExerciseTrackerCall submitExerciseTrackerCall =
      SubmitExerciseTrackerCall();
  static SubmitFoodTrackerCall submitFoodTrackerCall = SubmitFoodTrackerCall();
  static GetFoodTrackerCall getFoodTrackerCall = GetFoodTrackerCall();
  static FoodTrackerPDFCall foodTrackerPDFCall = FoodTrackerPDFCall();
  static GetExerciseDataCall getExerciseDataCall = GetExerciseDataCall();
  static ExercisePDFDownloadCall exercisePDFDownloadCall =
      ExercisePDFDownloadCall();
  static OCRResultCall oCRResultCall = OCRResultCall();
  static SubmitOCRResultCall submitOCRResultCall = SubmitOCRResultCall();

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class MedicationCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'medication',
        apiUrl: '${baseUrl}/medication',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class HomeCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'home',
        apiUrl: '${baseUrl}/home',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class MoreCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'more',
        apiUrl: '${baseUrl}/more',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class EducationCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'education',
        apiUrl: '${baseUrl}/education',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class AddMedicationCall {
  Future<ApiCallResponse> call({
    String? medicationName = '',
    String? dosage = '',
    List<String>? frequencyList,
    String? often = '',
    String? startDate = '\"\"',
    String? endDate = '\"\"',
    String? period = '\"0\"',
    String? additionalNote = '\"\"',
    bool? reminder,
    String? userId = '\"\"',
    dynamic reminderTimingJson,
    String? addedBy = '\"\"',
    String? note = '\"\"',
    bool? isCritical,
    String? externalId = '\"\"',
    String? units = '',
    String? taskId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );
    final frequency = _serializeList(frequencyList);
    final reminderTiming = _serializeJson(reminderTimingJson);
    final ffApiRequestBody = '''
{
  "time": ${frequency},
  "reminderTimings": ${reminderTiming},
  "name": "${medicationName}",
  "units": "${units}",
  "dosage": "${dosage}",
  "howOften": "${often}",
  "startDate": "${startDate}",
  "period": "${period}",
  "endDate": "${endDate}",
  "isCritical": ${isCritical},
  "instruction": "${note}",
  "additionalNote": "${additionalNote}",
  "autoReminder": ${reminder},
  "addedBy": "${addedBy}",
  "externalId": "${externalId}",
  "task_id": "${taskId}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'addMedication',
        apiUrl: '${baseUrl}/medication',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class SearchMedicationCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? userId = '',
    int? page,
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'searchMedication',
        apiUrl: '${baseUrl}/medication/search',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'medicine': search,
          'page': page,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetJournalCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'getJournal',
        apiUrl: '${baseUrl}/journal',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class AddJournalCall {
  Future<ApiCallResponse> call({
    String? uniqueId = '',
    String? answer = '',
    String? userId = '',
    String? taskId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    final ffApiRequestBody = '''
{
  "uniqueIdentifier": "${uniqueId}",
  "task_id": "${taskId}",
  "answer": "${answer}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'addJournal',
        apiUrl: '${baseUrl}/journal',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetQuestionCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? activity = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'getQuestion',
        apiUrl: '${baseUrl}/journal/question',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'activity': activity,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'getProfile',
        apiUrl: '${baseUrl}/profile',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class WellbeingScoreCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'wellbeingScore',
        apiUrl: '${baseUrl}/vitals/wellbeingScore',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class UpdateMedicationCall {
  Future<ApiCallResponse> call({
    String? addedBy = '',
    String? additionalNote = '\"\"',
    bool? autoReminder,
    String? dosage = '',
    String? endDate = '\"\"',
    String? howOften = '\"\"',
    bool? isCritical,
    String? name = '',
    String? note = '\"\"',
    int? period = 0,
    List<String>? timeList,
    dynamic reminderTimingJson,
    String? id = '',
    String? startDate = '\"\"',
    String? userId = '',
    String? units = '\"\"',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );
    final time = _serializeList(timeList);
    final reminderTiming = _serializeJson(reminderTimingJson);
    final ffApiRequestBody = '''
{
  "_id": "${id}",
  "medication": {
    "addedBy": "${addedBy}",
    "additionalNote": "${additionalNote}",
    "autoReminder": ${autoReminder},
    "dosage": "${dosage}",
    "endDate": "${endDate}",
    "howOften": "${howOften}",
    "isCritical": ${isCritical},
    "units": "${units}",
    "name": "${name}",
    "instruction": "${note}",
    "period": ${period},
    "startDate": "${startDate}",
    "time": ${time},
    "reminderTimings": ${reminderTiming}
  }
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'updateMedication',
        apiUrl: '${baseUrl}/medication',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class UpcomingMedicationCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? timestamp = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'upcomingMedication',
        apiUrl: '${baseUrl}/medication/upcoming',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'timestamp': timestamp,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class CreateprofileCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? gender = '',
    double? weight,
    double? height,
    double? dob,
    String? bloodgroup = '',
    String? mobileNumber = '',
    String? abhaId = '',
    String? aadhaarId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    final ffApiRequestBody = '''
{
  "gender": "${gender}",
  "weight": ${weight},
  "height": ${height},
  "dob": "${dob}",
  "bloodGroup": "${bloodgroup}",
  "phoneNumber": "${mobileNumber}",
  "abhaId": "${abhaId}",
"aadhaarId":"${aadhaarId}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Createprofile',
        apiUrl: '${baseUrl}/profile',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class ScanHistoryCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? quotaType = 'scans',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'scanHistory',
        apiUrl: '${baseUrl}/scan/history',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'quota_type': quotaType,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    dynamic bodyJson,
    String? userId = '',
    FFUploadedFile? userProfileImage,
    String? updateData = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    final body = _serializeJson(bodyJson);

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'updateProfile',
        apiUrl: '${baseUrl}/profile',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'body': body,
          'userProfileImage': userProfileImage,
          'updateData': updateData,
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class DeleteJournalCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? id = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'deleteJournal',
        apiUrl: '${baseUrl}/journal',
        callType: ApiCallType.DELETE,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'id': id,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class DeleteHealthFileCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? path = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'deleteHealthFile',
        apiUrl: '${baseUrl}/reports',
        callType: ApiCallType.DELETE,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          '_id': id,
          'path': path,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetMedicationByIdCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'getMedicationById',
        apiUrl: '${baseUrl}/medication',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'id': id,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class DeleteVitalCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? type = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'deleteVital',
        apiUrl: '${baseUrl}/vitals',
        callType: ApiCallType.DELETE,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'id': id,
          'type': type,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class DeleteMedicationCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? id = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'deleteMedication',
        apiUrl: '${baseUrl}/medication',
        callType: ApiCallType.DELETE,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'id': id,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetConnectionsCall {
  Future<ApiCallResponse> call({
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetConnections',
        apiUrl: '${baseUrl}/connections',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetUserCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetUser',
        apiUrl: '${baseUrl}/user',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetReportTypeCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetReportType',
        apiUrl: '${baseUrl}/reportType',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetMediaUriCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetMediaUri',
        apiUrl: '${baseUrl}/education/link',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'id': id,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetConsentDocumentsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetConsentDocuments',
        apiUrl: '${baseUrl}/fileurl',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class SubmitExerciseTrackerCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    dynamic exerciseDataJson,
    String? createDate = '',
    String? timeZone = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    final exerciseData = _serializeJson(exerciseDataJson, true);
    final ffApiRequestBody = '''
{
  "exerciseData": ${exerciseData},
  "createDate": "${escapeStringForJson(createDate)}",
  "timeZone": "${escapeStringForJson(timeZone)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SubmitExerciseTracker',
        apiUrl: '${baseUrl}/tracker/exercise',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class SubmitFoodTrackerCall {
  Future<ApiCallResponse> call({
    dynamic mealsJson,
    String? userId = '',
    String? createDate = '',
    String? timeZone = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    final meals = _serializeJson(mealsJson, true);
    final ffApiRequestBody = '''
{
  "meals": ${meals},
  "createDate": "${escapeStringForJson(createDate)}",
  "timeZone": "${escapeStringForJson(timeZone)}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SubmitFoodTracker',
        apiUrl: '${baseUrl}/tracker/food',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetFoodTrackerCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? range = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetFoodTracker',
        apiUrl: '${baseUrl}/tracker/food',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'date': date,
          'range': range,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class FoodTrackerPDFCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? range = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'FoodTrackerPDF',
        apiUrl: '${baseUrl}/foodTrackerPdf',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class GetExerciseDataCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? range = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetExerciseData',
        apiUrl: '${baseUrl}/tracker/exercise',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'date': date,
          'range': range,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class ExercisePDFDownloadCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? date = '',
    String? range = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'ExercisePDFDownload',
        apiUrl: '${baseUrl}/exerciseTrackerPdf',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.NONE,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class OCRResultCall {
  Future<ApiCallResponse> call({
    String? reportId = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'OCRResult',
        apiUrl: '${baseUrl}/ocrResult/${reportId}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

class SubmitOCRResultCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    dynamic ocrScanResultJson,
    String? ocrJobId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl(
      baseurl: baseurl,
    );

    final ocrScanResult = _serializeJson(ocrScanResultJson, true);
    final ffApiRequestBody = '''
{
  "ocrJobId": "${escapeStringForJson(ocrJobId)}",
  "ocrScanResult": ${ocrScanResult}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SubmitOCRResult',
        apiUrl: '${baseUrl}/ocrResult',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      HocGroup.interceptors,
    );
  }
}

/// End HOC Group Code

/// Start Subscription Group Code

class SubscriptionGroup {
  static String getBaseUrl({
    String? baseurl = '',
  }) =>
      '${baseurl}/activity/api/auth';
  static Map<String, String> headers = {};
  static GetUserSubscriptionCall getUserSubscriptionCall =
      GetUserSubscriptionCall();
  static PlansCall plansCall = PlansCall();
  static SubmitSubscriptionCall submitSubscriptionCall =
      SubmitSubscriptionCall();
  static GetQuotasCall getQuotasCall = GetQuotasCall();
  static PaymentDetailsCall paymentDetailsCall = PaymentDetailsCall();
  static TransactionCall transactionCall = TransactionCall();
  static CheckFreeScanCall checkFreeScanCall = CheckFreeScanCall();
  static GetAllPlansCall getAllPlansCall = GetAllPlansCall();
  static FeaturesCall featuresCall = FeaturesCall();

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class GetUserSubscriptionCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = SubscriptionGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetUserSubscription',
        apiUrl: '${baseUrl}/subscription',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SubscriptionGroup.interceptors,
    );
  }
}

class PlansCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = SubscriptionGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Plans',
        apiUrl: '${baseUrl}/subscription/plans',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SubscriptionGroup.interceptors,
    );
  }
}

class SubmitSubscriptionCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? planId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = SubscriptionGroup.getBaseUrl(
      baseurl: baseurl,
    );

    final ffApiRequestBody = '''
{
  "plan_id": "${planId}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SubmitSubscription',
        apiUrl: '${baseUrl}/subscription',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SubscriptionGroup.interceptors,
    );
  }
}

class GetQuotasCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = SubscriptionGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetQuotas',
        apiUrl: '${baseUrl}/subscription/quota',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SubscriptionGroup.interceptors,
    );
  }
}

class PaymentDetailsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? amount = '',
    String? baseurl = '',
  }) async {
    final baseUrl = SubscriptionGroup.getBaseUrl(
      baseurl: baseurl,
    );

    final ffApiRequestBody = '''
{
  "amount": ${amount}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'PaymentDetails',
        apiUrl: '${baseUrl}/payment/order',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SubscriptionGroup.interceptors,
    );
  }
}

class TransactionCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? transactionId = '',
    String? date = '',
    String? status = '',
    String? baseurl = '',
  }) async {
    final baseUrl = SubscriptionGroup.getBaseUrl(
      baseurl: baseurl,
    );

    final ffApiRequestBody = '''
{
  "transaction_id": "${transactionId}",
  "date": "${date}",
  "status": "${status}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Transaction',
        apiUrl: '${baseUrl}/payment/transactions',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SubscriptionGroup.interceptors,
    );
  }
}

class CheckFreeScanCall {
  Future<ApiCallResponse> call({
    String? baseurl = '',
  }) async {
    final baseUrl = SubscriptionGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'checkFreeScan',
        apiUrl: '${baseUrl}/subscription/free',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SubscriptionGroup.interceptors,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.subscription.status''',
      ));
}

class GetAllPlansCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = SubscriptionGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetAllPlans',
        apiUrl: '${baseUrl}/plans',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SubscriptionGroup.interceptors,
    );
  }
}

class FeaturesCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? feature = '',
    String? baseurl = '',
  }) async {
    final baseUrl = SubscriptionGroup.getBaseUrl(
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Features',
        apiUrl: '${baseUrl}/subscription/check-feature',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'feature': feature,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      SubscriptionGroup.interceptors,
    );
  }
}

/// End Subscription Group Code

/// Start Connections Group Code

class ConnectionsGroup {
  static String getBaseUrl({
    String? userId = '',
    String? baseurl = '',
  }) =>
      '${baseurl}';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [user_id]',
  };
  static GetDoctorsListCall getDoctorsListCall = GetDoctorsListCall();
  static BookConsultCall bookConsultCall = BookConsultCall();
  static RescheduleConsultCall rescheduleConsultCall = RescheduleConsultCall();
  static GetAvailabilityCall getAvailabilityCall = GetAvailabilityCall();
  static GetSurveyCall getSurveyCall = GetSurveyCall();
  static SubmitSurveyCall submitSurveyCall = SubmitSurveyCall();
  static GetConsentCall getConsentCall = GetConsentCall();
  static SubmitConsentCall submitConsentCall = SubmitConsentCall();
  static GetUpcomingConnectionsCall getUpcomingConnectionsCall =
      GetUpcomingConnectionsCall();
  static CancelConsultationCall cancelConsultationCall =
      CancelConsultationCall();
  static ConnectVideoCallCall connectVideoCallCall = ConnectVideoCallCall();
  static GetConsultationHistoryCall getConsultationHistoryCall =
      GetConsultationHistoryCall();
  static GetCaseSummeryCall getCaseSummeryCall = GetCaseSummeryCall();
  static GetAllConsultationHistoryCall getAllConsultationHistoryCall =
      GetAllConsultationHistoryCall();
  static GetDoctorListCall getDoctorListCall = GetDoctorListCall();
  static GetAvailableDatesCall getAvailableDatesCall = GetAvailableDatesCall();

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class GetDoctorsListCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetDoctorsList',
        apiUrl: '${baseUrl}/user',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'role': "doctor",
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class BookConsultCall {
  Future<ApiCallResponse> call({
    String? startTime = '',
    String? endTime = '',
    String? notes = '',
    String? reason = '',
    String? doctorId = '',
    String? consultationType = '',
    String? taskId = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    final ffApiRequestBody = '''
{
  "startTime": "${startTime}",
  "endTime": "${endTime}",
  "notes": "${notes}",
  "reason": "${reason}",
  "doctorId": "${doctorId}",
  "consultationType": "${consultationType}",
  "task_id": "${taskId}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'BookConsult',
        apiUrl: '${baseUrl}/consultation/schedule',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class RescheduleConsultCall {
  Future<ApiCallResponse> call({
    String? startTime = '',
    String? endTime = '',
    String? appointmentId = '',
    String? reason = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    final ffApiRequestBody = '''
{
  "startTime": "${startTime}",
  "endTime": "${endTime}",
  "appointmentId": "${appointmentId}",
  "reason": "${reason}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'RescheduleConsult',
        apiUrl: '${baseUrl}/consultation/reschedule',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class GetAvailabilityCall {
  Future<ApiCallResponse> call({
    String? startDate = '',
    String? endDate = '',
    String? doctorId = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetAvailability',
        apiUrl: '${baseUrl}/consultation/availabilty/${doctorId}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'startDate': startDate,
          'endDate': endDate,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class GetSurveyCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetSurvey',
        apiUrl: '${baseUrl}/consultation/surveyQuestion',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class SubmitSurveyCall {
  Future<ApiCallResponse> call({
    dynamic dataJson,
    String? doctorId = '',
    String? consultationId = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    final data = _serializeJson(dataJson, true);
    final ffApiRequestBody = '''
{
  "doctorId": "${doctorId}",
  "surveyData": ${data},
  "consultationId": "${consultationId}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SubmitSurvey',
        apiUrl: '${baseUrl}/consultation/surveyAnswer',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class GetConsentCall {
  Future<ApiCallResponse> call({
    String? doctorId = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetConsent',
        apiUrl: '${baseUrl}/consultation/consent',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'doctorId': doctorId,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class SubmitConsentCall {
  Future<ApiCallResponse> call({
    String? doctorId = '',
    bool? status = false,
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    final ffApiRequestBody = '''
{
  "doctorId": "${doctorId}",
  "status": ${status}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SubmitConsent',
        apiUrl: '${baseUrl}/consultation/consent',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class GetUpcomingConnectionsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetUpcomingConnections',
        apiUrl: '${baseUrl}/consultation/upcomingAppointment',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class CancelConsultationCall {
  Future<ApiCallResponse> call({
    String? consultationId = '',
    String? reason = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    final ffApiRequestBody = '''
{
  "reason": "${reason}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'CancelConsultation',
        apiUrl: '${baseUrl}/consultation/cancel/${consultationId}',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class ConnectVideoCallCall {
  Future<ApiCallResponse> call({
    String? consultationId = '',
    String? participantName = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'ConnectVideoCall',
        apiUrl: '${baseUrl}/consultation/createLink',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'appointmentId': consultationId,
          'participant_name': participantName,
          'preset': "AMDHA_PARTICIPANT",
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class GetConsultationHistoryCall {
  Future<ApiCallResponse> call({
    String? doctorId = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetConsultationHistory',
        apiUrl: '${baseUrl}/consultation/casesheet',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'doctorId': doctorId,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class GetCaseSummeryCall {
  Future<ApiCallResponse> call({
    String? caseId = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'getCaseSummery',
        apiUrl: '${baseUrl}/consultation/casesheet/${caseId}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class GetAllConsultationHistoryCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetAllConsultationHistory',
        apiUrl: '${baseUrl}/consultation/history',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class GetDoctorListCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetDoctorList',
        apiUrl: '${baseUrl}/activity/api/auth/doctorList',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

class GetAvailableDatesCall {
  Future<ApiCallResponse> call({
    String? doctorId = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = ConnectionsGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetAvailableDates',
        apiUrl: '${baseUrl}/consultation/availableDates/${doctorId}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'doctor_id': doctorId,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ConnectionsGroup.interceptors,
    );
  }
}

/// End Connections Group Code

/// Start Task Group Code

class TaskGroup {
  static String getBaseUrl({
    String? userId = '',
    String? baseurl = '',
  }) =>
      '${baseurl}/activity/api/auth';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [user_id]',
  };
  static GetTaskCall getTaskCall = GetTaskCall();
  static SubmitQuestionsCall submitQuestionsCall = SubmitQuestionsCall();
  static SubmittaskCall submittaskCall = SubmittaskCall();
  static SymptomTrackerCall symptomTrackerCall = SymptomTrackerCall();
  static SubmitSymptomCall submitSymptomCall = SubmitSymptomCall();
  static SymptomSearchCall symptomSearchCall = SymptomSearchCall();
  static GetRecommendationCall getRecommendationCall = GetRecommendationCall();
  static SubmitMoodTrackerCall submitMoodTrackerCall = SubmitMoodTrackerCall();
  static SubmitAffirmationsCall submitAffirmationsCall =
      SubmitAffirmationsCall();

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class GetTaskCall {
  Future<ApiCallResponse> call({
    String? startDate = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetTask',
        apiUrl: '${baseUrl}/assignTask',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'startDate': startDate,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      TaskGroup.interceptors,
    );
  }
}

class SubmitQuestionsCall {
  Future<ApiCallResponse> call({
    String? taskId = '',
    dynamic questionnaireDataJson,
    String? questionnaireType = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    final questionnaireData = _serializeJson(questionnaireDataJson, true);
    final ffApiRequestBody = '''
{
  "task_id": "${taskId}",
  "responseData": ${questionnaireData},
  "questionnaireType": "${questionnaireType}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'submitQuestions',
        apiUrl: '${baseUrl}/questionnaire',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      TaskGroup.interceptors,
    );
  }
}

class SubmittaskCall {
  Future<ApiCallResponse> call({
    dynamic jsonJson,
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    final json = _serializeJson(jsonJson);
    final ffApiRequestBody = '''
${json}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Submittask',
        apiUrl: '${baseUrl}/assignTask',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      TaskGroup.interceptors,
    );
  }
}

class SymptomTrackerCall {
  Future<ApiCallResponse> call({
    String? category = '',
    String? severity = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SymptomTracker',
        apiUrl: '${baseUrl}/symptoms',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'category': category,
          'severity': severity,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      TaskGroup.interceptors,
    );
  }
}

class SubmitSymptomCall {
  Future<ApiCallResponse> call({
    dynamic jsonJson,
    String? category = '',
    String? taskId = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    final json = _serializeJson(jsonJson, true);
    final ffApiRequestBody = '''
{
  "symptoms": ${json},
  "category": "${category}",
  "task_id": "${taskId}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SubmitSymptom',
        apiUrl: '${baseUrl}/symptomEntry',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      TaskGroup.interceptors,
    );
  }
}

class SymptomSearchCall {
  Future<ApiCallResponse> call({
    String? query = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SymptomSearch',
        apiUrl: '${baseUrl}/symptomSearch',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'query': query,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      TaskGroup.interceptors,
    );
  }
}

class GetRecommendationCall {
  Future<ApiCallResponse> call({
    String? taskId = '',
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetRecommendation',
        apiUrl: '${baseUrl}/recommendation',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'taskId': taskId,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      TaskGroup.interceptors,
    );
  }
}

class SubmitMoodTrackerCall {
  Future<ApiCallResponse> call({
    dynamic dataJson,
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    final data = _serializeJson(dataJson);
    final ffApiRequestBody = '''
${data}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SubmitMoodTracker',
        apiUrl: '${baseUrl}/moodTracker',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      TaskGroup.interceptors,
    );
  }
}

class SubmitAffirmationsCall {
  Future<ApiCallResponse> call({
    String? uniqueId = '',
    dynamic answerJson,
    String? userId = '',
    String? baseurl = '',
  }) async {
    final baseUrl = TaskGroup.getBaseUrl(
      userId: userId,
      baseurl: baseurl,
    );

    final answer = _serializeJson(answerJson);
    final ffApiRequestBody = '''
{
  "uniqueIdentifier": "${escapeStringForJson(uniqueId)}",
  "answerConfig": [
    {
      "answer": ${answer}
    }
  ]
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'SubmitAffirmations',
        apiUrl: '${baseUrl}/affirmations',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      TaskGroup.interceptors,
    );
  }
}

/// End Task Group Code

/// Start Program Group Code

class ProgramGroup {
  static String getBaseUrl({
    String? baseurl = '',
    String? userId = '',
  }) =>
      '${baseurl}/activity/api/auth';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [user_id]',
  };
  static GetProgramCall getProgramCall = GetProgramCall();
  static GetEducationCall getEducationCall = GetEducationCall();

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class GetProgramCall {
  Future<ApiCallResponse> call({
    String? week = '',
    String? baseurl = '',
    String? userId = '',
  }) async {
    final baseUrl = ProgramGroup.getBaseUrl(
      baseurl: baseurl,
      userId: userId,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetProgram',
        apiUrl: '${baseUrl}/program',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'week': week,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProgramGroup.interceptors,
    );
  }
}

class GetEducationCall {
  Future<ApiCallResponse> call({
    String? lmp = '',
    int? week,
    String? baseurl = '',
    String? userId = '',
  }) async {
    final baseUrl = ProgramGroup.getBaseUrl(
      baseurl: baseurl,
      userId: userId,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetEducation',
        apiUrl: '${baseUrl}/education/program',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'lmp': lmp,
          'week': week,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ProgramGroup.interceptors,
    );
  }
}

/// End Program Group Code

class VitalsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'vitals',
        apiUrl: '${baseurl}/activity/api/auth/vitals',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class AddVitalsCall {
  static Future<ApiCallResponse> call({
    String? type = '',
    String? value = '',
    String? date = '',
    String? note = '',
    String? userId = '',
    dynamic objectJson,
    String? baseurl = '',
    String? taskId = '',
  }) async {
    final object = _serializeJson(objectJson);
    final ffApiRequestBody = '''
{
  "type": "${type}",
  "object": ${object},
  "date": "${date}",
  "time": "${date}",
  "note": "${note}",
  "value": "${value}",
  "entryType": "Manual",
  "internalId": "",
  "externalId": "",
  "task_id": "${taskId}"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'addVitals',
        apiUrl: '${baseurl}/activity/api/auth/vitals',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class FileUploadCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? reportType = '',
    String? description = '',
    String? userId = '',
    String? baseurl = '',
    String? taskId = '',
    String? documentType = '',
    String? date = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'fileUpload',
        apiUrl: '${baseurl}/activity/api/auth/reports',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'file': file,
          'description': description,
          'reportType': reportType,
          'externalId': "EXT_07",
          'task_id': taskId,
          'documentType': documentType,
          'upload_date': date,
        },

        bodyType: BodyType.MULTIPART,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class ListOfFilesCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'ListOfFiles',
        apiUrl: '${baseurl}/activity/api/auth/reports',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class GetAuthTokenCall {
  static Future<ApiCallResponse> call({
    String? code = '',
    String? tenant = '',
    String? baseurl = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAuthToken',
      apiUrl: '${baseurl}/ext/launch?code=${code}&tenant=${tenant}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VitalhistoryCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    String? baseurl = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'vitalhistory',
        apiUrl: '${baseurl}/activity/api/auth/vitals/history',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'type': type,
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class SetGoalCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    String? value = '',
    dynamic objectJson,
    String? baseurl = '',
  }) async {
    final object = _serializeJson(objectJson);
    final ffApiRequestBody = '''
{
  "vital_type": "${type}",
  "value": "${value}",
  "object": ${object}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'setGoal',
        apiUrl: '${baseurl}/activity/api/auth/target',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class UpdateVitalGoalCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? type = '',
    String? value = '',
    dynamic objectJson,
    String? baseurl = '',
  }) async {
    final object = _serializeJson(objectJson);
    final ffApiRequestBody = '''
{
  "vital_type": "${type}",
  "value": "${value}",
  "object": ${object}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'updateVitalGoal',
        apiUrl: '${baseurl}/activity/api/auth/target',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class GetGoalsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'getGoals',
        apiUrl: '${baseurl}/activity/api/auth/target',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class ExchangeTokenCall {
  static Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ExchangeToken',
      apiUrl: 'https://appdev.amdha.health/v1/refresh',
      callType: ApiCallType.GET,
      headers: {
        'refresh-token': '${refreshToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateVitalHistoryCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? id = '',
    String? date = '',
    String? entryType = '',
    String? note = '',
    String? value = '',
    String? type = '',
    String? time = '',
    dynamic objectJson,
    String? baseurl = '',
  }) async {
    final object = _serializeJson(objectJson);
    final ffApiRequestBody = '''
{
  "_id": "${id}",
  "reading": {
    "type": "${type}",
    "date": "${date}",
    "time": "${time}",
    "note": "${note}",
    "entryType": "${entryType}",
    "value": "${value}",
    "object": ${object}
  }
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'UpdateVitalHistory',
        apiUrl: '${baseurl}/activity/api/auth/vitals',
        callType: ApiCallType.PUT,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class GetDoctorsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? baseUrl = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetDoctors',
        apiUrl: '${baseUrl}/user',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'role': "doctor",
        },

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class DeleteAccountCall {
  static Future<ApiCallResponse> call({
    String? baseUrl = '',
    String? userId = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'DeleteAccount',
        apiUrl: '${baseUrl}/activity/api/auth/profile',
        callType: ApiCallType.DELETE,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: true,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class GetSettingsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? baseurl = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetSettings',
        apiUrl: '${baseurl}/activity/api/auth/organisationSettings',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${userId}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: true,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class SendFcmTokenCall {
  static Future<ApiCallResponse> call({
    String? fcmtoken = '',
    String? baseurl = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "fcmToken": "${fcmtoken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendFcmToken',
      apiUrl: '${baseurl}/activity/api/auth/token',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFcmTokenCall {
  static Future<ApiCallResponse> call({
    String? baseurl = '',
    String? authToken = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'DeleteFcmToken',
        apiUrl: '${baseurl}/activity/api/auth/token',
        callType: ApiCallType.DELETE,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: true,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    RefreshTokenInterceptor(),
  ];
}

class AddBGVitalCall {
  static Future<ApiCallResponse> call({
    String? baseurl = '',
    dynamic dataJson,
    String? userId = '',
  }) async {
    final data = _serializeJson(dataJson, true);
    final ffApiRequestBody = '''
{
  "readings": ${data}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addBGVital',
      apiUrl: '${baseurl}/activity/api/auth/vitals',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${userId}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VitalsLastsyncDateCall {
  static Future<ApiCallResponse> call({
    String? baseurl = '',
    String? data = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'vitalsLastsyncDate',
      apiUrl: '${baseurl}/activity/api/auth/vitals/healthDevice/data',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${userId}',
      },
      params: {
        'vital_list': data,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAmdhaConsentCall {
  static Future<ApiCallResponse> call({
    String? baseurl = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAmdhaConsent',
      apiUrl: '${baseurl}/activity/api/auth/consentFile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${userId}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VitalGraphCall {
  static Future<ApiCallResponse> call({
    String? baseurl = '',
    String? userId = '',
    String? type = '',
    String? filter = '',
    String? date = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'vitalGraph',
      apiUrl: '${baseurl}/activity/api/auth/vitals/history',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${userId}',
      },
      params: {
        'type': type,
        'filter': filter,
        'date': date,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RefreshTokenApiCall {
  static Future<ApiCallResponse> call({
    String? baseurl = '',
    String? refreshToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'RefreshTokenApi',
      apiUrl: '${baseurl}/v1/refresh',
      callType: ApiCallType.GET,
      headers: {
        'refresh-token': '${refreshToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
