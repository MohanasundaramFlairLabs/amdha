import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/session_expired_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';

Future doSubscription(
  BuildContext context, {
  List<String>? parameterIds,
}) async {
  if (isAndroid || isiOS) {
    context.pushNamed(SubscriptionScreenWidget.routeName);
  } else {
    context.pushNamed(SubscriptionScreenWidget.routeName);
  }
}

Future clearallquery(BuildContext context) async {
  FFAppState().clearEducationFetchQueryCache();
  FFAppState().clearFetchVitalsListCache();
  FFAppState().clearFetchListFileQueryCache();
  FFAppState().clearFetchUpcomingMedicationCache();
  FFAppState().clearFetchJournalQueryCache();
  FFAppState().clearFetchVitlHistoryQueryCache();
}

Future sessionExpired(
  BuildContext context, {
  int? statusCode,
}) async {
  ApiCallResponse? clearToken;
  UrlsStruct? envresponse;

  if (statusCode == 401) {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.75,
            child: SessionExpiredWidget(),
          ),
        );
      },
    );

    clearToken = await DeleteFcmTokenCall.call(
      baseurl: FFAppState().baseUrl,
      authToken: FFAppState().userId,
    );

    FFAppState().refreshToken = '';
    FFAppState().userId = '';
    FFAppState().theme = ThemeConfigStruct(
      primaryColor: FlutterFlowTheme.of(context).primary,
      secondaryColor: FlutterFlowTheme.of(context).secondary,
    );
    await action_blocks.clearallquery(context);
    envresponse = await actions.getEnv();
    if (isiOS || isAndroid) {
      context.goNamed(
        LoginWidget.routeName,
        queryParameters: {
          'loginurl': serializeParam(
            envresponse.loginUrl,
            ParamType.String,
          ),
        }.withoutNulls,
      );
    } else {
      await actions.doLogOut();
    }
  }
}

Future performtask(BuildContext context) async {}
