import '/components/micro_components/medication_components/date_pick/date_pick_widget.dart';
import '/components/micro_components/medication_components/drop_down_field/drop_down_field_widget.dart';
import '/components/micro_components/medication_components/single_form/single_form_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'additional_details_screen_model.dart';
export 'additional_details_screen_model.dart';

class AdditionalDetailsScreenWidget extends StatefulWidget {
  const AdditionalDetailsScreenWidget({super.key});

  @override
  State<AdditionalDetailsScreenWidget> createState() =>
      _AdditionalDetailsScreenWidgetState();
}

class _AdditionalDetailsScreenWidgetState
    extends State<AdditionalDetailsScreenWidget> {
  late AdditionalDetailsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdditionalDetailsScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Additional data',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
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
                Container(
                  height: 24.0,
                  decoration: const BoxDecoration(
                    color: Color(0x2724C850),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.shieldAlt,
                        color: Color(0xFF24C850),
                        size: 16.0,
                      ),
                      Text(
                        'Your data is always safe with us',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ]
                        .divide(const SizedBox(width: 5.0))
                        .addToStart(const SizedBox(width: 15.0))
                        .addToEnd(const SizedBox(width: 15.0)),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 54.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Before using the app, please input the required data below.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.datePickModel,
                        updateCallback: () => setState(() {}),
                        child: DatePickWidget(
                          fieldName: 'Date of birth',
                          icon: Icon(
                            Icons.calendar_today,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.singleFormModel1,
                        updateCallback: () => setState(() {}),
                        child: const SingleFormWidget(
                          fieldName: 'Blood Group',
                          initialValue: 'A+',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.singleFormModel2,
                        updateCallback: () => setState(() {}),
                        child: const SingleFormWidget(
                          fieldName: 'Height (CM)',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.singleFormModel3,
                        updateCallback: () => setState(() {}),
                        child: const SingleFormWidget(
                          fieldName: 'Weight (KG)',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.dropDownFieldModel,
                        updateCallback: () => setState(() {}),
                        child: DropDownFieldWidget(
                          fieldName: 'Gender',
                          initialValue: FFAppConstants.genderOption.first,
                          options: FFAppConstants.genderOption,
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 20.0))
                        .addToStart(const SizedBox(height: 20.0))
                        .addToEnd(const SizedBox(height: 20.0)),
                  ),
                ),
                const Spacer(),
                Divider(
                  height: 0.0,
                  thickness: 0.25,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Submit',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ].addToEnd(const SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
