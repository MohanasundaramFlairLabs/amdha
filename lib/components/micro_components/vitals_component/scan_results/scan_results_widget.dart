import '/backend/schema/structs/index.dart';
import '/components/micro_components/vitals_component/status_card/status_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scan_results_model.dart';
export 'scan_results_model.dart';

class ScanResultsWidget extends StatefulWidget {
  const ScanResultsWidget({
    super.key,
    required this.vitals,
  });

  final List<VitalsStruct>? vitals;

  @override
  State<ScanResultsWidget> createState() => _ScanResultsWidgetState();
}

class _ScanResultsWidgetState extends State<ScanResultsWidget> {
  late ScanResultsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanResultsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                  'Results',
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
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final vital = widget.vitals!.toList();
                            return ListView.separated(
                              padding: const EdgeInsets.fromLTRB(
                                0,
                                20.0,
                                0,
                                0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: vital.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 10.0),
                              itemBuilder: (context, vitalIndex) {
                                final vitalItem = vital[vitalIndex];
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: StatusCardWidget(
                                    key: Key(
                                        'Keys2r_${vitalIndex}_of_${vital.length}'),
                                    vital: vitalItem,
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
        ],
      ),
    );
  }
}
