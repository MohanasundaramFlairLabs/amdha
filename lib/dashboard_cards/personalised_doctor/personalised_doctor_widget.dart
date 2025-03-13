import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'personalised_doctor_model.dart';
export 'personalised_doctor_model.dart';

class PersonalisedDoctorWidget extends StatefulWidget {
  const PersonalisedDoctorWidget({super.key});

  @override
  State<PersonalisedDoctorWidget> createState() =>
      _PersonalisedDoctorWidgetState();
}

class _PersonalisedDoctorWidgetState extends State<PersonalisedDoctorWidget> {
  late PersonalisedDoctorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalisedDoctorModel());

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
