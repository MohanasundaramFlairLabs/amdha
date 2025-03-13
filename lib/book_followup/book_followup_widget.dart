import '/backend/schema/structs/index.dart';
import '/components/connections_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'book_followup_model.dart';
export 'book_followup_model.dart';

class BookFollowupWidget extends StatefulWidget {
  const BookFollowupWidget({
    super.key,
    this.doctor,
  });

  final DoctorModelStruct? doctor;

  static String routeName = 'BookFollowup';
  static String routePath = '/bookFollowup';

  @override
  State<BookFollowupWidget> createState() => _BookFollowupWidgetState();
}

class _BookFollowupWidgetState extends State<BookFollowupWidget> {
  late BookFollowupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookFollowupModel());

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
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            child: wrapWithModel(
              model: _model.connectionsComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: ConnectionsComponentWidget(
                isFromReschedule: false,
                isFromFollowUpOrTask: true,
                rescheduledoctor: widget.doctor,
                isFromTask: false,
                callbackNavbar: (isHide) async {},
                backCallback: () async {
                  logFirebaseEvent('BOOK_FOLLOWUP_Container_3o1f878x_CALLBAC');
                  context.safePop();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
