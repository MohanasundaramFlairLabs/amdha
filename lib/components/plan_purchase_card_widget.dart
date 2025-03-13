import '';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'plan_purchase_card_model.dart';
export 'plan_purchase_card_model.dart';

class PlanPurchaseCardWidget extends StatefulWidget {
  const PlanPurchaseCardWidget({
    super.key,
    required this.plandetails,
    this.subscriptionSuccessCallback,
    required this.userName,
    required this.phoneNumber,
  });

  final PlansStruct? plandetails;
  final Future Function(String transactionId)? subscriptionSuccessCallback;
  final String? userName;
  final String? phoneNumber;

  @override
  State<PlanPurchaseCardWidget> createState() => _PlanPurchaseCardWidgetState();
}

class _PlanPurchaseCardWidgetState extends State<PlanPurchaseCardWidget> {
  late PlanPurchaseCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanPurchaseCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PLAN_PURCHASE_CARD_PlanPurchaseCard_ON_I');
      _model.env = await actions.getEnv();
    });

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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [FlutterFlowTheme.of(context).primary, Color(0xFF136BBC)],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(-1.0, 0.0),
          end: AlignmentDirectional(1.0, 0),
        ),
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(-1.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (valueOrDefault<String>(
                  widget.plandetails?.planName,
                  '-',
                ) ==
                'Pregnancy Program')
              Stack(
                alignment: AlignmentDirectional(0.0, 1.0),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(9.0),
                      topRight: Radius.circular(9.0),
                    ),
                    child: Image.asset(
                      'assets/images/81b740bcdbb05375fcbf142f88c4a038.jpeg',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 220.0,
                      fit: BoxFit.cover,
                      alignment: Alignment(0.0, 0.0),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FFIcons.kcrown,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.plandetails?.planName,
                            '-',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                ],
              ),
            if (valueOrDefault<String>(
                  widget.plandetails?.planName,
                  '-',
                ) !=
                'Pregnancy Program')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.plandetails?.planName,
                        '-',
                      ).toUpperCase(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 20.0,
                            letterSpacing: 3.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Icon(
                      FFIcons.kcrown,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Builder(
                builder: (context) {
                  final features =
                      widget.plandetails?.features.toList() ?? [];

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(features.length, (featuresIndex) {
                      final featuresItem = features[featuresIndex];
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 30.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              FFIcons.kbullet,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 14.0,
                            ),
                            Text(
                              featuresItem.description,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      );
                    })
                        .divide(SizedBox(height: 12.0))
                        .addToStart(SizedBox(height: 10.0))
                        .addToEnd(SizedBox(height: 10.0)),
                  );
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.currency_rupee_rounded,
                        color: valueOrDefault<Color>(
                          FFAppState().theme.secondaryColor,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        size: 30.0,
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.plandetails?.amount.toString(),
                        '-',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: valueOrDefault<Color>(
                              FFAppState().theme.secondaryColor,
                              FlutterFlowTheme.of(context).secondary,
                            ),
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Expanded(
                      child: Text(
                        '/${widget.plandetails?.billingPeriod == 'yearly' ? 'Year' : 'Month'}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Container(
                          width: 100.0,
                          height: 30.0,
                          child: custom_widgets.RazorPayWidget(
                            width: 100.0,
                            height: 30.0,
                            amount: widget.plandetails!.amount,
                            orderId: "",
                            name: widget.userName!,
                            contact: widget.phoneNumber!,
                            email: '',
                            reazorpayKey: _model.env!.razorpayKey,
                            isEnabled: true,
                            backgroudColor:
                                FlutterFlowTheme.of(context).secondary,
                            planId: widget.plandetails!.planId,
                            textColor: FlutterFlowTheme.of(context).primary,
                            successCallback:
                                (transactionId, status, planId) async {
                              logFirebaseEvent(
                                  'PLAN_PURCHASE_CARD_Container_rcw3rkjp_CA');
                              if (isWeb) {
                                await widget.subscriptionSuccessCallback?.call(
                                  transactionId,
                                );
                              } else {
                                if (planId == _model.tempPlanId) {
                                  await widget.subscriptionSuccessCallback
                                      ?.call(
                                    transactionId,
                                  );
                                  _model.tempPlanId = null;
                                  safeSetState(() {});
                                }
                              }
                            },
                            onTapCallback: (planId) async {
                              logFirebaseEvent(
                                  'PLAN_PURCHASE_CARD_Container_rcw3rkjp_CA');
                              _model.tempPlanId = planId;
                              safeSetState(() {});
                            },
                            errorCallback: (status) async {},
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 2.0)),
                ),
              ),
            ),
          ].divide(SizedBox(height: 20.0)).addToEnd(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
