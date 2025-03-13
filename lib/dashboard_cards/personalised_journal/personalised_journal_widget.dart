import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'personalised_journal_model.dart';
export 'personalised_journal_model.dart';

class PersonalisedJournalWidget extends StatefulWidget {
  const PersonalisedJournalWidget({super.key});

  @override
  State<PersonalisedJournalWidget> createState() =>
      _PersonalisedJournalWidgetState();
}

class _PersonalisedJournalWidgetState extends State<PersonalisedJournalWidget> {
  late PersonalisedJournalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalisedJournalModel());

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
