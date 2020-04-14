import 'dart:math';

import 'package:flutter/material.dart';

class SpannableGridCell {
  SpannableGridCell({
    @required this.id,
    this.child,
    @required this.column,
    @required this.row,
    this.columnSpan = 1,
    this.rowSpan = 1,
    this.columnFlex = 1,
    this.rowFlex = 1,
  }) : assert(!(columnFlex?.isNegative ?? false) &&
            !(rowFlex?.isNegative ?? false));

  final Object id;

  /// The widget to place in grid.
  final Widget child;

  /// The column to place [child]. Start from 1.
  final int column;

  /// The row to place [child]. Start from 1.
  final int row;

  final int columnSpan;
  final int rowSpan;

  /// Flex factor for column.
  final int columnFlex;

  /// Flex factor for row.
  final int rowFlex;
}

/// Grid that layout with column spans and row spans.
class SpannableGrid extends StatelessWidget {
  const SpannableGrid({
    Key key,
    @required this.cells,
    @required this.columns,
    @required this.rows,
    this.spacing = 0.0,
  }) : super(key: key);

  final List<SpannableGridCell> cells;

  /// Number of columns.
  final int columns;

  /// Number of rows.
  final int rows;

  /// Space between cells.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _SpannableGridDelegate(
        cells: cells,
        columns: columns,
        rows: rows,
        spacing: spacing,
      ),
      children: cells
          .map((cell) => LayoutId(
                id: cell.id,
                child: cell.child,
              ))
          .toList(),
    );
  }
}

class _SpannableGridDelegate extends MultiChildLayoutDelegate {
  _SpannableGridDelegate({
    @required this.cells,
    @required this.columns,
    @required this.rows,
    @required this.spacing,
  })  : columnFactors = List.filled(columns, 1),
        rowFactors = List.filled(rows, 1) {
    for (var cell in cells) {
      columnFactors[cell.column - 1] =
          max(columnFactors[cell.column - 1], cell.columnFlex.toDouble());
      rowFactors[cell.row - 1] =
          max(rowFactors[cell.row - 1], cell.rowFlex.toDouble());
    }

    var sumColumnFlexes = columnFactors.reduce((p, c) => p + c);
    var sumRowFlexes = rowFactors.reduce((p, r) => p + r);

    for (var i = 0; i < columns; ++i) columnFactors[i] /= sumColumnFlexes;
    for (var i = 0; i < rows; ++i) rowFactors[i] /= sumRowFlexes;
  }

  final List<SpannableGridCell> cells;
  final int columns;
  final int rows;
  final double spacing;

  /// The percentage occupied for each column.
  final List<double> columnFactors;

  /// The percentage occupied for each row.
  final List<double> rowFactors;

  @override
  void performLayout(Size size) {
    for (var cell in cells) {
      var childWidth = -spacing * 2;
      var childHeight = -spacing * 2;

      for (var i = cell.column; i < cell.column + cell.columnSpan; ++i)
        childWidth += size.width * columnFactors[i - 1];
      for (var i = cell.row; i < cell.row + cell.rowSpan; ++i)
        childHeight += size.height * rowFactors[i - 1];

      layoutChild(
        cell.id,
        BoxConstraints(
          maxWidth: childWidth,
          maxHeight: childHeight,
        ),
      );

      var childOffsetX = spacing;
      var childOffsetY = spacing;

      for (var i = 1; i < cell.column; ++i)
        childOffsetX += size.width * columnFactors[i - 1];
      for (var i = 1; i < cell.row; ++i)
        childOffsetY += size.height * rowFactors[i - 1];

      positionChild(
        cell.id,
        Offset(childOffsetX, childOffsetY),
      );
    }
  }

  // TODO: Implement comparision.
  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => true;
}
