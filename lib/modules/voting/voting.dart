import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xmux/components/blur_box.dart';
import 'package:xmux/modules/voting/api.dart';

var _voted = false;

class VotingPage extends StatefulWidget {
  @override
  _VotingPageState createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  var api =
      XmuxVotingV1VotingApi(ApiClient(basePath: 'https://api.xmux.xdea.io'));
  List<XmuxVotingV1Event> events = [];

  final backgroundController = ScrollController();
  final foregroundController = ScrollController();
  var sigma = 0.0;

  Future<Null> _handleRefresh() async {
    var evs =
        await api.v3VotingVotesGet(activity: 'Ori1909', beg: 0, amount: -1);
    events = evs.data.events;
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    backgroundController.addListener(() {
      setState(() =>
          sigma = min(max((backgroundController.offset - 150) / 15, 0), 6.0));
    });
    foregroundController.addListener(() {
      if (foregroundController.offset <
          backgroundController.position.maxScrollExtent)
        backgroundController.jumpTo(foregroundController.offset);
    });
    super.initState();
  }

  @override
  void dispose() {
    backgroundController.dispose();
    foregroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10052F),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: backgroundController,
            child: Stack(
              children: <Widget>[
                Image.network(
                    'https://i.jpg.dog/img/75b89185f88ef619e6073891fbef9121.jpg'),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GaussianBlurBox(
                    sigma: sigma,
                  ),
                ),
              ],
            ),
          ),
          ListView(
            controller: foregroundController,
            children: <Widget>[
              Divider(height: 430, color: Colors.transparent),
              Column(
                children: <Widget>[
                  for (var i = 0; i < events.length; i++)
                    VoteButton(api, events[i])
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class VoteButton extends StatefulWidget {
  final XmuxVotingV1VotingApi api;
  final XmuxVotingV1Event event;

  VoteButton(this.api, this.event);

  @override
  _VoteButtonState createState() => _VoteButtonState();
}

class _VoteButtonState extends State<VoteButton> {
  void _handleVote() async {
    var resp = await widget.api.v3VotingVotePost(XmuxVotingV1VoteReq()
      ..activity = 'Ori1909'
      ..eventID = widget.event.ID.toString());
    if (resp.code == 0 && mounted) setState(() => _voted = true);
    if (resp.code != 0 && mounted)
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(resp.message)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: OutlineButton(
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            borderRadius: BorderRadius.circular(12),
          ),
          width: MediaQuery.of(context).size.width * 2 / 3,
          height: 60,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.event.name,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      widget.event.presenter ?? '~',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.grey[800]),
                    )
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(widget.event.vote.toString()),
                ),
              ),
            ],
          ),
        ),
        onPressed: _voted ? null : _handleVote,
      ),
    );
  }
}
