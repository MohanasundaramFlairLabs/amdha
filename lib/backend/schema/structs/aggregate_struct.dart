// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AggregateStruct extends BaseStruct {
  AggregateStruct({
    String? month,
    int? year,
    String? severity,
    String? weekStart,
    String? weekEnd,
    String? date,
    double? median,
    double? min,
    double? max,
    double? value,
  })  : _month = month,
        _year = year,
        _severity = severity,
        _weekStart = weekStart,
        _weekEnd = weekEnd,
        _date = date,
        _median = median,
        _min = min,
        _max = max,
        _value = value;

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  set month(String? val) => _month = val;

  bool hasMonth() => _month != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  set year(int? val) => _year = val;

  void incrementYear(int amount) => year = year + amount;

  bool hasYear() => _year != null;

  // "severity" field.
  String? _severity;
  String get severity => _severity ?? '';
  set severity(String? val) => _severity = val;

  bool hasSeverity() => _severity != null;

  // "week_start" field.
  String? _weekStart;
  String get weekStart => _weekStart ?? '';
  set weekStart(String? val) => _weekStart = val;

  bool hasWeekStart() => _weekStart != null;

  // "week_end" field.
  String? _weekEnd;
  String get weekEnd => _weekEnd ?? '';
  set weekEnd(String? val) => _weekEnd = val;

  bool hasWeekEnd() => _weekEnd != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "median" field.
  double? _median;
  double get median => _median ?? 0.0;
  set median(double? val) => _median = val;

  void incrementMedian(double amount) => median = median + amount;

  bool hasMedian() => _median != null;

  // "min" field.
  double? _min;
  double get min => _min ?? 0.0;
  set min(double? val) => _min = val;

  void incrementMin(double amount) => min = min + amount;

  bool hasMin() => _min != null;

  // "max" field.
  double? _max;
  double get max => _max ?? 0.0;
  set max(double? val) => _max = val;

  void incrementMax(double amount) => max = max + amount;

  bool hasMax() => _max != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  static AggregateStruct fromMap(Map<String, dynamic> data) => AggregateStruct(
        month: data['month'] as String?,
        year: castToType<int>(data['year']),
        severity: data['severity'] as String?,
        weekStart: data['week_start'] as String?,
        weekEnd: data['week_end'] as String?,
        date: data['date'] as String?,
        median: castToType<double>(data['median']),
        min: castToType<double>(data['min']),
        max: castToType<double>(data['max']),
        value: castToType<double>(data['value']),
      );

  static AggregateStruct? maybeFromMap(dynamic data) => data is Map
      ? AggregateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'month': _month,
        'year': _year,
        'severity': _severity,
        'week_start': _weekStart,
        'week_end': _weekEnd,
        'date': _date,
        'median': _median,
        'min': _min,
        'max': _max,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'month': serializeParam(
          _month,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.int,
        ),
        'severity': serializeParam(
          _severity,
          ParamType.String,
        ),
        'week_start': serializeParam(
          _weekStart,
          ParamType.String,
        ),
        'week_end': serializeParam(
          _weekEnd,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'median': serializeParam(
          _median,
          ParamType.double,
        ),
        'min': serializeParam(
          _min,
          ParamType.double,
        ),
        'max': serializeParam(
          _max,
          ParamType.double,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
      }.withoutNulls;

  static AggregateStruct fromSerializableMap(Map<String, dynamic> data) =>
      AggregateStruct(
        month: deserializeParam(
          data['month'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.int,
          false,
        ),
        severity: deserializeParam(
          data['severity'],
          ParamType.String,
          false,
        ),
        weekStart: deserializeParam(
          data['week_start'],
          ParamType.String,
          false,
        ),
        weekEnd: deserializeParam(
          data['week_end'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        median: deserializeParam(
          data['median'],
          ParamType.double,
          false,
        ),
        min: deserializeParam(
          data['min'],
          ParamType.double,
          false,
        ),
        max: deserializeParam(
          data['max'],
          ParamType.double,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'AggregateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AggregateStruct &&
        month == other.month &&
        year == other.year &&
        severity == other.severity &&
        weekStart == other.weekStart &&
        weekEnd == other.weekEnd &&
        date == other.date &&
        median == other.median &&
        min == other.min &&
        max == other.max &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([
        month,
        year,
        severity,
        weekStart,
        weekEnd,
        date,
        median,
        min,
        max,
        value
      ]);
}

AggregateStruct createAggregateStruct({
  String? month,
  int? year,
  String? severity,
  String? weekStart,
  String? weekEnd,
  String? date,
  double? median,
  double? min,
  double? max,
  double? value,
}) =>
    AggregateStruct(
      month: month,
      year: year,
      severity: severity,
      weekStart: weekStart,
      weekEnd: weekEnd,
      date: date,
      median: median,
      min: min,
      max: max,
      value: value,
    );
