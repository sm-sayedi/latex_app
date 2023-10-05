import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HorizontalSplitView extends StatefulWidget {
  final Widget top;
  final Widget bottom;
  final double ratio;
  final Color handleColor;
  final Color iconColor;

  const HorizontalSplitView({
    Key? key,
    required this.top,
    required this.bottom,
    this.ratio = 0.5,
    this.handleColor = Colors.black,
    this.iconColor = Colors.white,
  })  : assert(ratio >= 0),
        assert(ratio <= 1),
        super(key: key);

  @override
  State<HorizontalSplitView> createState() => _HorizontalSplitViewState();
}

class _HorizontalSplitViewState extends State<HorizontalSplitView> {
  final dividerWidth = 12.0;

  //from 0-1
  late double ratio;
  double maxHeight = 0;

  double get height1 => max(1, ratio * maxHeight);

  double get height2 => max(1, (1 - ratio) * maxHeight);

  @override
  void initState() {
    super.initState();
    ratio = widget.ratio;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        assert(ratio <= 1);
        assert(ratio >= 0);

        if (maxHeight == 0) {
          maxHeight = constraints.maxHeight - dividerWidth;
        }

        return SizedBox(
          height: constraints.maxHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: height1.toInt(),
                child: widget.top,
              ),
              Material(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  dragStartBehavior: DragStartBehavior.down,
                  child: Container(
                    width: constraints.maxWidth,
                    height: dividerWidth,
                    decoration: BoxDecoration(
                      color: widget.handleColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FittedBox(
                      child: Icon(
                        Icons.drag_handle,
                        color: widget.iconColor,
                      ),
                    ),
                  ),
                  onPanUpdate: (DragUpdateDetails details) {
                    setState(() {
                      ratio += details.delta.dy / maxHeight;
                      if (ratio > 1) {
                        ratio = 1;
                      } else if (ratio < 0) {
                        ratio = 0;
                      }
                    });
                  },
                ),
              ),
              Expanded(
                flex: height2.toInt(),
                child: widget.bottom,
              ),
            ],
          ),
        );
      },
    );
  }
}
