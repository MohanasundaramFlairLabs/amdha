import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'no_data_component_model.dart';
export 'no_data_component_model.dart';

class NoDataComponentWidget extends StatefulWidget {
  const NoDataComponentWidget({
    super.key,
    String? name,
    Color? backgroundColor,
    Color? textColor,
  })  : this.name = name ?? 'Data',
        this.backgroundColor = backgroundColor ?? Colors.white,
        this.textColor = textColor ?? const Color(0x995D6A85);

  final String name;
  final Color backgroundColor;
  final Color textColor;

  @override
  State<NoDataComponentWidget> createState() => _NoDataComponentWidgetState();
}

class _NoDataComponentWidgetState extends State<NoDataComponentWidget> {
  late NoDataComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataComponentModel());

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
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.asset(
              'assets/images/nohistory.png',
              width: 70.0,
              height: 70.0,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'No ${widget.name} found !',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: widget.textColor,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
