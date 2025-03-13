// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:amdha/graph/graph_tool_tip/graph_tool_tip_widget.dart';
import 'package:amdha/graph/multivital_graph_tooltip/multivital_graph_tooltip_widget.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartView extends StatefulWidget {
  const LineChartView(
      {required this.isShowingMainData,
      this.aggregation,
      this.filter,
      this.type,
      this.unit,
      this.dataPointsList,
      this.bottomTitle,
      this.minX,
      this.minY,
      this.maxX,
      this.maxY,
      this.leftTitleReservedSize = 40.0,
      this.bottomTitlesReservedSize,
      this.bottomTitleWidgetsFontSize,
      this.bottomAxisName,
      this.leftAxisName,
      this.bottomAxisNameFontSize,
      this.leftAxisNameFontSize,
      this.bottomAxisNameColor,
      this.leftAxisNameColor,
      this.bottomTitleWidgetsColor,
      this.leftAxisNameSize,
      this.barWidth,
      this.bottomaxisNameSizeReservedSize,
      this.xAxisInterval,
      super.key,
      this.width,
      this.height,
      this.minHorizontal,
      this.maxHorizontal});
  final bool isShowingMainData;
  final int? filter;
  final String? type;
  final String? unit;
  final List<AggregationStruct>? aggregation;
  final double? bottomaxisNameSizeReservedSize;
  final List<LineDataStruct>? dataPointsList;
  final List<String>? bottomTitle;
  final double? minX;
  final double? minY;
  final double? maxX;
  final double? maxY;
  final double? leftTitleReservedSize;
  final double? bottomTitlesReservedSize;
  final double? bottomTitleWidgetsFontSize;
  final String? bottomAxisName;
  final String? leftAxisName;
  final double? bottomAxisNameFontSize;
  final double? leftAxisNameFontSize;
  final Color? bottomAxisNameColor;
  final Color? leftAxisNameColor;
  final Color? bottomTitleWidgetsColor;
  final double? leftAxisNameSize;
  final double? barWidth;
  final double? xAxisInterval;
  final double? width;
  final double? height;
  final dynamic minHorizontal;
  final dynamic maxHorizontal;

  @override
  State<LineChartView> createState() => _LineChartViewState();
}

class _LineChartViewState extends State<LineChartView> {
  OverlayEntry? _overlayEntry;
  final GlobalKey _targetKey = GlobalKey();
  Offset? pointOffset = Offset.zero;
  AggregateStruct? aggregate = null;
  late FocusNode _focusNode;
  List<AggregateStruct>? aggregateList = null;

