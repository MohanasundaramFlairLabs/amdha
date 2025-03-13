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

import 'index.dart'; // Imports other custom widgets
import 'package:amdha/graph/graph_tool_tip/graph_tool_tip_widget.dart';

import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class BarChartView extends StatefulWidget {
  const BarChartView(
      {super.key,
      this.unit,
      this.filter,
      this.aggregation,
      this.xAxisLabelName,
      this.yAxisLabelName,
      this.xReservedSize,
      this.yReservedSize,
      this.xAxisFontSize,
      this.yAxisFontSize,
      this.xAxisFontColor,
      this.yAxisFontColor,
      this.width,
      this.horizontalLineColor,
      this.barColor,
      this.xAxisPlot,
      this.values,
      this.height,
      this.minHorizontal,
      this.maxHorizontal,
      this.barWidth,
      this.maxY,
      this.xAxisLabelSize,
      this.yAxisLabelSize,
      this.xAxisInterval,
      this.xAxisLabelColor,
      this.yAxisLabelColor});

  final Color? xAxisLabelColor;
  final String? unit;
  final int? filter;
  final List<AggregationStruct>? aggregation;
  final Color? yAxisLabelColor;
  final String? xAxisLabelName;
  final String? yAxisLabelName;
  final double? xAxisLabelSize;
  final double? yAxisLabelSize;
  final double? xReservedSize;
  final double? yReservedSize;
  final double? xAxisFontSize;
  final double? yAxisFontSize;
  final Color? xAxisFontColor;
  final Color? yAxisFontColor;
  final List<double>? values;
  final double? barWidth;
  final double? maxY;
  final double? width;
  final double? height;
  final List<String>? xAxisPlot;
  final Color? barColor;
  final dynamic minHorizontal;
  final double? xAxisInterval;
  final dynamic maxHorizontal;
  final Color? horizontalLineColor;

  @override
  State<BarChartView> createState() => _BarChartViewState();
}

