import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:xmux/components/page_routes.dart';

/// Item picture that can construct from url or file.
class Picture extends StatelessWidget {
  final String url;
  final File file;

  /// Will be called on delete.
  /// Picture cannot be deleted if it is null.
  final void Function(Picture picture) onDelete;

  const Picture.network(this.url, {this.onDelete}) : this.file = null;

  const Picture.file(this.file, {this.onDelete}) : this.url = null;

  Widget _buildPhotoView(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: ExtendedImage(
        image: file != null ? FileImage(file) : NetworkImage(url),
        mode: ExtendedImageMode.gesture,
        initGestureConfigHandler: (state) => GestureConfig(
          maxScale: 1.5,
          minScale: 0.3,
        ),
      ),
    );
  }

  Widget _buildPicture(BuildContext context, Widget child) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(FadePageRoute(child: _buildPhotoView(context))),
      onLongPress: onDelete == null ? null : () => onDelete(this),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return file != null
        ? _buildPicture(context, Image.file(file))
        : _buildPicture(context, Image.network(url));
  }
}
