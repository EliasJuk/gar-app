import 'dart:async';

import 'package:flutter/material.dart';

class SpriteAnimation extends StatefulWidget {
  final String asset;
  final int rows;
  final int columns;
  final int fps;
  final double width;
  final double? height;

  const SpriteAnimation({
    super.key,
    required this.asset,
    required this.rows,
    required this.columns,
    required this.fps,
    required this.width,
    this.height,
  });

  @override
  State<SpriteAnimation> createState() => _SpriteAnimationState();
}

class _SpriteAnimationState extends State<SpriteAnimation> {
  Timer? timer;
  int currentFrame = 0;

  int get totalFrames => widget.rows * widget.columns;

  @override
  void initState() {
    super.initState();

    final frameDuration = Duration(
      milliseconds: (1000 / widget.fps).round(),
    );

    timer = Timer.periodic(frameDuration, (_) {
      if (!mounted) return;

      setState(() {
        currentFrame = (currentFrame + 1) % totalFrames;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final row = currentFrame ~/ widget.columns;
    final column = currentFrame % widget.columns;

    return SizedBox(
      width: widget.width,
      height: widget.height ?? widget.width,
      child: ClipRect(
        child: CustomPaint(
          painter: _SpritePainter(
            asset: widget.asset,
            rows: widget.rows,
            columns: widget.columns,
            row: row,
            column: column,
          ),
        ),
      ),
    );
  }
}

class _SpritePainter extends CustomPainter {
  final String asset;
  final int rows;
  final int columns;
  final int row;
  final int column;

  _SpritePainter({
    required this.asset,
    required this.rows,
    required this.columns,
    required this.row,
    required this.column,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final imageProvider = AssetImage(asset);
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);

    imageStream.addListener(
      ImageStreamListener((imageInfo, _) {
        final image = imageInfo.image;

        final frameWidth = image.width / columns;
        final frameHeight = image.height / rows;

        final sourceRect = Rect.fromLTWH(
          column * frameWidth,
          row * frameHeight,
          frameWidth,
          frameHeight,
        );

        final destinationRect = Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        );

        canvas.drawImageRect(
          image,
          sourceRect,
          destinationRect,
          Paint(),
        );
      }),
    );
  }

  @override
  bool shouldRepaint(covariant _SpritePainter oldDelegate) {
    return oldDelegate.row != row || oldDelegate.column != column;
  }
}