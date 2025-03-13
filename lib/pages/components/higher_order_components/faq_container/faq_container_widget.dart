import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/faq_component/faq_component/faq_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'faq_container_model.dart';
export 'faq_container_model.dart';

class FaqContainerWidget extends StatefulWidget {
  const FaqContainerWidget({super.key});

  @override
  State<FaqContainerWidget> createState() => _FaqContainerWidgetState();
}

class _FaqContainerWidgetState extends State<FaqContainerWidget> {
  late FaqContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaqContainerModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 56.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('FAQ_CONTAINER_Container_xgd3o787_ON_TAP');
                    context.safePop();
                  },
                  child: Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
                Text(
                  'Frequently asked questions',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0.0,
            thickness: 0.25,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(),
              child: Builder(
                builder: (context) {
                  final faq = FFAppState().settings.faq.toList();

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(faq.length, (faqIndex) {
                        final faqItem = faq[faqIndex];
                        return FaqComponentWidget(
                          key: Key('Keyn77_${faqIndex}_of_${faq.length}'),
                          question: faqItem.question,
                          answer: faqItem.answer,
                          liking: 'Was this helpful?',
                        );
                      }).addToEnd(SizedBox(height: 20.0)),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
