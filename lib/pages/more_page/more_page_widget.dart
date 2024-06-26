import '/components/higher_order_components/more_item_component/more_item_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'more_page_model.dart';
export 'more_page_model.dart';

class MorePageWidget extends StatefulWidget {
  const MorePageWidget({super.key});

  @override
  State<MorePageWidget> createState() => _MorePageWidgetState();
}

class _MorePageWidgetState extends State<MorePageWidget> {
  late MorePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MorePageModel());

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
          child: wrapWithModel(
            model: _model.moreItemComponentModel,
            updateCallback: () => setState(() {}),
            child: MoreItemComponentWidget(
              callbackMoreItems: (selectedIndex) async {},
            ),
          ),
        ),
      ),
    );
  }
}
