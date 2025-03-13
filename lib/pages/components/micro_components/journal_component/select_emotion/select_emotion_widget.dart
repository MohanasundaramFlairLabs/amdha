import '';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_emotion_model.dart';
export 'select_emotion_model.dart';

class SelectEmotionWidget extends StatefulWidget {
  const SelectEmotionWidget({super.key});

  @override
  State<SelectEmotionWidget> createState() => _SelectEmotionWidgetState();
}

class _SelectEmotionWidgetState extends State<SelectEmotionWidget> {
  late SelectEmotionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectEmotionModel());

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
        color: FlutterFlowTheme.of(context).secondary,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: Color(0x265D6A85),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your Emotion',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
            Builder(
              builder: (context) {
                final option = FFAppConstants.emotionOptions.toList();

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(option.length, (optionIndex) {
                    final optionItem = option[optionIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'SELECT_EMOTION_Container_tno3l8ws_ON_TAP');
                        _model.selectedEmotion = optionItem;
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: () {
                            if ((_model.selectedEmotion == optionItem) &&
                                (optionItem == 'Happy')) {
                              return Color(0x27FFE500);
                            } else if ((_model.selectedEmotion == optionItem) &&
                                (optionItem == 'Sad')) {
                              return Color(0x2600DDB1);
                            } else if ((_model.selectedEmotion == optionItem) &&
                                (optionItem == 'Terrible')) {
                              return Color(0x25AED9E0);
                            } else if ((_model.selectedEmotion == optionItem) &&
                                (optionItem == 'Awesome')) {
                              return Color(0x26FB6D4D);
                            } else {
                              return FlutterFlowTheme.of(context).secondary;
                            }
                          }(),
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            color: () {
                              if ((_model.selectedEmotion == optionItem) &&
                                  (optionItem == 'Happy')) {
                                return Color(0xFFFFE500);
                              } else if ((_model.selectedEmotion ==
                                      optionItem) &&
                                  (optionItem == 'Sad')) {
                                return Color(0xFF00DDB1);
                              } else if ((_model.selectedEmotion ==
                                      optionItem) &&
                                  (optionItem == 'Terrible')) {
                                return Color(0xFFAED9E0);
                              } else if ((_model.selectedEmotion ==
                                      optionItem) &&
                                  (optionItem == 'Awesome')) {
                                return Color(0xFFFB6D4D);
                              } else {
                                return Color(0xFFDFDFDF);
                              }
                            }(),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (optionItem == 'Sad')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/sad.svg',
                                  width: 35.0,
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (optionItem == 'Terrible')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/terrible.svg',
                                  width: 35.0,
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (optionItem == 'Happy')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/happy.svg',
                                  width: 35.0,
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (optionItem == 'Awesome')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/awesome.svg',
                                  width: 35.0,
                                  height: 35.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            Text(
                              optionItem,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: () {
                                      if (optionItem == 'Happy') {
                                        return Color(0xFFFFE500);
                                      } else if (optionItem == 'Sad') {
                                        return Color(0xFF00DDB1);
                                      } else if (optionItem == 'Terrible') {
                                        return Color(0xFFAED9E0);
                                      } else {
                                        return Color(0xFFFB6D4D);
                                      }
                                    }(),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
