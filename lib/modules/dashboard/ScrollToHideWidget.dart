import 'package:flutter/material.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  const ScrollToHideWidget({
    Key? key,
    required this.controller,
    this.duration = const Duration(milliseconds: 200),
    required this.child})
      : super(key: key);


  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: widget.duration, child: Wrap(
      children: [widget.child],
    ),
    height: isVisible? 56.0 : 0,);
  }
}
