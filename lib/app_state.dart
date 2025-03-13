import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _name = prefs.getString('ff_name') ?? _name;
    });
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _frequencyList = prefs
              .getStringList('ff_frequencyList')
              ?.map((x) {
                try {
                  return FrequencyStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _frequencyList;
    });
    _safeInit(() {
      _refreshToken = prefs.getString('ff_refreshToken') ?? _refreshToken;
    });
    _safeInit(() {
      _baseUrl = prefs.getString('ff_baseUrl') ?? _baseUrl;
    });
    _safeInit(() {
      _isFreeScanAvailable =
          prefs.getBool('ff_isFreeScanAvailable') ?? _isFreeScanAvailable;
    });
    _safeInit(() {
      _isSignOut = prefs.getBool('ff_isSignOut') ?? _isSignOut;
    });
    _safeInit(() {
      _FcmToken = prefs.getString('ff_FcmToken') ?? _FcmToken;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_theme')) {
        try {
          final serializedData = prefs.getString('ff_theme') ?? '{}';
          _theme =
              ThemeConfigStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _isGenx = prefs.getBool('ff_isGenx') ?? _isGenx;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userDetails')) {
        try {
          final serializedData = prefs.getString('ff_userDetails') ?? '{}';
          _userDetails = ProfileModelStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _healthToggle = prefs.getBool('ff_healthToggle') ?? _healthToggle;
    });
    _safeInit(() {
      _permissionsAsked =
          prefs.getBool('ff_permissionsAsked') ?? _permissionsAsked;
    });
    _safeInit(() {
      _healthPermissionCancelled =
          prefs.getBool('ff_healthPermissionCancelled') ??
              _healthPermissionCancelled;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _activityComponent = 'home';
  String get activityComponent => _activityComponent;
  set activityComponent(String value) {
    _activityComponent = value;
  }

  String _name = 'm';
  String get name => _name;
  set name(String value) {
    _name = value;
    prefs.setString('ff_name', value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
    prefs.setString('ff_userId', value);
  }

  String _subscriptionStatus = '';
  String get subscriptionStatus => _subscriptionStatus;
  set subscriptionStatus(String value) {
    _subscriptionStatus = value;
  }

  double _statusBarHeight = 0.0;
  double get statusBarHeight => _statusBarHeight;
  set statusBarHeight(double value) {
    _statusBarHeight = value;
  }

  double _navBarHeight = 0.0;
  double get navBarHeight => _navBarHeight;
  set navBarHeight(double value) {
    _navBarHeight = value;
  }

  List<FrequencyStruct> _frequencyList = [
    FrequencyStruct.fromSerializableMap(
        jsonDecode('{\"often\":\"Morning\",\"isSelected\":\"false\"}')),
    FrequencyStruct.fromSerializableMap(
        jsonDecode('{\"often\":\"Afternoon\",\"isSelected\":\"false\"}')),
    FrequencyStruct.fromSerializableMap(
        jsonDecode('{\"often\":\"Evening\",\"isSelected\":\"false\"}')),
    FrequencyStruct.fromSerializableMap(
        jsonDecode('{\"often\":\"Night\",\"isSelected\":\"false\"}')),
    FrequencyStruct.fromSerializableMap(
        jsonDecode('{\"often\":\"SOS\",\"isSelected\":\"false\"}'))
  ];
  List<FrequencyStruct> get frequencyList => _frequencyList;
  set frequencyList(List<FrequencyStruct> value) {
    _frequencyList = value;
    prefs.setStringList(
        'ff_frequencyList', value.map((x) => x.serialize()).toList());
  }

  void addToFrequencyList(FrequencyStruct value) {
    frequencyList.add(value);
    prefs.setStringList(
        'ff_frequencyList', _frequencyList.map((x) => x.serialize()).toList());
  }

  void removeFromFrequencyList(FrequencyStruct value) {
    frequencyList.remove(value);
    prefs.setStringList(
        'ff_frequencyList', _frequencyList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFrequencyList(int index) {
    frequencyList.removeAt(index);
    prefs.setStringList(
        'ff_frequencyList', _frequencyList.map((x) => x.serialize()).toList());
  }

  void updateFrequencyListAtIndex(
    int index,
    FrequencyStruct Function(FrequencyStruct) updateFn,
  ) {
    frequencyList[index] = updateFn(_frequencyList[index]);
    prefs.setStringList(
        'ff_frequencyList', _frequencyList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFrequencyList(int index, FrequencyStruct value) {
    frequencyList.insert(index, value);
    prefs.setStringList(
        'ff_frequencyList', _frequencyList.map((x) => x.serialize()).toList());
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
  }

  List<FaqStruct> _FaqQuestion = [
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What features does the app offer? \",\"answer\":\"Currently, AMDHA lets its users track their vital parameters, manage their medications, maintain a Gratitude Journal, upload health related Files and Documents and access health information. \"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What is the purpose of the Files and Documents feature? \",\"answer\":\"The Files and Documents can be used to upload and store all your medical documents in one place for ease of access at any time! \"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What is the purpose of the Medications feature? \",\"answer\":\"The Medications features can be used to keep track of all your medications and set medication reminders so that you don’t forget to take them on time. \"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What is the purpose of the Gratitude Journal?\",\"answer\":\"A gratitude journal helps cultivate a positive mindset by focusing on things you are thankful for. It enhances emotional well-being, reduces stress, improves sleep, strengthens relationships, boosts self-esteem, and encourages mindfulness. \"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How to use the app to scan my vitals? \",\"answer\":\"For Finger Scan \\r\\n\\r\\n> On your dashboard click on the “+” button at the bottom right and select “Scan Vitals” \\r\\n\\r\\n> Select “Finger Scan’ as the scan type and then select your posture and click on ‘Scan”. \\r\\n\\r\\n> Place your finger on the back camera and make sure you cover the entire camera carefully. \\r\\n\\r\\n > During the ‘Calibration in progress’, page make sure that your finger is placed properly such that the screen turns red. \\r\\n\\r\\n > Once calibration is completed, hold the position for 40 seconds to determine your body vitals. \\r\\n\\r\\n **For better results, if the flash is not turned on automatically, make sure that you have a light source behind your back camera. \\r\\n\\r\\n \\r\\n\\r\\nFor Face Scan \\r\\n\\r\\n> On your dashboard click on the “+” button at the bottom right and select “Scan Vitals”.\\n\\n> Select “Face Scan’ as the scan type and then select your posture and click on ‘Scan”. \\r\\n\\r\\n> Align your Face properly with the outline  \\r\\n\\r\\n> During the ‘Calibration in progress’, page make sure that your face is placed inside the circle, and the visible ‘blue patch’ on your screen should be placed under your eyes. \\r\\n\\r\\n> Once calibration is completed, hold the position for 40 seconds to determine your body vitals. \\r\\n\\r\\n **For better results, the surrounding light should be bright and consistent. \"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"How do I enter my health data? \",\"answer\":\"You can choose to enter your health data manually into the app too! \\r\\n\\r\\n> On your dashboard click on the “+” button at the bottom right and select “Add Vitals” \\r\\n\\r\\n> Select the parameter you choose to add manually, for example; Vitals. \\r\\n\\r\\n> Once you choose the parameters you can select the type of value you want to add. \\r\\n\\r\\n> After entering all the relevant details click on “Add” to save the data or “Cancel” to choose another parameter.\"}')),
    FaqStruct.fromSerializableMap(jsonDecode(
        '{\"question\":\"What should I do if the app is not functioning or runs into issues? \",\"answer\":\"In case of any questions or concerns contact or write to info@alphamd.com\"}'))
  ];
  List<FaqStruct> get FaqQuestion => _FaqQuestion;
  set FaqQuestion(List<FaqStruct> value) {
    _FaqQuestion = value;
  }

  void addToFaqQuestion(FaqStruct value) {
    FaqQuestion.add(value);
  }

  void removeFromFaqQuestion(FaqStruct value) {
    FaqQuestion.remove(value);
  }

  void removeAtIndexFromFaqQuestion(int index) {
    FaqQuestion.removeAt(index);
  }

  void updateFaqQuestionAtIndex(
    int index,
    FaqStruct Function(FaqStruct) updateFn,
  ) {
    FaqQuestion[index] = updateFn(_FaqQuestion[index]);
  }

  void insertAtIndexInFaqQuestion(int index, FaqStruct value) {
    FaqQuestion.insert(index, value);
  }

  bool _FetchVitalsOverride = false;
  bool get FetchVitalsOverride => _FetchVitalsOverride;
  set FetchVitalsOverride(bool value) {
    _FetchVitalsOverride = value;
  }

  bool _refresh = true;
  bool get refresh => _refresh;
  set refresh(bool value) {
    _refresh = value;
  }

  int _authTokenExpiry = 0;
  int get authTokenExpiry => _authTokenExpiry;
  set authTokenExpiry(int value) {
    _authTokenExpiry = value;
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String value) {
    _refreshToken = value;
    prefs.setString('ff_refreshToken', value);
  }

  String _baseUrl = '';
  String get baseUrl => _baseUrl;
  set baseUrl(String value) {
    _baseUrl = value;
    prefs.setString('ff_baseUrl', value);
  }

  List<WelcomePageStruct> _ListOfFeature = [
    WelcomePageStruct.fromSerializableMap(jsonDecode(
        '{\"feature\":\"Quick Scan\",\"detail\":\"A face scan analyzes your features to measure key health indicator.\"}')),
    WelcomePageStruct.fromSerializableMap(jsonDecode(
        '{\"feature\":\"Health Insight\",\"detail\":\"Get an overall health insights from the face scan\"}')),
    WelcomePageStruct.fromSerializableMap(jsonDecode(
        '{\"feature\":\"Set Goals\",\"detail\":\"Use the results from your health insights to set health goals.\"}')),
    WelcomePageStruct.fromSerializableMap(jsonDecode(
        '{\"feature\":\"Daily medication reminders\",\"detail\":\"Get timely medication reminders right from your phone.\"}')),
    WelcomePageStruct.fromSerializableMap(jsonDecode(
        '{\"feature\":\"Store your Medical Records\",\"detail\":\"Store and access your health records at the touch of a button.\"}'))
  ];
  List<WelcomePageStruct> get ListOfFeature => _ListOfFeature;
  set ListOfFeature(List<WelcomePageStruct> value) {
    _ListOfFeature = value;
  }

  void addToListOfFeature(WelcomePageStruct value) {
    ListOfFeature.add(value);
  }

  void removeFromListOfFeature(WelcomePageStruct value) {
    ListOfFeature.remove(value);
  }

  void removeAtIndexFromListOfFeature(int index) {
    ListOfFeature.removeAt(index);
  }

  void updateListOfFeatureAtIndex(
    int index,
    WelcomePageStruct Function(WelcomePageStruct) updateFn,
  ) {
    ListOfFeature[index] = updateFn(_ListOfFeature[index]);
  }

  void insertAtIndexInListOfFeature(int index, WelcomePageStruct value) {
    ListOfFeature.insert(index, value);
  }

  bool _isFreeScanAvailable = false;
  bool get isFreeScanAvailable => _isFreeScanAvailable;
  set isFreeScanAvailable(bool value) {
    _isFreeScanAvailable = value;
    prefs.setBool('ff_isFreeScanAvailable', value);
  }

  List<dynamic> _surveyquestionalry = [
    jsonDecode(
        '{\"question\":\"How often do you experience headaches?\",\"options\":[\"Rarely\",\"Occasionally\",\"Frequently\",\"Almost daily\"]}'),
    jsonDecode(
        '{\"question\":\"Do you have any known allergies?\",\"options\":[\"Yes, food allergies\",\"Yes, medication allergies\",\"Yes, environmental allergies\",\"No known allergies\"]}'),
    jsonDecode(
        '{\"question\":\"On a scale of 1 to 10, how would you rate your current pain level?\",\"options\":[\"1-2 (Mild)\",\"3-4 (Moderate)\",\"5-6 (Severe)\",\"7-10 (Very severe)\"]}'),
    jsonDecode(
        '{\"question\":\"Have you experienced any of the following symptoms in the past week?\",\"options\":[\"Fever\",\"Cough\",\"Shortness of breath\",\"None of the above\"]}')
  ];
  List<dynamic> get surveyquestionalry => _surveyquestionalry;
  set surveyquestionalry(List<dynamic> value) {
    _surveyquestionalry = value;
  }

  void addToSurveyquestionalry(dynamic value) {
    surveyquestionalry.add(value);
  }

  void removeFromSurveyquestionalry(dynamic value) {
    surveyquestionalry.remove(value);
  }

  void removeAtIndexFromSurveyquestionalry(int index) {
    surveyquestionalry.removeAt(index);
  }

  void updateSurveyquestionalryAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    surveyquestionalry[index] = updateFn(_surveyquestionalry[index]);
  }

  void insertAtIndexInSurveyquestionalry(int index, dynamic value) {
    surveyquestionalry.insert(index, value);
  }

  bool _isSignOut = false;
  bool get isSignOut => _isSignOut;
  set isSignOut(bool value) {
    _isSignOut = value;
    prefs.setBool('ff_isSignOut', value);
  }

  List<String> _planIds = [];
  List<String> get planIds => _planIds;
  set planIds(List<String> value) {
    _planIds = value;
  }

  void addToPlanIds(String value) {
    planIds.add(value);
  }

  void removeFromPlanIds(String value) {
    planIds.remove(value);
  }

  void removeAtIndexFromPlanIds(int index) {
    planIds.removeAt(index);
  }

  void updatePlanIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    planIds[index] = updateFn(_planIds[index]);
  }

  void insertAtIndexInPlanIds(int index, String value) {
    planIds.insert(index, value);
  }

  String _FcmToken = '';
  String get FcmToken => _FcmToken;
  set FcmToken(String value) {
    _FcmToken = value;
    prefs.setString('ff_FcmToken', value);
  }

  ThemeConfigStruct _theme = ThemeConfigStruct();
  ThemeConfigStruct get theme => _theme;
  set theme(ThemeConfigStruct value) {
    _theme = value;
    prefs.setString('ff_theme', value.serialize());
  }

  void updateThemeStruct(Function(ThemeConfigStruct) updateFn) {
    updateFn(_theme);
    prefs.setString('ff_theme', _theme.serialize());
  }

  bool _isGenx = false;
  bool get isGenx => _isGenx;
  set isGenx(bool value) {
    _isGenx = value;
    prefs.setBool('ff_isGenx', value);
  }

  SettingsStruct _settings = SettingsStruct();
  SettingsStruct get settings => _settings;
  set settings(SettingsStruct value) {
    _settings = value;
  }

  void updateSettingsStruct(Function(SettingsStruct) updateFn) {
    updateFn(_settings);
  }

  QuotaModelStruct _quotas = QuotaModelStruct();
  QuotaModelStruct get quotas => _quotas;
  set quotas(QuotaModelStruct value) {
    _quotas = value;
  }

  void updateQuotasStruct(Function(QuotaModelStruct) updateFn) {
    updateFn(_quotas);
  }

  ProfileModelStruct _userDetails = ProfileModelStruct();
  ProfileModelStruct get userDetails => _userDetails;
  set userDetails(ProfileModelStruct value) {
    _userDetails = value;
    prefs.setString('ff_userDetails', value.serialize());
  }

  void updateUserDetailsStruct(Function(ProfileModelStruct) updateFn) {
    updateFn(_userDetails);
    prefs.setString('ff_userDetails', _userDetails.serialize());
  }

  List<SubscriptionsStruct> _subscriptions = [];
  List<SubscriptionsStruct> get subscriptions => _subscriptions;
  set subscriptions(List<SubscriptionsStruct> value) {
    _subscriptions = value;
  }

  void addToSubscriptions(SubscriptionsStruct value) {
    subscriptions.add(value);
  }

  void removeFromSubscriptions(SubscriptionsStruct value) {
    subscriptions.remove(value);
  }

  void removeAtIndexFromSubscriptions(int index) {
    subscriptions.removeAt(index);
  }

  void updateSubscriptionsAtIndex(
    int index,
    SubscriptionsStruct Function(SubscriptionsStruct) updateFn,
  ) {
    subscriptions[index] = updateFn(_subscriptions[index]);
  }

  void insertAtIndexInSubscriptions(int index, SubscriptionsStruct value) {
    subscriptions.insert(index, value);
  }

  List<ExerciseDataStruct> _exerciseList = [];
  List<ExerciseDataStruct> get exerciseList => _exerciseList;
  set exerciseList(List<ExerciseDataStruct> value) {
    _exerciseList = value;
  }

  void addToExerciseList(ExerciseDataStruct value) {
    exerciseList.add(value);
  }

  void removeFromExerciseList(ExerciseDataStruct value) {
    exerciseList.remove(value);
  }

  void removeAtIndexFromExerciseList(int index) {
    exerciseList.removeAt(index);
  }

  void updateExerciseListAtIndex(
    int index,
    ExerciseDataStruct Function(ExerciseDataStruct) updateFn,
  ) {
    exerciseList[index] = updateFn(_exerciseList[index]);
  }

  void insertAtIndexInExerciseList(int index, ExerciseDataStruct value) {
    exerciseList.insert(index, value);
  }

  DateTime? _lastFoodFetchDate;
  DateTime? get lastFoodFetchDate => _lastFoodFetchDate;
  set lastFoodFetchDate(DateTime? value) {
    _lastFoodFetchDate = value;
  }

  DateTime? _lastExerciseFetchDate;
  DateTime? get lastExerciseFetchDate => _lastExerciseFetchDate;
  set lastExerciseFetchDate(DateTime? value) {
    _lastExerciseFetchDate = value;
  }

  FoodTrackerStruct _mealList = FoodTrackerStruct.fromSerializableMap(jsonDecode(
      '{\"meals\":\"[\\\"{\\\\\\\"mealType\\\\\\\":\\\\\\\"Breakfast\\\\\\\",\\\\\\\"mealTime\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"items\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\",\\\"{\\\\\\\"mealType\\\\\\\":\\\\\\\"Lunch\\\\\\\",\\\\\\\"mealTime\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"items\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\",\\\"{\\\\\\\"mealType\\\\\\\":\\\\\\\"Snacks\\\\\\\",\\\\\\\"mealTime\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"items\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\",\\\"{\\\\\\\"mealType\\\\\\\":\\\\\\\"Dinner\\\\\\\",\\\\\\\"mealTime\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"items\\\\\\\":\\\\\\\"[]\\\\\\\"}\\\"]\"}'));
  FoodTrackerStruct get mealList => _mealList;
  set mealList(FoodTrackerStruct value) {
    _mealList = value;
  }

  void updateMealListStruct(Function(FoodTrackerStruct) updateFn) {
    updateFn(_mealList);
  }

  bool _healthToggle = false;
  bool get healthToggle => _healthToggle;
  set healthToggle(bool value) {
    _healthToggle = value;
    prefs.setBool('ff_healthToggle', value);
  }

  bool _permissionsAsked = false;
  bool get permissionsAsked => _permissionsAsked;
  set permissionsAsked(bool value) {
    _permissionsAsked = value;
    prefs.setBool('ff_permissionsAsked', value);
  }

  bool _healthPermissionCancelled = false;
  bool get healthPermissionCancelled => _healthPermissionCancelled;
  set healthPermissionCancelled(bool value) {
    _healthPermissionCancelled = value;
    prefs.setBool('ff_healthPermissionCancelled', value);
  }

  /// Is used to refresh the graph component after a vital is deleted from
  /// delete pop up.
  ///
  /// As it is not deleted with page reload
  bool _refreshGraph = false;
  bool get refreshGraph => _refreshGraph;
  set refreshGraph(bool value) {
    _refreshGraph = value;
  }

  final _fetchVitalsListManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> fetchVitalsList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _fetchVitalsListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchVitalsListCache() => _fetchVitalsListManager.clear();
  void clearFetchVitalsListCacheKey(String? uniqueKey) =>
      _fetchVitalsListManager.clearRequest(uniqueKey);

  final _fetchUpcomingMedicationManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> fetchUpcomingMedication({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _fetchUpcomingMedicationManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchUpcomingMedicationCache() =>
      _fetchUpcomingMedicationManager.clear();
  void clearFetchUpcomingMedicationCacheKey(String? uniqueKey) =>
      _fetchUpcomingMedicationManager.clearRequest(uniqueKey);

  final _fetchVitlHistoryQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> fetchVitlHistoryQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _fetchVitlHistoryQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchVitlHistoryQueryCache() =>
      _fetchVitlHistoryQueryManager.clear();
  void clearFetchVitlHistoryQueryCacheKey(String? uniqueKey) =>
      _fetchVitlHistoryQueryManager.clearRequest(uniqueKey);

  final _fetchJournalQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> fetchJournalQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _fetchJournalQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchJournalQueryCache() => _fetchJournalQueryManager.clear();
  void clearFetchJournalQueryCacheKey(String? uniqueKey) =>
      _fetchJournalQueryManager.clearRequest(uniqueKey);

  final _fetchListFileQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> fetchListFileQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _fetchListFileQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchListFileQueryCache() => _fetchListFileQueryManager.clear();
  void clearFetchListFileQueryCacheKey(String? uniqueKey) =>
      _fetchListFileQueryManager.clearRequest(uniqueKey);

  final _educationFetchQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> educationFetchQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _educationFetchQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEducationFetchQueryCache() => _educationFetchQueryManager.clear();
  void clearEducationFetchQueryCacheKey(String? uniqueKey) =>
      _educationFetchQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