  @override
  void dispose() {
    // TODO: implement dispose
    print("Dispose is called");
    _overlayEntry?.remove();
    hideOverlay();
    _overlayEntry = null;
    aggregateList = null;
    aggregate = null;
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      print("Has focus: ${_focusNode.hasFocus}");
    });
  }

  void showOverlay(BuildContext context) {
    final RenderBox renderBox =
        _targetKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    print(size.height);
    final double screenWidth = MediaQuery.of(context).size.width;

    double tooltipLeft = offset.dx + (pointOffset?.dx ?? 0) - 40;
    double tooltipTop = offset.dy + (pointOffset?.dy ?? 0) - 70;

    tooltipLeft = tooltipLeft < 0 ? 0 : tooltipLeft; // Prevent left overflow
    tooltipLeft =
        tooltipLeft + (widget.type == "BloodPressure" ? 280 : 180) > screenWidth
            ? screenWidth - (widget.type == "BloodPressure" ? 280 : 180)
            : tooltipLeft;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: tooltipLeft,
        top: tooltipTop,
        child: Material(
          color: Colors.transparent,
          child: Container(
              width: widget.type == "BloodPressure" ? 280 : 180,
              height: widget.type == "BloodPressure" ? 80 : 58,
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: Offset(4, 4))
                  ]),
              child: widget.type == "BloodPressure"
                  ? MultivitalGraphTooltipWidget(
                      aggregateList: aggregateList,
                      filter: widget.filter,
                      type: widget.type,
                      unit: widget.unit,
                    )
                  : GraphToolTipWidget(
                      unit: widget.unit ?? "",
                      filter: widget.filter,
                      aggregate: aggregate,
                    )),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hideOverlay() {
    if (_overlayEntry?.mounted ?? false) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      aggregate = null;
      aggregateList = null;
    }
  }

  String calculateResult(AggregateStruct elem, int filter) {
    String result = "";
    print(filter);
    switch (filter) {
      case 1:
        result = dateStringToTimeFormat([elem.date])[0];
        break;
      case 7:
        result = dateStringToDaysDateFormat([elem.date])[0];
        break;
      case 30:
      case 90:
      case 180:
        result = dateStringToDateFormat([elem.weekStart], [elem.weekEnd])[0];
        break;
      case 365:
        result = returnFirstThree([elem.month])[0];
        break;
      default:
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // FocusScope.of(context).unfocus();
        FocusScope.of(context).requestFocus(_focusNode);
        hideOverlay();
        print('Focus lost');
        // _focusNode.requestFocus();
        // FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Focus(
        focusNode: _focusNode,
        onFocusChange: (hasFocus) {
          print("Focus change is called >>> $hasFocus");
          // if (!hasFocus) {
          hideOverlay();
          // }
        },
        child: LineChart(
          key: _targetKey,
          sampleData1,
          duration: const Duration(milliseconds: 250),
        ),
        // hideOverlay(),
      ),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData(widget.dataPointsList ?? []),
        maxX: widget.xAxisInterval == 1
            ? widget.maxX
            : widget.bottomTitle?.length != null
                ? widget.bottomTitle!.length + 0
                : 1,
        maxY: widget.maxY,
        minY: widget.minY,
      );

  List<LineChartBarData> lineBarsData(List<LineDataStruct> dataPointsList) {
    List<LineChartBarData> barDataList = [];
    bool isSingleDataSet = dataPointsList.length == 1;

    print("maxY axis is = ${dataPointsList}");
    print("maxY axis is = ${widget.maxY}");

    for (var i = 0; i < dataPointsList.length; i++) {
      print("in for loop");
      List<FlSpot> flSpots = plottingPoints(dataPointsList[i]);
      barDataList.add(createLineChartBarData(
        flSpots,
        Colors.primaries[i + 1 % Colors.primaries.length],
        widget.barWidth ?? 5,
        isSingleDataSet,
      ));
    }
    return barDataList;
  }

  List<FlSpot> plottingPoints(LineDataStruct spots) {
    List<FlSpot> flSpots = [];

    if (widget.xAxisInterval == 1) {
      for (var i = 0; i < spots.data.length; i++) {
        flSpots
            .add(FlSpot(double.parse(widget.bottomTitle![i]), spots.data[i]));
      }
    } else {
      for (var i = 0; i < spots.data.length; i++) {
        if (spots.data[i] != 0) {
          flSpots.add(FlSpot(i.toDouble(), spots.data[i]));
        }
      }
    }

    return flSpots;
  }

  LineChartBarData createLineChartBarData(List<FlSpot> spots, Color color,
      [double barWidth = 1, bool showBelowBar = false]) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      barWidth: barWidth,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: true),
      belowBarData: BarAreaData(
        show: showBelowBar,
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.3),
            color.withOpacity(0.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      spots: spots,
    );
  }

  // Tool Tip data
  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: false,
        touchSpotThreshold: 10,
        touchCallback: (touchEvent, touchResponse) {
          if (touchResponse != null &&
              touchResponse.lineBarSpots != null &&
              touchResponse.lineBarSpots!.isNotEmpty) {
            final spot = touchResponse.lineBarSpots!.first;
            if ((aggregateList == null && aggregate == null) &&
                !(_overlayEntry?.mounted == true)) {
              final newAggregateList = <dynamic>[];
              dynamic newAggregate;
              print("X spot >>>>> ${spot.x}");
              if (widget.type == "BloodPressure") {
                if (widget.filter == 1) {
                  final first = widget.aggregation?.first.values
                      .where((elem) {
                        print(calculateResult(elem, widget.filter ?? 0));
                        print(spot.x);
                        return spot.x.toString() ==
                            calculateResult(elem, widget.filter ?? 0);
                      })
                      .toList()
                      .firstOrNull;
                  print("first >>>>> $first");
                  if (first != null) newAggregateList.add(first);
                  final second = widget.aggregation?.last.values
                      .where((elem) {
                        print(calculateResult(elem, widget.filter ?? 0));
                        print(spot.x);
                        return spot.x.toString() ==
                            calculateResult(elem, widget.filter ?? 0);
                      })
                      .toList()
                      .firstOrNull;
                  print("second >>>>> $second");
                  if (second != null) newAggregateList.add(second);
                } else {
                  final first = widget.aggregation?.first.value
                      .where((elem) {
                        print(widget.bottomTitle![spot.x.toInt()]);
                        return widget.bottomTitle![spot.x.toInt()] ==
                            calculateResult(elem, widget.filter ?? 0);
                      })
                      .toList()
                      .firstOrNull;
                  if (first != null) newAggregateList.add(first);
                  final second = widget.aggregation?.last.value
                      .where((elem) =>
                          widget.bottomTitle![spot.x.toInt()] ==
                          calculateResult(elem, widget.filter ?? 0))
                      .toList()
                      .firstOrNull;
                  if (second != null) newAggregateList.add(second);
                }
              } else {
                newAggregate = widget.filter == 1
                    ? widget.aggregation?.first.values
                        .where((elem) =>
                            spot.x.toString() ==
                            calculateResult(elem, widget.filter ?? 0))
                        .toList()
                        .firstOrNull
                    : widget.aggregation?.first.value
                        .where((elem) =>
                            widget.bottomTitle![spot.x.toInt()] ==
                            calculateResult(elem, widget.filter ?? 0))
                        .toList()
                        .firstOrNull;
              }
              if (newAggregateList.isNotEmpty || newAggregate != null) {
                setState(() {
                  aggregateList =
                      (newAggregateList.isNotEmpty ? newAggregateList : null)
                          ?.cast<AggregateStruct>();
                  aggregate = newAggregate;
                  pointOffset = touchEvent.localPosition;
                });
                showOverlay(context);
              }
            }
          } else {
            print("Hiding overlay...");
            hideOverlay();
          }
        },
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          axisNameSize: widget.bottomaxisNameSizeReservedSize ?? 50,
          axisNameWidget: Text(
            widget.bottomAxisName ?? "",
            style: TextStyle(
              fontSize: widget.bottomAxisNameFontSize ?? 22,
              color: widget.bottomAxisNameColor ??
                  Color.fromARGB(255, 154, 139, 139),
              fontWeight: FontWeight.bold,
            ),
          ),
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          axisNameSize: widget.leftAxisNameSize ?? 20,
          axisNameWidget: Text(
            "${widget.leftAxisName} (${widget.unit})" ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: widget.leftAxisNameFontSize ?? 20,
              color: widget.leftAxisNameColor ??
                  Color.fromARGB(255, 117, 108, 108),
            ),
          ),
          sideTitles: leftTitles(widget.leftTitleReservedSize),
        ),
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(widget.leftTitleReservedSize),
        ),
      );

  SideTitles leftTitles(double? reservedSize) {
    return SideTitles(
      showTitles: true,
      reservedSize: reservedSize ?? 40.0,
      getTitlesWidget: leftTitleWidgets,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    print("");
    final style = TextStyle(
      color: widget.bottomTitleWidgetsColor,
      fontWeight: FontWeight.bold,
      fontSize: widget.bottomTitleWidgetsFontSize ?? 8.0,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(value.toInt().toString(), style: style),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = TextStyle(
      color: widget.bottomTitleWidgetsColor,
      fontWeight: FontWeight.bold,
      fontSize: widget.bottomTitleWidgetsFontSize ?? 8.0,
    );

    String xAxisIndex;
    if (widget.xAxisInterval == 0) {
      xAxisIndex = (widget.bottomTitle != null &&
              value.toInt() < (widget.bottomTitle!.length))
          ? widget.bottomTitle![value.toInt()]
          : '';
    } else {
      int index = value.toInt();
      // bool shouldShow = (index + 1) % (widget.xAxisInterval?.toInt() ?? 3) == 1;
      List<String> xPlot = [
        "12am",
        "1am",
        "2am",
        "3am",
        "4am",
        "5am",
        "6am",
        "7am",
        "8am",
        "9am",
        "10am",
        "11am",
        "12pm",
        "1pm",
        "2pm",
        "3pm",
        "4pm",
        "5pm",
        "6pm",
        "7pm",
        "8pm",
        "9pm",
        "10pm",
        "11pm",
      ];
      bool shouldShow = (index + 1) % (widget.xAxisInterval?.toInt() ?? 3) == 1;

      xAxisIndex = (widget.xAxisInterval == 1)
          ? (value.toInt() % 2 == 0)
              ? xPlot[index]
              : ''
          : (shouldShow &&
                  widget.bottomTitle != null &&
                  index < widget.bottomTitle!.length)
              ? widget.bottomTitle![index]
              : '';
    }

    return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Container(
            child: Text(xAxisIndex, style: style, textAlign: TextAlign.center),
            width: 30));
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: widget.bottomTitlesReservedSize ?? 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(
      show: true,
      drawVerticalLine: false,
      horizontalInterval: 1,
      getDrawingHorizontalLine: (value) {
        if (widget.minHorizontal is List && widget.minHorizontal.isNotEmpty) {
          int index = widget.minHorizontal.indexOf(value);
          if (index != -1) {
            return FlLine(
              dashArray: [6, 6],
              strokeWidth: 1,
              color: Colors.primaries[(1) % Colors.primaries.length],
            );
          }
        }

        if (widget.maxHorizontal is List && widget.maxHorizontal.isNotEmpty) {
          int index = widget.maxHorizontal.indexOf(value);
          if (index != -1) {
            return FlLine(
              dashArray: [6, 6],
              strokeWidth: 1,
              color: Colors.primaries[(2) % Colors.primaries.length],
            );
          }
        }

        if (value == widget.minHorizontal) {
          return FlLine(
            dashArray: [6, 6],
            strokeWidth: 1,
            color: Colors.primaries[1],
          );
        }
        if (value == widget.maxHorizontal) {
          return FlLine(
            dashArray: [6, 6],
            strokeWidth: 1,
            color: Colors.primaries[1],
          );
        }

        return const FlLine(color: Colors.transparent);
      });

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );
}
