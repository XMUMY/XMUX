import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'package:xmus_client/generated/aaos.pb.dart';

import '../../component/empty_error.dart';
import '../../component/floating_card.dart';
import '../../global.dart';
import '../../redux/action/action.dart';
import '../../redux/state/state.dart';

/// Get color form GPA point.
extension GPAColorExtension on double {
  static final _colorTween = ColorTween(
    begin: Colors.redAccent,
    end: Colors.greenAccent,
  );

  Color get pointColor =>
      isNaN ? Colors.green : _colorTween.lerp(0.33 * this - 0.33)!;
}

class TranscriptPage extends StatelessWidget {
  const TranscriptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Campus_AcademicTranscript.tr()),
      ),
      body: StoreConnector<AppState, List<Transcript_Session>>(
        distinct: true,
        converter: (s) => s.state.queries.transcript.sessions,
        builder: (context, transcript) =>
            TranscriptWaterfall(transcript: transcript),
      ),
    );
  }
}

class TranscriptWaterfall extends StatelessWidget {
  final List<Transcript_Session> transcript;

  const TranscriptWaterfall({Key? key, required this.transcript})
      : super(key: key);

  Future<void> _handleUpdate() async {
    var action = UpdateTranscriptAction();
    store.dispatch(action);
    await action.future;
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (transcript.isEmpty) {
      child = const EmptyErrorList();
    } else {
      child = WaterfallFlow(
        padding: EdgeInsets.fromLTRB(
          16,
          4,
          16,
          MediaQuery.of(context).padding.bottom,
        ),
        gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
          crossAxisCount: max(MediaQuery.of(context).size.width ~/ 400, 1),
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        children: <Widget>[
          Column(
            children: <Widget>[
              _InfoCard(transcript: transcript),
              _GpaChart(transcript: transcript),
            ],
          ),
          for (var session in transcript)
            _TranscriptSessionCard(session: session),
        ],
      );
    }

    return RefreshIndicator(
      onRefresh: _handleUpdate,
      child: child,
    );
  }
}

class _InfoCard extends StatelessWidget {
  final int finishedCount;
  final int creditsCount;

  _InfoCard({Key? key, required List<Transcript_Session> transcript})
      : finishedCount = transcript.fold(
          0,
          (count, e) => count + e.courses.length,
        ),
        creditsCount = transcript.fold(
          0,
          (count, session) =>
              count +
              session.courses.fold(0, (count, course) => count + course.credit),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                '$finishedCount\n'
                '${LocaleKeys.Campus_AcademicTranscriptCourses.tr()}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: Text(
                '$creditsCount\n'
                '${LocaleKeys.Campus_AcademicTranscriptCredits.tr()}',
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
  final List<Transcript_Session> transcript;

  const _GpaChart({Key? key, required this.transcript}) : super(key: key);

  @override
  _GpaChartState createState() => _GpaChartState();
}

class _GpaChartState extends State<_GpaChart> {
  late Map<int, Transcript_Session> transcriptMap;
  late List<Color> gpaGradientColors;
  late List<Color> cGpaGradientColors;

  var isGpa = true;

  void _updateChartData() {
    transcriptMap = widget.transcript.asMap();
    gpaGradientColors = widget.transcript.map((e) => e.gpa.pointColor).toList()
      ..removeWhere((c) => c == Colors.green); // Remove N/A
    cGpaGradientColors = widget.transcript
        .map((e) => e.cGpa.pointColor)
        .toList()
      ..removeWhere((c) => c == Colors.green); // Remove N/A
  }

  @override
  void initState() {
    _updateChartData();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _GpaChart oldWidget) {
    _updateChartData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final colors = isGpa ? gpaGradientColors : cGpaGradientColors;

    // Keep 2 decimal digits.
    final spots = transcriptMap.entries.map((e) {
      var val = isGpa ? e.value.gpa : e.value.cGpa;
      if (!val.isNaN) val = (val * 100).round() / 100;

      return FlSpot(e.key.toDouble(), val);
    }).toList()
      ..removeWhere((e) => e.y.isNaN);

    final chart = LineChart(LineChartData(
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 25,
            getTitlesWidget: (v, _) => Text(v.toStringAsPrecision(2)),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 34,
            getTitlesWidget: (v, _) => Transform(
              transform: Matrix4.translationValues(-8, 25, 0)..rotateZ(-pi / 4),
              child: Text(widget.transcript[v.toInt()].session.substring(2)),
            ),
          ),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false),
      minY: 1,
      maxY: 4,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          barWidth: 3,
          dotData: FlDotData(show: false),
          gradient: LinearGradient(colors: colors),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: colors.map((color) => color.withOpacity(0.3)).toList(),
            ),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          fitInsideHorizontally: true,
        ),
      ),
    ));

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 4 / 3,
          child: FloatingCard(
            padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
            onTap: () => mounted ? setState(() => isGpa = !isGpa) : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  isGpa ? 'GPA' : 'CGPA',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Divider(height: 3, color: Colors.transparent),
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

class _TranscriptSessionCard extends StatelessWidget {
  final Transcript_Session session;

  const _TranscriptSessionCard({Key? key, required this.session})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: session.courses.length,
      itemBuilder: (context, i) {
        final course = session.courses[i];
        return Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    course.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const Divider(height: 5, color: Colors.transparent),
                  Text(
                    '${course.code}  '
                    '${course.credit} '
                    '${LocaleKeys.Campus_AcademicTranscriptCredits.tr()}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 10, 5),
              child: Text(
                '${course.grade}'
                '${course.point.isNaN ? '' : '\n${course.point.toStringAsFixed(2)}'}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: course.point.pointColor,
                    ),
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, i) => const Divider(),
    );

    return FloatingCard(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              session.session,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          list,
        ],
      ),
    );
  }
}
