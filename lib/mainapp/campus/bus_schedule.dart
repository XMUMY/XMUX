import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class BusSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bus Schedule')),
      body: PhotoView(
        imageProvider: NetworkImage(
            'http://www.xmu.edu.my/_upload/article/images/7a/24/ad85b64f496e9abc7833d44c0069/81a03f09-caf3-468b-adbf-26d5150239fe_d.png'),
        maxScale: 2.0,
        minScale: 0.3,
      ),
    );
  }
}
