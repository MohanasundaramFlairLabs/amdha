import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_vitals_action_sheet_model.dart';
export 'add_vitals_action_sheet_model.dart';

class AddVitalsActionSheetWidget extends StatefulWidget {
  const AddVitalsActionSheetWidget({
    super.key,
    required this.callbackActionTwo,
    String? title1,
    String? title2,
    required this.callbackActionOne,
    this.isHideNavBar,
  })  : this.title1 = title1 ?? 'Add',
        this.title2 = title2 ?? 'Remove';

  final Future Function()? callbackActionTwo;
  final String title1;
  final String title2;
  final Future Function()? callbackActionOne;
  final Future Function(bool? isHideNavBar)? isHideNavBar;

  @override
  State<AddVitalsActionSheetWidget> createState() =>
      _AddVitalsActionSheetWidgetState();
}

class _AddVitalsActionSheetWidgetState
    extends State<AddVitalsActionSheetWidget> {
  late AddVitalsActionSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddVitalsActionSheetModel());

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
      width: double.infinity,
      height: 190.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 10.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Vitals',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nevermind',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nevermind'),
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'ADD_VITALS_ACTION_SHEET_close_ICN_ON_TAP');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('ADD_VITALS_ACTION_SHEET_Container_n5vfh8');
              Navigator.pop(context);
              await widget.callbackActionTwo?.call();
              await widget.isHideNavBar?.call(
                true,
              );
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FFIcons.kscanIcon,
                    color: valueOrDefault<Color>(
                      FFAppState().theme.primaryColor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    size: 35.0,
                  ),
                  Text(
                    widget.title2,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nevermind',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nevermind'),
                        ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('ADD_VITALS_ACTION_SHEET_Container_hbrodj');
              Navigator.pop(context);
              await widget.callbackActionOne?.call();
              await widget.isHideNavBar?.call(
                true,
              );
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: valueOrDefault<Color>(
                      FFAppState().theme.primaryColor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    size: 30.0,
                  ),
                  Text(
                    widget.title1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nevermind',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nevermind'),
                        ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
