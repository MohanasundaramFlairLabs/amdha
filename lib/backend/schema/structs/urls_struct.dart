// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UrlsStruct extends BaseStruct {
  UrlsStruct({
    String? baseUrl,
    String? loginUrl,
    String? logoutUrl,
    String? razorpayKey,
  })  : _baseUrl = baseUrl,
        _loginUrl = loginUrl,
        _logoutUrl = logoutUrl,
        _razorpayKey = razorpayKey;

  // "baseUrl" field.
  String? _baseUrl;
  String get baseUrl => _baseUrl ?? '';
  set baseUrl(String? val) => _baseUrl = val;

  bool hasBaseUrl() => _baseUrl != null;

  // "loginUrl" field.
  String? _loginUrl;
  String get loginUrl => _loginUrl ?? '';
  set loginUrl(String? val) => _loginUrl = val;

  bool hasLoginUrl() => _loginUrl != null;

  // "logoutUrl" field.
  String? _logoutUrl;
  String get logoutUrl => _logoutUrl ?? '';
  set logoutUrl(String? val) => _logoutUrl = val;

  bool hasLogoutUrl() => _logoutUrl != null;

  // "razorpayKey" field.
  String? _razorpayKey;
  String get razorpayKey => _razorpayKey ?? '';
  set razorpayKey(String? val) => _razorpayKey = val;

  bool hasRazorpayKey() => _razorpayKey != null;

  static UrlsStruct fromMap(Map<String, dynamic> data) => UrlsStruct(
        baseUrl: data['baseUrl'] as String?,
        loginUrl: data['loginUrl'] as String?,
        logoutUrl: data['logoutUrl'] as String?,
        razorpayKey: data['razorpayKey'] as String?,
      );

  static UrlsStruct? maybeFromMap(dynamic data) =>
      data is Map ? UrlsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'baseUrl': _baseUrl,
        'loginUrl': _loginUrl,
        'logoutUrl': _logoutUrl,
        'razorpayKey': _razorpayKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'baseUrl': serializeParam(
          _baseUrl,
          ParamType.String,
        ),
        'loginUrl': serializeParam(
          _loginUrl,
          ParamType.String,
        ),
        'logoutUrl': serializeParam(
          _logoutUrl,
          ParamType.String,
        ),
        'razorpayKey': serializeParam(
          _razorpayKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static UrlsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UrlsStruct(
        baseUrl: deserializeParam(
          data['baseUrl'],
          ParamType.String,
          false,
        ),
        loginUrl: deserializeParam(
          data['loginUrl'],
          ParamType.String,
          false,
        ),
        logoutUrl: deserializeParam(
          data['logoutUrl'],
          ParamType.String,
          false,
        ),
        razorpayKey: deserializeParam(
          data['razorpayKey'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UrlsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UrlsStruct &&
        baseUrl == other.baseUrl &&
        loginUrl == other.loginUrl &&
        logoutUrl == other.logoutUrl &&
        razorpayKey == other.razorpayKey;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([baseUrl, loginUrl, logoutUrl, razorpayKey]);
}

UrlsStruct createUrlsStruct({
  String? baseUrl,
  String? loginUrl,
  String? logoutUrl,
  String? razorpayKey,
}) =>
    UrlsStruct(
      baseUrl: baseUrl,
      loginUrl: loginUrl,
      logoutUrl: logoutUrl,
      razorpayKey: razorpayKey,
    );
