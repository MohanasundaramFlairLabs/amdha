import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'consutation_history_card_model.dart';
export 'consutation_history_card_model.dart';

class ConsutationHistoryCardWidget extends StatefulWidget {
  const ConsutationHistoryCardWidget({
    super.key,
    this.data,
  });

  final HistoryModelStruct? data;

  @override
  State<ConsutationHistoryCardWidget> createState() =>
      _ConsutationHistoryCardWidgetState();
}

class _ConsutationHistoryCardWidgetState
    extends State<ConsutationHistoryCardWidget> {
  late ConsutationHistoryCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsutationHistoryCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Material(
              color: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: () {
                      if (widget.data?.status == 'Completed') {
                        return Color(0xFF2DC647);
                      } else if (widget.data?.status == 'Cancelled') {
                        return Color(0xFF949494);
                      } else {
                        return FlutterFlowTheme.of(context).primary;
                      }
                    }(),
                    width: 0.5,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE3F8FF),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  functions.stringToImage(widget
                                      .data?.doctorDetails.profileImageUri),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.35,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        widget.data?.doctorDetails.firstName,
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget
                                            .data?.doctorDetails.qualification,
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Color(0xFF767676),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.data?.startTime != null &&
                                              widget.data?.startTime != ''
                                          ? dateTimeFormat(
                                              "dd MMM y",
                                              functions.convertStringToDate(
                                                  widget.data!.startTime),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )
                                          : 'Offline',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: Color(0xFF767676),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    Text(
                                      widget.data?.startTime != null &&
                                              widget.data?.startTime != ''
                                          ? '${dateTimeFormat(
                                              "jm",
                                              functions.convertStringToDate(
                                                  widget.data!.startTime),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )} - ${dateTimeFormat(
                                              "jm",
                                              functions.convertStringToDate(
                                                  widget.data!.endTime),
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}'
                                          : '',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Reason',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          valueOrDefault<String>(
                                    widget.data?.status,
                                    '-',
                                  ) ==
                                  'Cancelled'
                              ? valueOrDefault<String>(
                                  widget.data?.domainData.cancellationReason,
                                  '-',
                                )
                              : widget.data?.domainData.reason,
                          '-',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: Color(0xFF767676),
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ]
                        .divide(SizedBox(height: 15.0))
                        .addToStart(SizedBox(height: 10.0)),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Container(
              decoration: BoxDecoration(
                color: () {
                  if (widget.data?.status == 'Completed') {
                    return Color(0xFFCAF0D1);
                  } else if (widget.data?.status == 'Cancelled') {
                    return Color(0xFFEEEEEE);
                  } else {
                    return FlutterFlowTheme.of(context).primary;
                  }
                }(),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(4.0),
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
                border: Border.all(
                  color: () {
                    if (widget.data?.status == 'Completed') {
                      return Color(0xFF2DC647);
                    } else if (widget.data?.status == 'Cancelled') {
                      return Color(0xFF949494);
                    } else {
                      return FlutterFlowTheme.of(context).primary;
                    }
                  }(),
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.data?.status,
                    '-',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: () {
                          if (widget.data?.status == 'Completed') {
                            return Color(0xFF2DC647);
                          } else if (widget.data?.status == 'Cancelled') {
                            return Color(0xFF949494);
                          } else {
                            return FlutterFlowTheme.of(context).primary;
                          }
                        }(),
                        fontSize: 8.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
