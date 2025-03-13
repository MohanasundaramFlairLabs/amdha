import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'emotion_card_model.dart';
export 'emotion_card_model.dart';

class EmotionCardWidget extends StatefulWidget {
  const EmotionCardWidget({
    super.key,
    this.borderColor,
    this.color,
    this.emotion,
  });

  final Color? borderColor;
  final Color? color;
  final String? emotion;

  @override
  State<EmotionCardWidget> createState() => _EmotionCardWidgetState();
}

class _EmotionCardWidgetState extends State<EmotionCardWidget> {
  late EmotionCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmotionCardModel());

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
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget.borderColor,
            FlutterFlowTheme.of(context).primary,
          ),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (widget.emotion == 'Awesome')
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: SvgPicture.asset(
                  'assets/images/awesome.svg',
                  width: 14.0,
                  height: 14.0,
                  fit: BoxFit.cover,
                ),
              ),
            if (widget.emotion == 'Sad')
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: SvgPicture.asset(
                  'assets/images/sad.svg',
                  width: 14.0,
                  height: 14.0,
                  fit: BoxFit.cover,
                ),
              ),
            if (widget.emotion == 'Terrible')
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: SvgPicture.asset(
                  'assets/images/terrible.svg',
                  width: 14.0,
                  height: 14.0,
                  fit: BoxFit.cover,
                ),
              ),
            if (widget.emotion == 'Happy')
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: SvgPicture.asset(
                  'assets/images/happy.svg',
                  width: 14.0,
                  height: 14.0,
                  fit: BoxFit.cover,
                ),
              ),
            Text(
              widget.emotion!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: widget.borderColor,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ].divide(SizedBox(width: 3.0)),
        ),
      ),
    );
  }
}
