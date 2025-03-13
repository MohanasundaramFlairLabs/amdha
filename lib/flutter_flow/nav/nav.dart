import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/Logo.png',
                  fit: BoxFit.none,
                ),
              ),
            )
          : LaunchWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/Logo.png',
                      fit: BoxFit.none,
                    ),
                  ),
                )
              : LaunchWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(
            index: params.getParam(
              'index',
              ParamType.int,
            ),
            doScan: params.getParam(
              'doScan',
              ParamType.bool,
            ),
            isFromNotification: params.getParam(
              'isFromNotification',
              ParamType.bool,
            ),
            taskId: params.getParam(
              'taskId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AdditionalDetailsScreenWidget.routeName,
          path: AdditionalDetailsScreenWidget.routePath,
          builder: (context, params) => AdditionalDetailsScreenWidget(
            isUpdate: params.getParam(
              'isUpdate',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ConsentScreenWidget.routeName,
          path: ConsentScreenWidget.routePath,
          builder: (context, params) => ConsentScreenWidget(
            isFromMenu: params.getParam(
              'isFromMenu',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SubscriptionScreenWidget.routeName,
          path: SubscriptionScreenWidget.routePath,
          builder: (context, params) => SubscriptionScreenWidget(
            isFromPregnancyProgram: params.getParam(
              'isFromPregnancyProgram',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: FileUploadPageWidget.routeName,
          path: FileUploadPageWidget.routePath,
          builder: (context, params) => FileUploadPageWidget(),
        ),
        FFRoute(
          name: FaqPageWidget.routeName,
          path: FaqPageWidget.routePath,
          builder: (context, params) => FaqPageWidget(),
        ),
        FFRoute(
          name: JournalPageWidget.routeName,
          path: JournalPageWidget.routePath,
          builder: (context, params) => JournalPageWidget(
            question: params.getParam(
              'question',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ScanResultWidget.routeName,
          path: ScanResultWidget.routePath,
          builder: (context, params) => ScanResultWidget(),
        ),
        FFRoute(
          name: ScanHistoryWidget.routeName,
          path: ScanHistoryWidget.routePath,
          builder: (context, params) => ScanHistoryWidget(),
        ),
        FFRoute(
          name: SetgoalWidget.routeName,
          path: SetgoalWidget.routePath,
          builder: (context, params) => SetgoalWidget(
            vitalName: params.getParam(
              'vitalName',
              ParamType.String,
            ),
            isFromGoal: params.getParam(
              'isFromGoal',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: FreeScanPageWidget.routeName,
          path: FreeScanPageWidget.routePath,
          builder: (context, params) => FreeScanPageWidget(),
        ),
        FFRoute(
          name: LaunchWidget.routeName,
          path: LaunchWidget.routePath,
          builder: (context, params) => LaunchWidget(
            code: params.getParam(
              'code',
              ParamType.String,
            ),
            tenant: params.getParam(
              'tenant',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(
            loginurl: params.getParam(
              'loginurl',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: FreeScanLaunchPageWidget.routeName,
          path: FreeScanLaunchPageWidget.routePath,
          builder: (context, params) => FreeScanLaunchPageWidget(),
        ),
        FFRoute(
          name: CareplixWebviewWidget.routeName,
          path: CareplixWebviewWidget.routePath,
          builder: (context, params) => CareplixWebviewWidget(
            weight: params.getParam(
              'weight',
              ParamType.double,
            ),
            height: params.getParam(
              'height',
              ParamType.double,
            ),
            posture: params.getParam(
              'posture',
              ParamType.String,
            ),
            dob: params.getParam(
              'dob',
              ParamType.String,
            ),
            gender: params.getParam(
              'gender',
              ParamType.String,
            ),
            scanType: params.getParam(
              'scanType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EditMedicationWidget.routeName,
          path: EditMedicationWidget.routePath,
          builder: (context, params) => EditMedicationWidget(
            medication: params.getParam(
              'medication',
              ParamType.DataStruct,
              isList: false,
              structBuilder: MedicationModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: UpcomingConsultationPageWidget.routeName,
          path: UpcomingConsultationPageWidget.routePath,
          builder: (context, params) => UpcomingConsultationPageWidget(),
        ),
        FFRoute(
          name: EducationPageWidget.routeName,
          path: EducationPageWidget.routePath,
          builder: (context, params) => EducationPageWidget(),
        ),
        FFRoute(
          name: WebLoginWidget.routeName,
          path: WebLoginWidget.routePath,
          builder: (context, params) => WebLoginWidget(
            loginUrl: params.getParam(
              'loginUrl',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PromotionWidget.routeName,
          path: PromotionWidget.routePath,
          builder: (context, params) => PromotionWidget(),
        ),
        FFRoute(
          name: VideoCallWidget.routeName,
          path: VideoCallWidget.routePath,
          builder: (context, params) => VideoCallWidget(
            videoLink: params.getParam(
              'videoLink',
              ParamType.String,
            ),
            connectionsModel: params.getParam(
              'connectionsModel',
              ParamType.DataStruct,
              isList: false,
              structBuilder: ConnectionsModelStruct.fromSerializableMap,
            ),
            waitTime: params.getParam(
              'waitTime',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UserProfileWidget.routeName,
          path: UserProfileWidget.routePath,
          builder: (context, params) => UserProfileWidget(),
        ),
        FFRoute(
          name: OrganDonationWidget.routeName,
          path: OrganDonationWidget.routePath,
          builder: (context, params) => OrganDonationWidget(),
        ),
        FFRoute(
          name: JournalHomePageWidget.routeName,
          path: JournalHomePageWidget.routePath,
          builder: (context, params) => JournalHomePageWidget(),
        ),
        FFRoute(
          name: AllConsultationHistoryWidget.routeName,
          path: AllConsultationHistoryWidget.routePath,
          builder: (context, params) => AllConsultationHistoryWidget(),
        ),
        FFRoute(
          name: PPDetailedViewWidget.routeName,
          path: PPDetailedViewWidget.routePath,
          builder: (context, params) => PPDetailedViewWidget(
            program: params.getParam(
              'program',
              ParamType.DataStruct,
              isList: false,
              structBuilder: ProgramsStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: DetailedConsultationHistoryWidget.routeName,
          path: DetailedConsultationHistoryWidget.routePath,
          builder: (context, params) => DetailedConsultationHistoryWidget(
            data: params.getParam(
              'data',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HistoryModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: BookFollowupWidget.routeName,
          path: BookFollowupWidget.routePath,
          builder: (context, params) => BookFollowupWidget(
            doctor: params.getParam(
              'doctor',
              ParamType.DataStruct,
              isList: false,
              structBuilder: DoctorModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: SymptomTrackerWidget.routeName,
          path: SymptomTrackerWidget.routePath,
          builder: (context, params) => SymptomTrackerWidget(
            category: params.getParam(
              'category',
              ParamType.String,
            ),
            severity: params.getParam(
              'severity',
              ParamType.String,
            ),
            taskId: params.getParam(
              'taskId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PlanDetailsWidget.routeName,
          path: PlanDetailsWidget.routePath,
          builder: (context, params) => PlanDetailsWidget(),
        ),
        FFRoute(
          name: EducationPreviewWidget.routeName,
          path: EducationPreviewWidget.routePath,
          builder: (context, params) => EducationPreviewWidget(
            education: params.getParam(
              'education',
              ParamType.DataStruct,
              isList: false,
              structBuilder: ItemsStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: ExpiredPlansWidget.routeName,
          path: ExpiredPlansWidget.routePath,
          builder: (context, params) => ExpiredPlansWidget(
            subscription: params.getParam<SubscriptionsStruct>(
              'subscription',
              ParamType.DataStruct,
              isList: true,
              structBuilder: SubscriptionsStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: PdfPreviewPageWidget.routeName,
          path: PdfPreviewPageWidget.routePath,
          builder: (context, params) => PdfPreviewPageWidget(
            pdfuri: params.getParam(
              'pdfuri',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            isFromTask: params.getParam(
              'isFromTask',
              ParamType.bool,
            ),
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: SymptomTrackerLaunchPageWidget.routeName,
          path: SymptomTrackerLaunchPageWidget.routePath,
          builder: (context, params) => SymptomTrackerLaunchPageWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
            onlyRecommendation: params.getParam(
              'onlyRecommendation',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: OnboradingPageWidget.routeName,
          path: OnboradingPageWidget.routePath,
          builder: (context, params) => OnboradingPageWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: OnboardingQuestionarieWidget.routeName,
          path: OnboardingQuestionarieWidget.routePath,
          builder: (context, params) => OnboardingQuestionarieWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: OnboardingCompleteMessageWidget.routeName,
          path: OnboardingCompleteMessageWidget.routePath,
          builder: (context, params) => OnboardingCompleteMessageWidget(
            taskId: params.getParam(
              'taskId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RecommendationsWidget.routeName,
          path: RecommendationsWidget.routePath,
          builder: (context, params) => RecommendationsWidget(
            recommendations: params.getParam<RecommendationStruct>(
              'recommendations',
              ParamType.DataStruct,
              isList: true,
              structBuilder: RecommendationStruct.fromSerializableMap,
            ),
            recommendationType: params.getParam(
              'recommendationType',
              ParamType.String,
            ),
            taskId: params.getParam(
              'taskId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HeartAgeLaunchPageWidget.routeName,
          path: HeartAgeLaunchPageWidget.routePath,
          builder: (context, params) => HeartAgeLaunchPageWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: HeartAgeQuestionarieWidget.routeName,
          path: HeartAgeQuestionarieWidget.routePath,
          builder: (context, params) => HeartAgeQuestionarieWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: HeartAgeCompleteMessageWidget.routeName,
          path: HeartAgeCompleteMessageWidget.routePath,
          builder: (context, params) => HeartAgeCompleteMessageWidget(
            taskId: params.getParam(
              'taskId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: WHOLaunchPageWidget.routeName,
          path: WHOLaunchPageWidget.routePath,
          builder: (context, params) => WHOLaunchPageWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: WHOQuestionarieWidget.routeName,
          path: WHOQuestionarieWidget.routePath,
          builder: (context, params) => WHOQuestionarieWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: WHORecommendationsWidget.routeName,
          path: WHORecommendationsWidget.routePath,
          builder: (context, params) => WHORecommendationsWidget(
            score: params.getParam(
              'score',
              ParamType.String,
            ),
            recommendations: params.getParam<RecommendationStruct>(
              'recommendations',
              ParamType.DataStruct,
              isList: true,
              structBuilder: RecommendationStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: FRATLaunchPageWidget.routeName,
          path: FRATLaunchPageWidget.routePath,
          builder: (context, params) => FRATLaunchPageWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: FRATQuestionnarieWidget.routeName,
          path: FRATQuestionnarieWidget.routePath,
          builder: (context, params) => FRATQuestionnarieWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: FRATThankYouPageWidget.routeName,
          path: FRATThankYouPageWidget.routePath,
          builder: (context, params) => FRATThankYouPageWidget(
            taskId: params.getParam(
              'taskId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: FoodWelcomePageWidget.routeName,
          path: FoodWelcomePageWidget.routePath,
          builder: (context, params) => FoodWelcomePageWidget(),
        ),
        FFRoute(
          name: FoodTrackerPageWidget.routeName,
          path: FoodTrackerPageWidget.routePath,
          builder: (context, params) => FoodTrackerPageWidget(),
        ),
        FFRoute(
          name: ExerciseTrackerWelComePageWidget.routeName,
          path: ExerciseTrackerWelComePageWidget.routePath,
          builder: (context, params) => ExerciseTrackerWelComePageWidget(),
        ),
        FFRoute(
          name: AddExercisePageWidget.routeName,
          path: AddExercisePageWidget.routePath,
          builder: (context, params) => AddExercisePageWidget(
            setDate: params.getParam(
              'setDate',
              ParamType.String,
            ),
            vcxvfdv: params.getParam(
              'vcxvfdv',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ExercisePreviewPageWidget.routeName,
          path: ExercisePreviewPageWidget.routePath,
          builder: (context, params) => ExercisePreviewPageWidget(
            exerciseData: params.getParam<ExerciseDataStruct>(
              'exerciseData',
              ParamType.DataStruct,
              isList: true,
              structBuilder: ExerciseDataStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: PreviewMealPageWidget.routeName,
          path: PreviewMealPageWidget.routePath,
          builder: (context, params) => PreviewMealPageWidget(),
        ),
        FFRoute(
          name: VideoPreviewWidget.routeName,
          path: VideoPreviewWidget.routePath,
          builder: (context, params) => VideoPreviewWidget(
            uri: params.getParam(
              'uri',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: HealthConnectWidget.routeName,
          path: HealthConnectWidget.routePath,
          builder: (context, params) => HealthConnectWidget(),
        ),
        FFRoute(
          name: OCRResultPageWidget.routeName,
          path: OCRResultPageWidget.routePath,
          builder: (context, params) => OCRResultPageWidget(
            fileUrl: params.getParam(
              'fileUrl',
              ParamType.String,
            ),
            reportId: params.getParam(
              'reportId',
              ParamType.String,
            ),
            documentType: params.getParam(
              'documentType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DiabetesHistoryWidget.routeName,
          path: DiabetesHistoryWidget.routePath,
          builder: (context, params) => DiabetesHistoryWidget(),
        ),
        FFRoute(
          name: MoodTrackerLaunchWidget.routeName,
          path: MoodTrackerLaunchWidget.routePath,
          builder: (context, params) => MoodTrackerLaunchWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: AffirmationJournalLaunchWidget.routeName,
          path: AffirmationJournalLaunchWidget.routePath,
          builder: (context, params) => AffirmationJournalLaunchWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            subTitle: params.getParam(
              'subTitle',
              ParamType.String,
            ),
            secondaryTitle: params.getParam(
              'secondaryTitle',
              ParamType.String,
            ),
            listOfSuggetions: params.getParam<String>(
              'listOfSuggetions',
              ParamType.String,
              isList: true,
            ),
            buttonTitle: params.getParam(
              'buttonTitle',
              ParamType.String,
            ),
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: PositiveAffirmationAnimationWidget.routeName,
          path: PositiveAffirmationAnimationWidget.routePath,
          builder: (context, params) => PositiveAffirmationAnimationWidget(
            affirmations: params.getParam<String>(
              'affirmations',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: JournalQuestionPageWidget.routeName,
          path: JournalQuestionPageWidget.routePath,
          builder: (context, params) => JournalQuestionPageWidget(
            question: params.getParam(
              'question',
              ParamType.String,
            ),
            taskId: params.getParam(
              'taskId',
              ParamType.String,
            ),
            uniqueId: params.getParam(
              'uniqueId',
              ParamType.String,
            ),
            isFromTask: params.getParam(
              'isFromTask',
              ParamType.bool,
            ),
            taskType: params.getParam(
              'taskType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: OutroPageWidget.routeName,
          path: OutroPageWidget.routePath,
          builder: (context, params) => OutroPageWidget(
            header: params.getParam(
              'header',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            subTitle: params.getParam(
              'subTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AffirmationsWidget.routeName,
          path: AffirmationsWidget.routePath,
          builder: (context, params) => AffirmationsWidget(
            task: params.getParam(
              'task',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TasksStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: MealHistoryPageWidget.routeName,
          path: MealHistoryPageWidget.routePath,
          builder: (context, params) => MealHistoryPageWidget(),
        ),
        FFRoute(
          name: ExerciseHistoryPageWidget.routeName,
          path: ExerciseHistoryPageWidget.routePath,
          builder: (context, params) => ExerciseHistoryPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
