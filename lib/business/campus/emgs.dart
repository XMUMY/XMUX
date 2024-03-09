import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:emgs/emgs.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../foundation/localization/locale_keys.dart';
import '../../foundation/platform/breakpoint.dart';
import '../redux/action/action.dart';
import '../redux/state/state.dart';
import '../redux/store.dart';

class EmgsPage extends StatefulWidget {
  const EmgsPage({super.key});

  @override
  State<EmgsPage> createState() => _EmgsPageState();
}

class _EmgsPageState extends State<EmgsPage> {
  final _controller = ScrollController();
  var _elevation = 0.0;

  /// Get application status from website.
  Future<void> _handleUpdate() async {
    final countryCode = getCountryCode(store.state.user.profile.nationality);
    if (countryCode != null) {
      final resp = await getApplicationStatus(
        store.state.user.profile.id,
        countryCode,
      );
      store.dispatch(UpdateEmgsApplicationResultAction(resp));
    }
  }

  @override
  void initState() {
    _handleUpdate();
    // Elevate app bar when scroll down.
    _controller.addListener(() {
      if (_controller.position.pixels > 15 && _elevation < 4.0) {
        setState(() => _elevation = 4.0);
      }
      if (_controller.position.pixels < 15 && _elevation > 0.0) {
        setState(() => _elevation = 0.0);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: kToolbarHeight,
          child: ExtendedImage.network(
            'https://cdn.educationmalaysia.gov.my/wp-content/uploads/2019/11/08054212/emgs-logo1.png',
            loadStateChanged: (state) =>
                state.extendedImageLoadState != LoadState.completed
                    ? Text(
                        LocaleKeys.Campus_Emgs.tr(),
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    : null,
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: _elevation,
      ),
      body: RefreshIndicator(
        onRefresh: _handleUpdate,
        child: StoreConnector<AppState, EmgsApplicationResult?>(
          distinct: true,
          converter: (s) => s.state.queries.emgsApplicationResult,
          builder: (ctx, r) {
            if (r == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return EmgsResultList(
              result: r,
              controller: _controller,
            );
          },
        ),
      ),
    );
  }
}

class EmgsResultList extends StatefulWidget {
  final EmgsApplicationResult result;
  final ScrollController _scrollController;

  const EmgsResultList({
    super.key,
    required this.result,
    required ScrollController controller,
  }) : _scrollController = controller;

  @override
  State<EmgsResultList> createState() => _EmgsResultListState();
}

class _EmgsResultListState extends State<EmgsResultList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _percentageAnimation;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() => setState(() {}));
    _percentageAnimation = Tween(
      begin: 0.0,
      end: widget.result.percentage / 100,
    ).animate(_controller);
    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.green,
    ).animate(_controller);

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Material(
          type: MaterialType.card,
          elevation: 4,
          shape: const CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: min(MediaQuery.of(context).size.width / 2.5, 200),
            width: min(MediaQuery.of(context).size.width / 2.5, 200),
            child: CircularProgressIndicator(
              valueColor: _colorAnimation,
              value: _percentageAnimation.value,
            ),
          ),
        ),
        Text(
          '${(_percentageAnimation.value * 100).toInt()}%',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );

    final info = Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Text(
            widget.result.fullName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(height: 10, color: Colors.transparent),
          Text(
            widget.result.applicationStatus,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Divider(color: Colors.transparent),
          Row(children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    LocaleKeys.Campus_EmgsNo.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Divider(height: 3, color: Colors.transparent),
                  Text(widget.result.applicationId),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    LocaleKeys.Campus_EmgsType.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Divider(height: 3, color: Colors.transparent),
                  Text(widget.result.applicationType),
                ],
              ),
            ),
          ]),
        ]),
      ),
    );

    return ListView(
      controller: widget._scrollController,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
      children: <Widget>[
        const Divider(color: Colors.transparent),
        percentage,
        const Divider(color: Colors.transparent),
        info,
        const Divider(color: Colors.transparent),
        // History.
        Text(
          LocaleKeys.Campus_EmgsHistory.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Divider(height: 8, color: Colors.transparent),
        ListView.separated(
          padding: const EdgeInsets.all(4),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.result.history.length,
          itemBuilder: (context, index) {
            final history = widget.result.history[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  history.status,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  DateFormat.yMd().format(history.date),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(history.remark)
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        )
      ],
    );
  }
}
