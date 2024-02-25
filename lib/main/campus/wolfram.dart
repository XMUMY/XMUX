import 'package:flutter/material.dart';

import '../../config.dart';
import '../../util/screen.dart';

class WolframPage extends StatefulWidget {
  const WolframPage({super.key});

  @override
  State<WolframPage> createState() => _WolframPageState();
}

class _WolframPageState extends State<WolframPage> {
  final TextEditingController _inputTextController = TextEditingController();

  void _replace(String str) {
    final selection = _inputTextController.selection;
    _inputTextController.text = _inputTextController.text.replaceRange(
      selection.start,
      selection.end,
      str,
    );
    _inputTextController.selection = selection.copyWith(
      baseOffset: selection.start + str.length,
      extentOffset: selection.start + str.length,
    );
  }

  Widget _toButton(String str) {
    return IconButton(
      icon: Text(str, style: Theme.of(context).textTheme.headlineSmall),
      onPressed: () => _replace(str),
    );
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      TextField(
        autofocus: true,
        controller: _inputTextController,
        maxLines: 4,
        decoration: const InputDecoration(
          labelText: 'Input',
          border: OutlineInputBorder(),
        ),
      ),
      ListTile(
        title: const Text('Commands'),
        trailing: DropdownButton<String>(
          onChanged: (String? command) {
            _inputTextController.text += command!;
            _inputTextController.selection = TextSelection.collapsed(
              offset: _inputTextController.text.length,
            );
          },
          items: [
            'solve',
            'upper triangular',
            'row reduce',
            'integral',
          ]
              .map((command) => DropdownMenuItem<String>(
                    value: command,
                    child: Text(command),
                  ))
              .toList(),
        ),
      ),
      Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 3,
        children: [
          '+',
          '-',
          '*',
          '/',
          '%',
          '=',
          '^',
          '[',
          ']',
          '(',
          ')',
          '{',
          '}',
          ',',
          'x',
          'y',
          'z',
          'f',
        ].map(_toButton).toList(),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wolfram Engine'),
        actions: [
          IconButton(
            icon: Text('C', style: Theme.of(context).textTheme.headlineSmall!),
            onPressed: _inputTextController.clear,
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_inputTextController.text.isEmpty) return;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => WolframResultPage(
                  input: _inputTextController.text,
                ),
              ));
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: context.padBody),
        children: children,
      ),
    );
  }
}

class WolframResultPage extends StatelessWidget {
  final String input;

  const WolframResultPage({super.key, required this.input});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wolfram Engine')),
      body: Stack(
        children: <Widget>[
          const Center(
            child: CircularProgressIndicator(),
          ),
          SingleChildScrollView(
            child: Center(
              child: Image.network(
                Uri.parse('https://api.wolframalpha.com/v1/simple').replace(
                  queryParameters: {
                    'appid': wolframAppId,
                    'i': input,
                    'fontsize': '18',
                    'width': MediaQuery.of(context).size.width.toString(),
                  },
                ).toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
