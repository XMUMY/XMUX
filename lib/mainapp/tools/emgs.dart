import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/emgs/emgs.dart';
import 'package:xmux/redux/redux.dart';

class EmgsPage extends StatefulWidget {
  @override
  _EmgsPageState createState() => _EmgsPageState();
}

class _EmgsPageState extends State<EmgsPage> {
  final _scrollController = ScrollController();
  var _elevation = 0.0;
  var _hasError = false;

  /// Get application status from website.
  Future<Null> _handleRefresh() async {
    var countryCode = getCountryCode(store.state.acState.info.nationality);
    try {
      var res = await getApplicationStatus(
          store.state.acState.info.idNumber, countryCode);
      store.dispatch(UpdateEmgsApplicationResultAction(res));
    } catch (e) {
      setState(() => _hasError = true);
      // Rethrow the error so that sentry can catch it.
      rethrow;
    }
  }

  @override
  void initState() {
    if (store.state.acState.info != null) _handleRefresh();

    // Float appBar when scroll.
    _scrollController.addListener(
      () => _scrollController.position.pixels > 15 && _elevation < 4.0
          ? setState(() => _elevation = 4.0)
          : _scrollController.position.pixels < 15 && _elevation > 0.0
              ? setState(() => _elevation = 0.0)
              : null,
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).textTheme.button.color,
        ),
        title: SizedBox(
          height: kToolbarHeight,
          child: CachedNetworkImage(
            imageUrl:
                'https://cdn.educationmalaysia.gov.my/wp-content/uploads/2019/11/08054212/emgs-logo1.png',
            placeholder: (ctx, _) => Text(
              i18n('Tools/Emgs', context),
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: _elevation,
        centerTitle: true,
      ),
      body: StoreBuilder<MainAppState>(
        builder: (ctx, store) {
          if (store.state.acState.info == null || _hasError)
            return EmptyErrorPage();
          if (store.state.queryState.emgsApplicationResult == null)
            return Center(child: SpinKitFoldingCube(color: Colors.black38));
          return RefreshIndicator(
              child: EmgsDetails(store.state.queryState.emgsApplicationResult,
                  _scrollController),
              onRefresh: _handleRefresh);
        },
      ),
    );
  }
}

class EmgsDetails extends StatefulWidget {
  final EmgsApplicationResult _result;
  final ScrollController _scrollController;

  const EmgsDetails(this._result, this._scrollController);

  @override
  _EmgsDetailsState createState() => _EmgsDetailsState();
}

class _EmgsDetailsState extends State<EmgsDetails>
    with SingleTickerProviderStateMixin {
  Animation<double> _percentageAnimation;
  Animation<Color> _colorAnimation;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);

    _percentageAnimation =
        Tween(begin: 0.0, end: widget._result.percentage / 100)
            .animate(_controller);
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.green)
        .animate(_controller)
          ..addListener(() => setState(() {}));

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
    return ListView(
      controller: widget._scrollController,
      padding: const EdgeInsets.all(12),
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 5)],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.width / 2.5,
              width: MediaQuery.of(context).size.width / 2.5,
              child: CircularProgressIndicator(
                valueColor: _colorAnimation,
                value: _percentageAnimation.value,
              ),
            ),
            Text(
              '${(_percentageAnimation.value * 100).toInt()}%',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
        Card(
          margin: const EdgeInsets.all(5),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  widget._result.fullName,
                  style: Theme.of(context).textTheme.title,
                ),
                Divider(height: 10, color: Colors.transparent),
                Text(
                  widget._result.applicationStatus,
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                ),
                Divider(height: 12, color: Colors.transparent),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            i18n('Tools/Emgs/No', context),
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                          Divider(height: 3, color: Colors.transparent),
                          Text(
                            widget._result.applicationId,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            i18n('Tools/Emgs/Type', context),
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                          Divider(height: 3, color: Colors.transparent),
                          Text(
                            widget._result.applicationType,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // History.
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
          child: Text(
            i18n('Tools/Emgs/History', context),
            style: Theme.of(context).textTheme.title,
          ),
        ),
        ListView.separated(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: widget._result.history.length * 2 - 1,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget._result.history[(index + 1) ~/ 2].status,
                style: Theme.of(context).textTheme.subhead,
              ),
              Text(
                DateFormat.yMd()
                    .format(widget._result.history[(index + 1) ~/ 2].date),
                style: Theme.of(context).textTheme.caption,
              ),
              Text(widget._result.history[(index + 1) ~/ 2].remark)
            ],
          ),
          separatorBuilder: (context, index) => Divider(),
        )
      ],
    );
  }
}
