import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'timer_component_model.dart';
export 'timer_component_model.dart';

class TimerComponentWidget extends StatefulWidget {
  const TimerComponentWidget({
    super.key,
    this.time,
  });

  final Future Function(String selectedTime)? time;

  @override
  State<TimerComponentWidget> createState() => _TimerComponentWidgetState();
}

class _TimerComponentWidgetState extends State<TimerComponentWidget> {
  late TimerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      child: custom_widgets.TimePickerWidget(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        initialTime: getCurrentTimestamp,
        onTimeSelected: (dateTime) async {
          logFirebaseEvent('TIMER_COMPONENT_Container_lh2548n8_CALLB');
          await widget.time?.call(
            dateTime,
          );
        },
      ),
    );
  }
}