class _BarChartViewState extends State<BarChartView> {
  OverlayEntry? _overlayEntry;
  final GlobalKey _targetKey = GlobalKey();
  Offset? pointOffset = Offset.zero;
  AggregateStruct? aggregate = null;
  FocusNode? _focusNode;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
  }

  void showOverlay(BuildContext context) {
    final RenderBox renderBox =
        _targetKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    double tooltipLeft = offset.dx + (pointOffset?.dx ?? 0) - 40;
    double tooltipTop = offset.dy + (pointOffset?.dy ?? 0) - 70;

    tooltipLeft = tooltipLeft < 0 ? 0 : tooltipLeft; // Prevent left overflow
    tooltipLeft =
        tooltipLeft + 180 > screenWidth ? screenWidth - 180 : tooltipLeft;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: tooltipLeft,
        top: tooltipTop,
        child: Material(
          color: Colors.transparent,
          child: Container(
              width: 180,
              height: 58,
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
              child: GraphToolTipWidget(
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
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Focus(
                focusNode: _focusNode,
                onFocusChange: (hasFocus) {
                  print(hasFocus);
                  if (!hasFocus) {
                    hideOverlay();
                  }
                },
                child: BarChart(
                  key: _targetKey,
                  randomData(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
  ) {
    //DO change here if need to add styling to bars in bar graph!!
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
            toY: y,
            color: widget.barColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4), topRight: Radius.circular(4)),
            width: widget.barWidth),
      ],
    );
  }

  //DO change here if styling of xAxis values need to be changed!!
  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: widget.xAxisFontColor ?? const Color(0XFF949294),
      fontWeight: FontWeight.bold,
      fontSize: widget.xAxisFontSize ?? 14,
    );

    String xAxisIndex;
    print("xAxisPlot ${widget.xAxisPlot}");
    print(widget.values);
    if (widget.xAxisInterval == 0) {
      xAxisIndex = (widget.xAxisPlot != null &&
              value.toInt() <= (widget.xAxisPlot!.length))
          ? widget.xAxisPlot![value.toInt()]
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
                  widget.xAxisPlot != null &&
                  index < widget.xAxisPlot!.length)
              ? widget.xAxisPlot![index]
              : '';
    }

    Widget text = Container(
        width: 30,
        child: Text(xAxisIndex, style: style, textAlign: TextAlign.center));

    Widget transform = Transform.rotate(
      angle: 0,
      child: text,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: transform,
    );
  }

  //DO change here if styling of yAxis needs to be changed!!
  Widget getSideTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: widget.yAxisFontColor ?? const Color(0XFF949294),
      fontWeight: FontWeight.bold,
      fontSize: widget.yAxisFontSize ?? 14,
    );

    Widget text = Text(
      textAlign: TextAlign.center,
      value.toInt().toString(),
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: Container(width: 40, child: text),
    );
  }

  BarChartData randomData() {
    BarChartData bar = BarChartData();
    try {
      bar = BarChartData(
        maxY: widget.maxY ?? 100,
        extraLinesData: ExtraLinesData(horizontalLines: [
          if (widget.maxHorizontal != null)
            HorizontalLine(
                y: widget.minHorizontal?.toDouble() ?? 0,
                color: widget.horizontalLineColor ?? const Color(0XFF322FC8),
                dashArray: [6, 10],
                strokeWidth: 1),
          if (widget.maxHorizontal != null)
            HorizontalLine(
                y: widget.maxHorizontal?.toDouble() ?? 0,
                color: widget.horizontalLineColor ?? const Color(0XFF322FC8),
                dashArray: [6, 10],
                strokeWidth: 1),
        ]),
        barTouchData: BarTouchData(
          enabled: true,
          handleBuiltInTouches: false,
          touchCallback: (touchEvent, touchResponse) {
            if (touchResponse != null && touchResponse.spot != null) {
              final spot = touchResponse.spot;
              if (spot != null && spot.spot.isNotNull() && aggregate == null) {
                if (!(_overlayEntry?.mounted ?? false)) {
                  setState(() {
                    print("X spot >>>>> ${spot.spot.x}");
                    if (widget.filter == 1) {
                      aggregate =
                          widget.aggregation?.first.values.where((elem) {
                        String result =
                            calculateResult(elem, widget.filter ?? 0);
                        print(result);
                        print(widget.xAxisPlot![spot.spot.x.toInt()]);
                        return widget.xAxisPlot![spot.spot.x.toInt()] == result;
                      }).toList()[0];
                    } else {
                      aggregate = widget.aggregation?.first.value.where((elem) {
                        String result =
                            calculateResult(elem, widget.filter ?? 0);
                        print(result);
                        return widget.xAxisPlot![spot.spot.x.toInt()] == result;
                      }).toList()[0];
                    }
                    pointOffset = touchEvent.localPosition;
                    print(pointOffset);
                    print("Aggregate value >>>> $aggregate");
                  });
                  showOverlay(context);
                }
              } else {
                hideOverlay();
              }
            } else {
              hideOverlay();
            }
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            axisNameWidget: Text(
              widget.xAxisLabelName ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: widget.xAxisLabelSize,
                  color: widget.xAxisLabelColor),
            ),
            // xAxis build tiles and reserve size for spacing
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getTitles,
              reservedSize: widget.xReservedSize ?? 40,
            ),
          ),
          leftTitles: AxisTitles(
            axisNameWidget: Text(
              widget.yAxisLabelName ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: widget.yAxisLabelSize,
                  color: widget.yAxisLabelColor),
            ),
            // yAxis build tiles and reserve size for spacing
            sideTitles: SideTitles(
              getTitlesWidget: getSideTitles,
              reservedSize: widget.yReservedSize ?? 40,
              showTitles: true,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: List.generate(
          widget.values?.length ?? 0,
          (i) => makeGroupData(
            i,
            widget.values?[i] ?? 0,
          ),
        ),
        gridData: const FlGridData(show: false),
      );
    } catch (e) {
      print("Error >>>> $e");
    }
    return bar;
  }
}
