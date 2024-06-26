import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/higher_order_components/add_medication_component/add_medication_component_widget.dart';
import '/components/micro_components/medication_components/medication_card/medication_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'medication_component_model.dart';
export 'medication_component_model.dart';

class MedicationComponentWidget extends StatefulWidget {
  const MedicationComponentWidget({
    super.key,
    this.listOfMedication,
  });

  final List<MedicationListStruct>? listOfMedication;

  @override
  State<MedicationComponentWidget> createState() =>
      _MedicationComponentWidgetState();
}

class _MedicationComponentWidgetState extends State<MedicationComponentWidget> {
  late MedicationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicationComponentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const AlignmentDirectional(1.0, 1.0),
      children: [
        if (_model.isMedication == true)
          FutureBuilder<ApiCallResponse>(
            future: HocGroup.medicationCall.call(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final containerMedicationResponse = snapshot.data!;
              return Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                ),
                child: Stack(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 56.0,
                          decoration: const BoxDecoration(),
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Medications',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Divider(
                          height: 0.0,
                          thickness: 0.25,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        Flexible(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: 40.0,
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      hintText: 'Search',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final medication =
                                          MedicationModelStruct.maybeFromMap(
                                                      containerMedicationResponse
                                                          .jsonBody)
                                                  ?.medication
                                                  .medicationList
                                                  .toList() ??
                                              [];
                                      return ListView.separated(
                                        padding: const EdgeInsets.fromLTRB(
                                          0,
                                          20.0,
                                          0,
                                          0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: medication.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 10.0),
                                        itemBuilder:
                                            (context, medicationIndex) {
                                          final medicationItem =
                                              medication[medicationIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.isMedication = false;
                                              _model.selectedItem =
                                                  medicationItem;
                                              setState(() {});
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: MedicationCardWidget(
                                                key: Key(
                                                    'Keyd0e_${medicationIndex}_of_${medication.length}'),
                                                medicineName: medicationItem
                                                    .medicationName,
                                                quantity: medicationItem.dosage,
                                                isActive: true,
                                                endDate: medicationItem.endDate,
                                                dosage: medicationItem.unit,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ].addToStart(const SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 40.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 50.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          _model.isMedication = false;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        if (_model.isMedication == false)
          wrapWithModel(
            model: _model.addMedicationComponentModel,
            updateCallback: () => setState(() {}),
            updateOnChange: true,
            child: AddMedicationComponentWidget(
              medication: _model.selectedItem,
              callbackAddMedication: () async {
                _model.isMedication = !_model.isMedication;
                setState(() {});
              },
            ),
          ),
      ],
    );
  }
}
