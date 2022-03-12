import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'background.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(color: Colors.transparent),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'χ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                ),
              ),
              Divider(height: 30, color: Colors.transparent),
              SpinKitThreeBounce(
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
