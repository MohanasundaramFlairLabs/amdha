import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start HOC Group Code

class HocGroup {
  static String getBaseUrl() =>
      'https://81f3-113-193-195-98.ngrok-free.app/activity';
  static Map<String, String> headers = {
    'Ngrok-Skip-Browser-Warning': 'true',
  };
  static MedicationCall medicationCall = MedicationCall();
  static HomeCall homeCall = HomeCall();
  static MoreCall moreCall = MoreCall();
  static EducationCall educationCall = EducationCall();
  static AddMedicationCall addMedicationCall = AddMedicationCall();
  static SearchMedicationCall searchMedicationCall = SearchMedicationCall();
}

class MedicationCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = HocGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'medication',
      apiUrl: '$baseUrl/medication',
      callType: ApiCallType.GET,
      headers: {
        'Ngrok-Skip-Browser-Warning': 'true',
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

class HomeCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = HocGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'home',
      apiUrl: '$baseUrl/home',
      callType: ApiCallType.GET,
      headers: {
        'Ngrok-Skip-Browser-Warning': 'true',
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

class MoreCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = HocGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'more',
      apiUrl: '$baseUrl/more',
      callType: ApiCallType.GET,
      headers: {
        'Ngrok-Skip-Browser-Warning': 'true',
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

class EducationCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = HocGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'education',
      apiUrl: '$baseUrl/education',
      callType: ApiCallType.GET,
      headers: {
        'Ngrok-Skip-Browser-Warning': 'true',
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

class AddMedicationCall {
  Future<ApiCallResponse> call({
    String? medicationName = '',
    String? dosage = '',
    String? unit = '',
    List<String>? frequencyList,
    String? often = '',
    String? startDate = '',
    String? endDate = '',
    String? period = '',
    String? additionalNote = '',
    bool? reminder,
  }) async {
    final baseUrl = HocGroup.getBaseUrl();
    final frequency = _serializeList(frequencyList);

    final ffApiRequestBody = '''
{
  "medication_name": "$medicationName",
  "dosage": "$dosage",
  "unit": "$unit",
  "frequency": [
    $frequency
  ],
  "often": "$often",
  "start_date": "$startDate",
  "period": "$period",
  "end_date": "$endDate",
  "additional_note": "$additionalNote",
  "reminder": $reminder
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addMedication',
      apiUrl: '$baseUrl/medication',
      callType: ApiCallType.POST,
      headers: {
        'Ngrok-Skip-Browser-Warning': 'true',
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

class SearchMedicationCall {
  Future<ApiCallResponse> call({
    String? search = '',
  }) async {
    final baseUrl = HocGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'searchMedication',
      apiUrl: '$baseUrl/medication/search',
      callType: ApiCallType.GET,
      headers: {
        'Ngrok-Skip-Browser-Warning': 'true',
      },
      params: {
        'medicine': search,
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

/// End HOC Group Code

/// Start MicroServices Group Code

class MicroServicesGroup {
  static String getBaseUrl() => 'http://192.168.10.41:3000';
  static Map<String, String> headers = {};
}

/// End MicroServices Group Code

class VitalsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'vitals',
      apiUrl: 'https://1aa4-113-193-195-98.ngrok-free.app/activity/vitals',
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

class AddVitalsCall {
  static Future<ApiCallResponse> call({
    String? type = '',
    String? value = '',
    String? lastModified = '',
    String? note = '',
  }) async {
    final ffApiRequestBody = '''
{
  "type": "$type",
  "value": "$value",
  "lastModified": "$lastModified",
  "note": "$note"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addVitals',
      apiUrl: 'https://1aa4-113-193-195-98.ngrok-free.app/activity/vitals',
      callType: ApiCallType.POST,
      headers: {},
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
