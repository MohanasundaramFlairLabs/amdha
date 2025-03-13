import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/confirm_consent_popup_component_widget.dart';
import '/components/doctor_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/no_data_component/no_data_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'book_consultation_component_model.dart';
export 'book_consultation_component_model.dart';

class BookConsultationComponentWidget extends StatefulWidget {
  const BookConsultationComponentWidget({
    super.key,
    this.backCallback,
    this.bookCallback,
    required this.model,
    bool? consentStatus,
    bool? isReschedule,
    bool? isTask,
    bool? isFollowup,
  })  : this.consentStatus = consentStatus ?? false,
        this.isReschedule = isReschedule ?? false,
        this.isTask = isTask ?? false,
        this.isFollowup = isFollowup ?? false;

  final Future Function()? backCallback;
  final Future Function(SlotsStruct slot, bool consent,
      String? consultationType, String? reason)? bookCallback;
  final DoctorModelStruct? model;
  final bool consentStatus;
  final bool isReschedule;
  final bool isTask;
  final bool isFollowup;

  @override
  State<BookConsultationComponentWidget> createState() =>
      _BookConsultationComponentWidgetState();
}

class _BookConsultationComponentWidgetState
    extends State<BookConsultationComponentWidget> {
  late BookConsultationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookConsultationComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOOK_CONSULTATION_COMPONENT_BookConsulta');
      _model.isSlotFetched = false;
      _model.isApiSuccess = false;
      safeSetState(() {});
      _model.apiResultuo2 = await ConnectionsGroup.getAvailableDatesCall.call(
        doctorId: widget.model?.userId,
        userId: FFAppState().userId,
        baseurl: FFAppState().baseUrl,
      );

      if ((_model.apiResultuo2?.succeeded ?? true)) {
        _model.datesAvailable = (getJsonField(
          (_model.apiResultuo2?.jsonBody ?? ''),
          r'''$.availableDates''',
          true,
        ) as List)
            .map<String>((s) => s.toString())
            .toList()
            .toList()
            .cast<String>();
        _model.isApiSuccess = true;
        safeSetState(() {});
        _model.apiResulte0g = await ConnectionsGroup.getAvailabilityCall.call(
          startDate: functions.adjustDateTime(
              functions.convertStringToDate(_model.datesAvailable.firstOrNull!),
              'start'),
          endDate: functions.adjustDateTime(
              functions.convertStringToDate(_model.datesAvailable.firstOrNull!),
              'end'),
          doctorId: widget.model?.userId,
          userId: FFAppState().userId,
          baseurl: FFAppState().baseUrl,
        );

        if ((_model.apiResulte0g?.succeeded ?? true)) {
          _model.slotmodel = SlotModelStruct.maybeFromMap(
              (_model.apiResulte0g?.jsonBody ?? ''));
          _model.selectedSlot = null;
          _model.isSlotFetched = true;
          safeSetState(() {});
          safeSetState(() {
            _model.reasonTextController?.clear();
          });
        }
      } else {
        await action_blocks.sessionExpired(
          context,
          statusCode: (_model.apiResultuo2?.statusCode ?? 200),
        );
      }
    });

    _model.reasonTextController ??= TextEditingController();
    _model.reasonFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        if (_model.isApiSuccess) {
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 57.0,
                  decoration: BoxDecoration(),
                  child: Row(
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
                                'BOOK_CONSULTATION_COMPONENT_Container_vx');
                            await widget.backCallback?.call();
                            _model.selectedSlot = null;
                            _model.slotmodel = null;
                            _model.datesAvailable = [];
                            _model.isApiSuccess = false;
                            _model.isSlotFetched = false;
                            safeSetState(() {});
                          },
                          child: Container(
                            width: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Book Consultation',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.doctorCardModel,
                            updateCallback: () => safeSetState(() {}),
                            child: DoctorCardWidget(
                              doctorModel: widget.model,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Select consultation type',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??=
                                            widget.isFollowup
                                                ? 'Follow Up'
                                                : 'New Consultation',
                                      ),
                                      options: [
                                        'New Consultation',
                                        'Follow Up'
                                      ],
                                      onChanged: (val) => safeSetState(
                                          () => _model.dropDownValue = val),
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Color(0xFF5D6A85),
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      hintText: 'Select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 0.0,
                                      borderColor: Color(0x7E242E49),
                                      borderWidth: 1.0,
                                      borderRadius: 4.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      disabled: widget.isFollowup,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 10.0))
                                    .addToStart(SizedBox(height: 15.0)),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 5.0),
                              child: Text(
                                'Check Slots',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 300.0,
                            child: custom_widgets.CalanderWidget(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 300.0,
                              max: functions.convertStringToDate(
                                  _model.datesAvailable.lastOrNull!),
                              min: functions.convertStringToDate(
                                  _model.datesAvailable.firstOrNull!),
                              enabledDates: _model.datesAvailable,
                              selectedDate: (date) async {
                                logFirebaseEvent(
                                    'BOOK_CONSULTATION_COMPONENT_Container_3j');
                                _model.slotmodel = null;
                                _model.selectedSlot = null;
                                _model.isSlotFetched = false;
                                safeSetState(() {});
                                _model.slotResponse = await ConnectionsGroup
                                    .getAvailabilityCall
                                    .call(
                                  startDate:
                                      functions.adjustDateTime(date, 'start'),
                                  endDate:
                                      functions.adjustDateTime(date, 'end'),
                                  doctorId: widget.model?.userId,
                                  userId: FFAppState().userId,
                                  baseurl: FFAppState().baseUrl,
                                );

                                if ((_model.slotResponse?.succeeded ?? true)) {
                                  _model.slotmodel =
                                      SlotModelStruct.maybeFromMap(
                                          (_model.slotResponse?.jsonBody ??
                                              ''));
                                  _model.selectedSlot = null;
                                  _model.isSlotFetched = true;
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.reasonTextController?.clear();
                                  });
                                }

                                safeSetState(() {});
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 0.0, 10.0),
                              child: Text(
                                'Time Slots',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.isSlotFetched)
                                    Builder(
                                      builder: (context) {
                                        final slot = _model
                                                .slotmodel
                                                ?.availableSlots
                                                .firstOrNull
                                                ?.slots
                                                .where((e) =>
                                                    getCurrentTimestamp <
                                                    functions
                                                        .convertStringToDate(
                                                            e.start))
                                                .toList()
                                                .toList() ??
                                            [];
                                        if (slot.isEmpty) {
                                          return Container(
                                            height: 250.0,
                                            child: NoDataComponentWidget(
                                              name: 'Slots',
                                            ),
                                          );
                                        }

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            childAspectRatio: 3.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: slot.length,
                                          itemBuilder: (context, slotIndex) {
                                            final slotItem = slot[slotIndex];
                                            return Visibility(
                                              visible: getCurrentTimestamp <
                                                  functions.convertStringToDate(
                                                      slotItem.start),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'BOOK_CONSULTATION_COMPONENT_Container_3e');
                                                  if (slotItem.status ==
                                                      'available') {
                                                    _model.selectedSlot =
                                                        slotItem;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                child: Container(
                                                  height: 46.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (slotItem.start ==
                                                          _model.selectedSlot
                                                              ?.start) {
                                                        return valueOrDefault<
                                                            Color>(
                                                          FFAppState()
                                                              .theme
                                                              .primaryColor,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        );
                                                      } else if (slotItem
                                                              .status ==
                                                          'available') {
                                                        return valueOrDefault<
                                                            Color>(
                                                          FFAppState()
                                                              .theme
                                                              .backgroudPrimaryColor,
                                                          Color(0x1516A9E8),
                                                        );
                                                      } else {
                                                        return Color(
                                                            0x23636872);
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '${dateTimeFormat(
                                                          "h:mm",
                                                          functions
                                                              .convertStringToDate(
                                                                  slotItem
                                                                      .start),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )} - ${dateTimeFormat(
                                                          "h:mm a",
                                                          functions
                                                              .convertStringToDate(
                                                                  slotItem.end),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: () {
                                                                    if (slotItem
                                                                            .start ==
                                                                        _model
                                                                            .selectedSlot
                                                                            ?.start) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary;
                                                                    } else if (slotItem
                                                                            .status ==
                                                                        'booked') {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText;
                                                                    }
                                                                  }(),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      if (slotItem.status ==
                                                          'booked')
                                                        Text(
                                                          'Booked',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: () {
                                                                  if (slotItem
                                                                          .start ==
                                                                      _model
                                                                          .selectedSlot
                                                                          ?.start) {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary;
                                                                  } else if (slotItem
                                                                          .status ==
                                                                      'booked') {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary;
                                                                  } else {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText;
                                                                  }
                                                                }(),
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(height: 5.0)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  if (!_model.isSlotFetched)
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Fetching  Available Slots...',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.selectedSlot != null)
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 0.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Reason',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 10.0),
                              child: TextFormField(
                                controller: _model.reasonTextController,
                                focusNode: _model.reasonFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.reasonTextController',
                                  Duration(milliseconds: 0),
                                  () async {
                                    logFirebaseEvent(
                                        'BOOK_CONSULTATION_COMPONENT_Reason_ON_TE');
                                    if (functions.removeSpaces(
                                            _model.reasonTextController.text) !=
                                        ("")) {
                                      _model.reasonFilled = true;
                                      safeSetState(() {});
                                    } else {
                                      _model.reasonFilled = false;
                                      safeSetState(() {});
                                    }
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'eg: Fever',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x80242E49),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: valueOrDefault<Color>(
                                        FFAppState().theme.primaryColor,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model.reasonTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Builder(
                      builder: (context) => Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: ((_model.selectedSlot == null) ||
                                  !_model.reasonFilled)
                              ? null
                              : () async {
                                  logFirebaseEvent(
                                      'BOOK_CONSULTATION_COMPONENT_BOOK_CONSULT');
                                  _model.updateSelectedSlotStruct(
                                    (e) => e
                                      ..reason =
                                          _model.reasonTextController.text,
                                  );
                                  safeSetState(() {});
                                  if (widget.isReschedule) {
                                    await widget.bookCallback?.call(
                                      _model.selectedSlot!,
                                      false,
                                      _model.dropDownValue,
                                      _model.reasonTextController.text,
                                    );
                                    _model.slotmodel = null;
                                    _model.selectedSlot = null;
                                    _model.reasonFilled = false;
                                    safeSetState(() {});
                                  } else {
                                    if (widget.isTask) {
                                      await widget.bookCallback?.call(
                                        _model.selectedSlot!,
                                        false,
                                        _model.dropDownValue,
                                        _model.reasonTextController.text,
                                      );
                                      _model.slotmodel = null;
                                      _model.selectedSlot = null;
                                      _model.reasonFilled = false;
                                      safeSetState(() {});
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.75,
                                              child:
                                                  ConfirmConsentPopupComponentWidget(
                                                consentStatus:
                                                    widget.consentStatus,
                                                cancelCallback: () async {},
                                                acceptCallback:
                                                    (isConcentAccepted) async {
                                                  await widget.bookCallback
                                                      ?.call(
                                                    _model.selectedSlot!,
                                                    isConcentAccepted!,
                                                    _model.dropDownValue,
                                                    _model.reasonTextController
                                                        .text,
                                                  );
                                                  _model.slotmodel = null;
                                                  _model.selectedSlot = null;
                                                  _model.reasonFilled = false;
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  }
                                },
                          text: 'Book Consultation',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 42.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: valueOrDefault<Color>(
                              FFAppState().theme.primaryColor,
                              FlutterFlowTheme.of(context).primary,
                            ),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                            disabledColor: Color(0xFF7B808A),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                'Fetching Availability...',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          );
        }
      },
    );
  }
}
