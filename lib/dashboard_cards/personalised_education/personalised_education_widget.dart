import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'personalised_education_model.dart';
export 'personalised_education_model.dart';

class PersonalisedEducationWidget extends StatefulWidget {
  const PersonalisedEducationWidget({super.key});

  @override
  State<PersonalisedEducationWidget> createState() =>
      _PersonalisedEducationWidgetState();
}

class _PersonalisedEducationWidgetState
    extends State<PersonalisedEducationWidget> {
  late PersonalisedEducationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalisedEducationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
