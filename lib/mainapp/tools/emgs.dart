import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/emgs/emgs.dart';
import 'package:xmux/modules/error_widgets/error_widgets.dart';
import 'package:xmux/redux/redux.dart';

class EmgsPage extends StatefulWidget {
  @override
  _EmgsPageState createState() => _EmgsPageState();
}

class _EmgsPageState extends State<EmgsPage> {
  /// Get application status from website.
  Future<Null> _handleRefresh() async {
    var countryCode = getCountryCode(store.state.acState.info.nationality);
    var res = await getApplicationStatus(
        store.state.acState.info.idNumber, countryCode);
    store.dispatch(UpdateEmgsApplicationResultAction(res));
  }

  @override
  void initState() {
    if (store.state.acState.info != null) _handleRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).textTheme.button.color,
        ),
        title: CachedNetworkImage(
          imageUrl:
              'https://educationmalaysia.gov.my/skin/frontend/emgs/default/images/logo-emgs.png',
          placeholder: Text(
            i18n('Tools/Emgs', context),
            style: Theme.of(context).textTheme.title,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: StoreBuilder<MainAppState>(
        builder: (ctx, store) {
          if (store.state.acState.info == null) return EmptyErrorPage();
          if (store.state.queryState.emgsApplicationResult == null)
            return Center(child: SpinKitFoldingCube(color: Colors.black38));
          return RefreshIndicator(
              child: EmgsDetails(store.state.queryState.emgsApplicationResult),
              onRefresh: _handleRefresh);
        },
      ),
    );
  }
}

class EmgsDetails extends StatefulWidget {
  final EmgsApplicationResult result;

  const EmgsDetails(this.result);

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
        Tween(begin: 0.0, end: widget.result.percentage / 100)
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
      padding: const EdgeInsets.all(12.0),
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width / 3.0,
              width: MediaQuery.of(context).size.width / 3.0,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 5.0)],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.width / 2.5,
              width: MediaQuery.of(context).size.width / 2.5,
              child: CircularProgressIndicator(
                valueColor: _colorAnimation,
                value: _percentageAnimation.value,
              ),
            ),
            Text(
              '${(_percentageAnimation.value * 100).toInt()}%',
              style: TextStyle(fontSize: 40.0),
            ),
          ],
        ),
        Card(
          margin: const EdgeInsets.all(5.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  widget.result.fullName,
                  style: Theme.of(context).textTheme.title,
                ),
                Divider(height: 10.0, color: Colors.transparent),
                Text(
                  widget.result.applicationStatus,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Divider(height: 12.0, color: Colors.transparent),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            i18n('Tools/Emgs/No', context),
                            style: Theme.of(context).textTheme.title,
                          ),
                          Divider(height: 3.0, color: Colors.transparent),
                          Text(
                            widget.result.applicationNumber,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            i18n('Tools/Emgs/Type', context),
                            style: Theme.of(context).textTheme.title,
                          ),
                          Divider(height: 3.0, color: Colors.transparent),
                          Text(
                            widget.result.applicationType,
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
          padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
          child: Text(
          i18n('Tools/Emgs/History', context),
            style: Theme.of(context).textTheme.title,
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: widget.result.history.length * 2 - 1,
          itemBuilder: (context, index) => index % 2 == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.result.history[(index + 1) ~/ 2].status,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    Text(
                      DateFormat.yMd()
                          .format(widget.result.history[(index + 1) ~/ 2].date),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(widget.result.history[(index + 1) ~/ 2].remark)
                  ],
                )
              : Divider(),
        )
      ],
    );
  }
}
