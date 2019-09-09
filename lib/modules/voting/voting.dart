import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xmux/components/blur_box.dart';

class VotingPage extends StatefulWidget {
  @override
  _VotingPageState createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  final controller = ScrollController();
  var sigma = 0.0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() => sigma = min(max((controller.offset - 150) / 15, 0), 6.0));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10052F),
      body: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          SliverToBoxAdapter(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Divider(height: 430, color: Colors.transparent),
                    for (var i = 0; i < 10; i++)
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: OutlineButton(
                          child: Text(
                            i.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
