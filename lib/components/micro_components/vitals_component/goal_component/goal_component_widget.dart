import '/components/micro_components/vitals_component/vital_card/vital_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'goal_component_model.dart';
export 'goal_component_model.dart';

class GoalComponentWidget extends StatefulWidget {
  const GoalComponentWidget({
    super.key,
    this.title,
  });

  final String? title;

  @override
  State<GoalComponentWidget> createState() => _GoalComponentWidgetState();
}

class _GoalComponentWidgetState extends State<GoalComponentWidget> {
  late GoalComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          valueOrDefault<String>(
            widget.title,
            'My Goal',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                wrapWithModel(
                  model: _model.vitalCardModel,
                  updateCallback: () => setState(() {}),
                  child: const VitalCardWidget(
                    vitalValue: 'ddd',
                    vitalUnit: 'dd',
                    vitalRange: 'ddd',
                  ),
                ),
              ].divide(const SizedBox(height: 10.0)),
            ),
          ),
        ),
      ],
    );
  }
}
