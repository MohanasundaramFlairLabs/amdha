import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'personalised_goal_model.dart';
export 'personalised_goal_model.dart';

class PersonalisedGoalWidget extends StatefulWidget {
  const PersonalisedGoalWidget({super.key});

  @override
  State<PersonalisedGoalWidget> createState() => _PersonalisedGoalWidgetState();
}

class _PersonalisedGoalWidgetState extends State<PersonalisedGoalWidget> {
  late PersonalisedGoalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalisedGoalModel());

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
