import 'package:flutter/widgets.dart';

import 'transformer_page_view.dart';

// typedef PaintCallback = Function(Canvas canvas, Size size);

class ColorPainter extends CustomPainter {
  ColorPainter(this._paint, this.info, this.colors);

  final Paint _paint;
  final TransformInfo info;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final index = info.fromIndex;
    _paint.color = colors[index];
    canvas.drawRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height), _paint);
    if (info.done!) {
      return;
    }
    int alpha;
    int color;
    double opacity;
    final position = info.position;
    if (info.forward!) {
      if (index < colors.length - 1) {
        // ignore: deprecated_member_use
        color = colors[index + 1].value & 0x00ffffff;
        opacity = (position! <= 0
            ? (-position / info.viewportFraction!)
            : 1 - position / info.viewportFraction!);
        if (opacity > 1) {
          opacity -= 1.0;
        }
        if (opacity < 0) {
          opacity += 1.0;
        }
        alpha = (0xff * opacity).toInt();

        _paint.color = Color((alpha << 24) | color);
        canvas.drawRect(
            Rect.fromLTWH(0.0, 0.0, size.width, size.height), _paint);
      }
    } else {
      if (index > 0) {
        // ignore: deprecated_member_use
        color = colors[index - 1].value & 0x00ffffff;
        opacity = (position! > 0
            ? position / info.viewportFraction!
            : (1 + position / info.viewportFraction!));
        if (opacity > 1) {
          opacity -= 1.0;
        }
        if (opacity < 0) {
          opacity += 1.0;
        }
        alpha = (0xff * opacity).toInt();

        _paint.color = Color((alpha << 24) | color);
        canvas.drawRect(
            Rect.fromLTWH(0.0, 0.0, size.width, size.height), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(ColorPainter oldDelegate) {
    return oldDelegate.info != info;
  }
}

class _ParallaxColorState extends State<ParallaxColor> {
  Paint paint = Paint();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ColorPainter(paint, widget.info, widget.colors),
      child: widget.child,
    );
  }
}

class ParallaxColor extends StatefulWidget {
  const ParallaxColor({
    Key? key,
    required this.child,
    required this.colors,
    required this.info,
  }) : super(key: key);

  final Widget child;

  final List<Color> colors;

  final TransformInfo info;

  @override
  State<StatefulWidget> createState() {
    return _ParallaxColorState();
  }
}

class ParallaxContainer extends StatelessWidget {
  const ParallaxContainer({
    Key? key,
    required this.child,
    required this.position,
    this.translationFactor = 100.0,
    this.opacityFactor = 1.0,
  }) : super(key: key);

  final Widget child;
  final double position;
  final double translationFactor;
  final double opacityFactor;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (1 - position.abs()).clamp(0.0, 1.0) * opacityFactor,
      child: Transform.translate(
        offset: Offset(position * translationFactor, 0.0),
        child: child,
      ),
    );
  }
}

class ParallaxImage extends StatelessWidget {
  ParallaxImage.asset(
    String name, {
    Key? key,
    required double position,
    this.imageFactor = 0.3,
  })  : image = Image.asset(
          name,
          fit: BoxFit.cover,
          alignment: FractionalOffset(
            0.5 + position * imageFactor,
            0.5,
          ),
        ),
        super(key: key);

  final Image image;
  final double imageFactor;

  @override
  Widget build(BuildContext context) {
    return image;
  }
}
