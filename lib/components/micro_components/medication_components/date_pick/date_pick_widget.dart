import '/components/micro_components/form_components/date_selection/date_selection_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'date_pick_model.dart';
export 'date_pick_model.dart';

class DatePickWidget extends StatefulWidget {
  const DatePickWidget({
    super.key,
    this.fieldName,
    this.icon,
    String? initialDate,
  }) : initialDate = initialDate ?? ' ';

  final String? fieldName;
  final Widget? icon;
  final String initialDate;

  @override
  State<DatePickWidget> createState() => _DatePickWidgetState();
}

class _DatePickWidgetState extends State<DatePickWidget> {
  late DatePickModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatePickModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldName!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          wrapWithModel(
            model: _model.dateSelectionModel,
            updateCallback: () => setState(() {}),
            child: DateSelectionWidget(
              icon: widget.icon,
              initialDate: widget.initialDate,
            ),
          ),
        ].divide(const SizedBox(height: 10.0)),
      ),
    );
  }
}
