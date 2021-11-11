import 'package:flutter/material.dart';

class SwipeDrawer extends StatefulWidget {
  final Color backgroundColor;
  final Widget child;
  final Widget drawer;
  final double bodySize;
  final double bodyBackgroundPeekSize;
  final double radius;
  final Curve curve;

  SwipeDrawer(
      {@required this.child,
      @required this.drawer,
      @required Key key,
      this.bodySize = 80,
      this.radius = 0,
      this.bodyBackgroundPeekSize = 50,
      this.curve = Curves.easeIn,
      this.backgroundColor = Colors.black})
      : super(key: key);

  @override
  SwipeDrawerState createState() => SwipeDrawerState();
}

class SwipeDrawerState extends State<SwipeDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  bool dragging = false;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation =
        CurvedAnimation(parent: animationController, curve: widget.curve);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextDirection currentDirection = Directionality.of(context);
    bool isRTL = currentDirection == TextDirection.rtl;

    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          double scale = .8 + .2 * (1 - animation.value);
          double scaleSmall = .7 + .3 * (1 - animation.value);
          double reverse = isRTL ? -1 : 1;
          return Stack(
            overflow: Overflow.visible,
            children: [
              Transform.translate(
                offset: Offset(0, 0),
                child: Container(
                  height: size.height,
                  width: size.width,
                  color: widget.backgroundColor,
                ),
              ),
              Opacity(
                opacity: .3,
                child: buildAnimationBody(scaleSmall, size,
                    widget.bodySize + widget.bodyBackgroundPeekSize, reverse),
              ),
              GestureDetector(
                  onHorizontalDragStart: (details) {},
                  behavior: HitTestBehavior.translucent,
                  child: buildAnimationBody(
                      scale, size, widget.bodySize, reverse)),
              Transform.translate(
                offset:
                    Offset(-size.width * (1 - animation.value) * reverse, 0),
                child: buildDrawer(size),
              ),
            ],
          );
        });
  }

  Container buildDrawer(Size size) {
    return Container(
        width: size.width - (widget.bodySize + widget.bodyBackgroundPeekSize),
        child: widget.drawer);
  }

  Transform buildAnimationBody(
      double scale, Size size, double move, double revers) {
    return Transform(
        transform: Matrix4.identity()
          ..scale(scale, scale)
          ..translate((revers) * (size.width - move) * (animation.value)),
        alignment: FractionalOffset.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isOpened() ? widget.radius : 0),
          child: Container(color: Colors.white, child: widget.child),
        ));
  }

  openOrClose() {
    if (isOpened())
      closeDrawer();
    else
      openDrawer();
  }

  openDrawer() {
    animationController.forward();
  }

  closeDrawer() {
    animationController.reverse();
  }

  bool isOpened() {
    return animationController.isCompleted;
  }
}
