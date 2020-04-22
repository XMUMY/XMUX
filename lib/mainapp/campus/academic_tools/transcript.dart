import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/components/empty_error_button.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/api/models/v3_bridge.dart';
import 'package:xmux/redux/redux.dart';

/// Get color for GPA point. Return default for N/A.
Color getPointColor(String point, BuildContext ctx) {
  try {
    var p = double.parse(point);
    if (p >= 3.7)
      return Colors.green;
    else if (p >= 1.7)
      return Colors.orangeAccent;
    else
      return Colors.red;
  } catch (e) {
    return Theme.of(ctx).textTheme.headline6.color;
  }
}

class TranscriptPage extends StatelessWidget {
  Future<void> _handleUpdate() async {
    var action = UpdateTranscriptAction();
    store.dispatch(action);
    await action.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Campus_AcademicTranscript),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
      ),
      body: StoreConnector<MainAppState, List<TranscriptSession>>(
        converter: (s) => s.state.queryState.transcript,
        builder: (context, transcript) {
          if (transcript == null)
            return EmptyErrorButton(onRefresh: _handleUpdate);
          if (transcript.isEmpty) return EmptyErrorPage();

          return RefreshIndicator(
            onRefresh: _handleUpdate,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                Card(
                  child: Row(
                    children: <Widget>[
                      Text(''),
                    ],
                  ),
                ),
                GpaChart(transcript),
              ],
            ),
          );
        },
      ),
    );
  }
}

class GpaChart extends StatefulWidget {
  final List<TranscriptSession> transcript;
  final Map<int, TranscriptSession> transcriptMap;

  GpaChart(this.transcript) : transcriptMap = transcript.asMap();

  static const List<Color> gradientColors = [
    Color(0xff23b6e6),
    Color(0xff02d39a),
  ];

  @override
  _GpaChartState createState() => _GpaChartState();
}

class _GpaChartState extends State<GpaChart> {
  var isGpa = true;

  @override
  Widget build(BuildContext context) {
    var chart = LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            margin: 8,
            textStyle: Theme.of(context).textTheme.subtitle1,
            getTitles: (value) =>
                widget.transcript[value.toInt()].session.substring(2),
          ),
          leftTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            margin: 8,
            interval: 0.5,
            textStyle: Theme.of(context).textTheme.subtitle1,
            getTitles: (value) => value.toStringAsPrecision(2),
          ),
        ),
        borderData: FlBorderData(show: false),
        minY: 1,
        maxY: 4,
        lineBarsData: [
          LineChartBarData(
            spots: widget.transcriptMap
                .map((k, v) =>
                    MapEntry(k, FlSpot(k.toDouble(), isGpa ? v.gpa : v.cGpa)))
                .values
                .toList(),
            isCurved: true,
            colors: GpaChart.gradientColors,
            barWidth: 5,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              colors: GpaChart.gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ],
      ),
      swapAnimationDuration: const Duration(milliseconds: 300),
    );

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16 / 10,
          child: FloatingCard(
            padding: const EdgeInsets.all(10).copyWith(right: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            onTap: () => mounted ? setState(() => isGpa = !isGpa) : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  isGpa ? 'GPA' : 'CGPA',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Expanded(
                  child: chart,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
