import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'date_selection_model.dart';
export 'date_selection_model.dart';

class DateSelectionWidget extends StatefulWidget {
  const DateSelectionWidget({
    super.key,
    this.icon,
    String? initialDate,
  }) : initialDate = initialDate ?? ' ';

  final Widget? icon;
  final String initialDate;

  @override
  State<DateSelectionWidget> createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  late DateSelectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DateSelectionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        final datePickedDate = await showDatePicker(
          context: context,
          initialDate: getCurrentTimestamp,
          firstDate: DateTime(1900),
          lastDate: getCurrentTimestamp,
          builder: (context, child) {
            return wrapInMaterialDatePickerTheme(
              context,
              child!,
              headerBackgroundColor: FlutterFlowTheme.of(context).primary,
              headerForegroundColor: FlutterFlowTheme.of(context).info,
              headerTextStyle:
                  FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineLargeFamily,
                        fontSize: 32.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineLargeFamily),
                      ),
              pickerBackgroundColor:
                  FlutterFlowTheme.of(context).secondaryBackground,
              pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
              selectedDateTimeBackgroundColor:
                  FlutterFlowTheme.of(context).primary,
              selectedDateTimeForegroundColor:
                  FlutterFlowTheme.of(context).info,
              actionButtonForegroundColor:
                  FlutterFlowTheme.of(context).primaryText,
              iconSize: 24.0,
            );
          },
        );

        if (datePickedDate != null) {
          safeSetState(() {
            _model.datePicked = DateTime(
              datePickedDate.year,
              datePickedDate.month,
              datePickedDate.day,
            );
          });
        }
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryText,
            width: 1.0,
          ),
        ),
        alignment: const AlignmentDirectional(1.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  dateTimeFormat(
                    'y-M-d',
                    _model.datePicked,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  'Select Date',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            widget.icon!,
          ].addToStart(const SizedBox(width: 10.0)).addToEnd(const SizedBox(width: 10.0)),
        ),
      ),
    );
  }
}
