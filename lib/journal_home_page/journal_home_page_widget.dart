import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/journal_component/journal_component_widget.dart';
import 'package:flutter/material.dart';
import 'journal_home_page_model.dart';
export 'journal_home_page_model.dart';

class JournalHomePageWidget extends StatefulWidget {
  const JournalHomePageWidget({super.key});

  static String routeName = 'JournalHomePage';
  static String routePath = '/journalHomePage';

  @override
  State<JournalHomePageWidget> createState() => _JournalHomePageWidgetState();
}

class _JournalHomePageWidgetState extends State<JournalHomePageWidget> {
  late JournalHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalHomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: wrapWithModel(
            model: _model.journalComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: JournalComponentWidget(
              backAction: () async {
                logFirebaseEvent('JOURNAL_HOME_Container_qimmljo6_CALLBACK');
                context.safePop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
