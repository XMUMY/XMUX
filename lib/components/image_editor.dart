import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_editor/image_editor.dart';

class ImageEditorPage extends StatefulWidget {
  @override
  _ImageEditorPageState createState() => _ImageEditorPageState();
}

class _ImageEditorPageState extends State<ImageEditorPage> {
  final editorKey = GlobalKey<ExtendedImageEditorState>();

  void edit() async {
    final state = editorKey.currentState;

    final rect = state.getCropRect();
    final action = state.editAction;

    var option = ImageEditorOption()
      ..addOption(ClipOption.fromRect(rect))
      ..addOption(FlipOption(
        horizontal: action.flipY,
        vertical: action.flipX,
      ));

    if (action.hasRotateAngle)
      option.addOption(RotateOption(action.rotateAngle.toInt()));

    option.outputFormat = OutputFormat.png(88);
    final result = await ImageEditor.editImage(
      image: state.rawImageData,
      imageEditorOption: option,
    );
    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    var image = ExtendedImage(
      image: ModalRoute.of(context).settings.arguments,
      extendedImageEditorKey: editorKey,
      mode: ExtendedImageMode.editor,
      fit: BoxFit.contain,
      initEditorConfigHandler: (state) {
        return EditorConfig(
          maxScale: 8.0,
          cropRectPadding: const EdgeInsets.all(20.0),
          hitTestSize: 20.0,
          cropAspectRatio: 1 / 1,
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Editor'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: edit,
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: image,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.rotate_left),
            title: Text("Rotate Left"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flip),
            title: Text("Flip"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rotate_right),
            title: Text("Rotate Right"),
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              editorKey.currentState.rotate(right: false);
              break;
            case 1:
              editorKey.currentState.flip();
              break;
            case 2:
              editorKey.currentState.rotate(right: true);
              break;
          }
        },
        currentIndex: 0,
        selectedItemColor: Theme.of(context).iconTheme.color,
        unselectedItemColor: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
