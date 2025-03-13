import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meal_history_page_model.dart';
export 'meal_history_page_model.dart';

class MealHistoryPageWidget extends StatefulWidget {
  const MealHistoryPageWidget({super.key});

  static String routeName = 'MealHistoryPage';
  static String routePath = '/mealHistoryPage';

  @override
  State<MealHistoryPageWidget> createState() => _MealHistoryPageWidgetState();
}

class _MealHistoryPageWidgetState extends State<MealHistoryPageWidget> {
  late MealHistoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MealHistoryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MEAL_HISTORY_MealHistoryPage_ON_INIT_STA');
      _model.apiResult7haCopy = await HocGroup.getFoodTrackerCall.call(
        userId: FFAppState().authToken,
        date: functions.convertDateTimetoDate(getCurrentTimestamp),
        range: _model.dropDownValue,
        baseurl: FFAppState().baseUrl,
      );

      if ((_model.apiResult7haCopy?.succeeded ?? true)) {
        _model.hasHistory = valueOrDefault<bool>(
          getJsonField(
                    (_model.apiResult7haCopy?.jsonBody ?? ''),
                    r'''$.data''',
                  ) !=
                  null
              ? true
              : false,
          false,
        );
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MEAL_HISTORY_Container_8il1jvaq_ON_TAP');
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                            FoodWelcomePageWidget.routeName);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.chevron_left,
                                            color: Color(0xFF242E49),
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Meal History',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Color(0xFF242E49),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'MEAL_HISTORY_Container_t8a2uhmk_ON_TAP');
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                          FoodWelcomePageWidget.routeName);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Icon(
                                        Icons.close_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 2.0,
                      thickness: 0.5,
                      color: Color(0xFFDFDFDF),
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue ??= 'week',
                                    ),
                                    options: List<String>.from(['week']),
                                    optionLabels: ['Last 1 week'],
                                    onChanged: (val) => safeSetState(
                                        () => _model.dropDownValue = val),
                                    width: 156.0,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Color(0xFF5D6A85),
                                    borderWidth: 0.5,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'MEAL_HISTORY_Text_c9o22gwp_ON_TAP');

                                      context.pushNamed(
                                          FoodTrackerPageWidget.routeName);
                                    },
                                    child: Text(
                                      'Add today\'s meal',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: valueOrDefault<Color>(
                                              FFAppState().theme.primaryColor,
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: FutureBuilder<ApiCallResponse>(
                                  future: HocGroup.getFoodTrackerCall.call(
                                    userId: FFAppState().authToken,
                                    baseurl: FFAppState().baseUrl,
                                    date: functions.convertDateTimetoDate(
                                        getCurrentTimestamp),
                                    range: _model.dropDownValue,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final columnGetFoodTrackerResponse =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        final foodList = getJsonField(
                                          columnGetFoodTrackerResponse.jsonBody,
                                          r'''$.data''',
                                        ).toList();
                                        if (foodList.isEmpty) {
                                          return Center(
                                            child: NoDataComponentWidget(
                                              name: 'meal history',
                                            ),
                                          );
                                        }

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children:
                                                List.generate(foodList.length,
                                                    (foodListIndex) {
                                              final foodListItem =
                                                  foodList[foodListIndex];
                                              return Padding(
                                                padding: EdgeInsets.all(1.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0x1D5D6A85),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(1.2),
                                                    child: Container(
                                                      width: double.infinity,
                                                      color: FFAppState()
                                                          .theme
                                                          .backgroudPrimaryColor,
                                                      child: ExpandableNotifier(
                                                        initialExpanded: false,
                                                        child: ExpandablePanel(
                                                          header: Container(
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FFAppState()
                                                                  .theme
                                                                  .backgroudPrimaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      "d MMMM y",
                                                                      functions
                                                                          .convertisotolocaldate(
                                                                              getJsonField(
                                                                        foodListItem,
                                                                        r'''$.date''',
                                                                      ).toString()),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleLargeFamily,
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '(${((FoodTrackerStruct.maybeFromMap(foodListItem)!.meals.elementAtOrNull(0)!.items.length > 0 ? 1 : 0) + (FoodTrackerStruct.maybeFromMap(foodListItem)!.meals.elementAtOrNull(1)!.items.length > 0 ? 1 : 0) + (FoodTrackerStruct.maybeFromMap(foodListItem)!.meals.elementAtOrNull(2)!.items.length > 0 ? 1 : 0) + (FoodTrackerStruct.maybeFromMap(foodListItem)!.meals.elementAtOrNull(3)!.items.length > 0 ? 1 : 0)).toString()}) meals recorded',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              Color(0xFF5D6A85),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          collapsed:
                                                              Container(),
                                                          expanded: Container(
                                                            constraints:
                                                                BoxConstraints(
                                                              maxHeight: 343.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final mealList =
                                                                    FoodTrackerStruct.maybeFromMap(foodListItem)
                                                                            ?.meals
                                                                            .toList() ??
                                                                        [];
                                                                if (mealList
                                                                    .isEmpty) {
                                                                  return Center(
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/nohistory.png',
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                    ),
                                                                  );
                                                                }

                                                                return SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        mealList
                                                                            .length,
                                                                        (mealListIndex) {
                                                                      final mealListItem =
                                                                          mealList[
                                                                              mealListIndex];
                                                                      return Visibility(
                                                                        visible:
                                                                            mealListItem.items.length >
                                                                                0,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              8.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Builder(
                                                                                          builder: (context) {
                                                                                            if ((mealListItem.mealType == 'Breakfast') || (mealListItem.mealType == 'Lunch')) {
                                                                                              return Builder(
                                                                                                builder: (context) {
                                                                                                  if (mealListItem.mealType == 'Breakfast') {
                                                                                                    return ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: SvgPicture.asset(
                                                                                                        'assets/images/24-Breakfast.svg',
                                                                                                        width: 24.0,
                                                                                                        height: 24.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    );
                                                                                                  } else {
                                                                                                    return ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: SvgPicture.asset(
                                                                                                        'assets/images/fi_2515271.svg',
                                                                                                        width: 24.0,
                                                                                                        height: 24.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                              );
                                                                                            } else {
                                                                                              return Builder(
                                                                                                builder: (context) {
                                                                                                  if (mealListItem.mealType == 'Snacks') {
                                                                                                    return ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: SvgPicture.asset(
                                                                                                        'assets/images/fi_1365540.svg',
                                                                                                        width: 24.0,
                                                                                                        height: 24.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    );
                                                                                                  } else {
                                                                                                    return ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: SvgPicture.asset(
                                                                                                        'assets/images/fi_4781223.svg',
                                                                                                        width: 24.0,
                                                                                                        height: 24.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                              );
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                        Text(
                                                                                          '${mealListItem.mealType} (${mealListItem.items.length.toString()})',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.access_time,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 15.0,
                                                                                        ),
                                                                                        Text(
                                                                                          mealListItem.mealTime != ''
                                                                                              ? dateTimeFormat(
                                                                                                  "hh : mm a",
                                                                                                  functions.convertMillisecondsToDateTime(mealListItem.mealTime),
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )
                                                                                              : 'hh : mm',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Nevermind',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey('Nevermind'),
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    final mealItems = mealListItem.items.toList();

                                                                                    return Wrap(
                                                                                      spacing: 8.0,
                                                                                      runSpacing: 8.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.horizontal,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: List.generate(mealItems.length, (mealItemsIndex) {
                                                                                        final mealItemsItem = mealItems[mealItemsIndex];
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                                border: Border.all(
                                                                                                  color: Color(0x2A5D6A85),
                                                                                                  width: 0.5,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Icon(
                                                                                                      FFIcons.kfood,
                                                                                                      color: Color(0x65242E49),
                                                                                                      size: 12.0,
                                                                                                    ),
                                                                                                    Text(
                                                                                                      mealItemsItem.foodItem,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      height: 15.0,
                                                                                                      child: VerticalDivider(
                                                                                                        thickness: 1.0,
                                                                                                        color: Color(0x29008080),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      '${mealItemsItem.portion} ${mealItemsItem.portionSize}',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      }),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Divider(
                                                                                  thickness: 1.0,
                                                                                  color: Color(0x2D5D6A85),
                                                                                ),
                                                                              ].divide(SizedBox(height: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          theme:
                                                              ExpandableThemeData(
                                                            tapHeaderToExpand:
                                                                true,
                                                            tapBodyToExpand:
                                                                false,
                                                            tapBodyToCollapse:
                                                                false,
                                                            headerAlignment:
                                                                ExpandablePanelHeaderAlignment
                                                                    .center,
                                                            hasIcon: true,
                                                            iconSize: 24.0,
                                                            iconPadding:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).divide(SizedBox(height: 8.0)),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.hasHistory)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: FFButtonWidget(
                        onPressed: !_model.hasHistory
                            ? null
                            : () async {
                                logFirebaseEvent(
                                    'MEAL_HISTORY_DOWNLOAD_AS_P_D_F_BTN_ON_TA');
                                await actions.getPdf(
                                  context,
                                  _model.dropDownValue == 'week'
                                      ? ((String baseurl, String date,
                                              String range) {
                                          return '$baseurl/activity/api/auth/foodTrackerPdf?date=${date}&range=${range}';
                                        }(
                                          FFAppState().baseUrl,
                                          functions.convertDateTimetoDate(
                                              getCurrentTimestamp),
                                          _model.dropDownValue!))
                                      : ((String baseurl) {
                                          return '$baseurl/activity/api/auth/foodTrackerPdf';
                                        }(FFAppState().baseUrl)),
                                  null,
                                  null,
                                  FFAppState().userId,
                                  'food',
                                  '0',
                                );
                              },
                        text: 'Download as PDF',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 42.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            FFAppState().theme.primaryColor,
                            FlutterFlowTheme.of(context).success,
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(4.0),
                          disabledColor: FFAppState().theme.primaryColor,
                          disabledTextColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
