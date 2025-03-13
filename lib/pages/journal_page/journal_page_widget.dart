import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/higher_order_components/journal_edit_component/journal_edit_component_widget.dart';
import 'package:flutter/material.dart';
import 'journal_page_model.dart';
export 'journal_page_model.dart';

class JournalPageWidget extends StatefulWidget {
  const JournalPageWidget({
    super.key,
    this.question,
  });

  final String? question;

  static String routeName = 'JournalPage';
  static String routePath = '/journalPage';

  @override
  State<JournalPageWidget> createState() => _JournalPageWidgetState();
}

class _JournalPageWidgetState extends State<JournalPageWidget> {
  late JournalPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalPageModel());

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
            model: _model.journalEditComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: JournalEditComponentWidget(
              question: widget.question,
            ),
          ),
        ),
      ),
    );
  }
}
