import 'package:flutter/material.dart';
import 'package:xmux/generated/i18n.dart';

class LostAndFoundDetailPage extends StatelessWidget {
  final String id;

  const LostAndFoundDetailPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Campus_ToolsLF),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
      ),
    );
  }
}
