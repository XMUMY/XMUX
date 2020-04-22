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

final _pointColors =
    ColorTween(begin: Colors.redAccent, end: Colors.greenAccent);

/// Get color for GPA point.
extension GetGPAColor on double {
  Color get pointColor => _pointColors.lerp(this / 4);
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
                _InfoCard(transcript),
                _GpaChart(transcript),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final List<TranscriptSession> transcript;

  final int finishedCount;
  final int creditsCount;

  _InfoCard(this.transcript)
      : finishedCount =
            transcript.fold(0, (count, e) => count + e.courses.length),
        creditsCount = transcript.fold(
          0,
          (count, session) =>
              count +
              session.courses.fold(0, (count, course) => count + course.credit),
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '$finishedCount\nCourses Taken',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: Text(
                '$creditsCount\nCredits',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GpaChart extends StatefulWidget {
  final List<TranscriptSession> transcript;

  final Map<int, TranscriptSession> transcriptMap;
  final List<Color> gpaGradientColors;
  final List<Color> cGpaGradientColors;

  _GpaChart(this.transcript)
      : transcriptMap = transcript.asMap(),
        gpaGradientColors = transcript.map((e) => e.gpa.pointColor).toList(),
        cGpaGradientColors = transcript.map((e) => e.cGpa.pointColor).toList();

  @override
  _GpaChartState createState() => _GpaChartState();
}

class _GpaChartState extends State<_GpaChart> {
  var isGpa = true;

  @override
  Widget build(BuildContext context) {
    var colors = isGpa ? widget.gpaGradientColors : widget.cGpaGradientColors;

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
            colors: colors,
            barWidth: 5,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              colors: colors.map((color) => color.withOpacity(0.3)).toList(),
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
