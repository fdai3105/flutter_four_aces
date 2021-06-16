import 'dart:math';

import 'package:flutter/material.dart';

class WidgetCard extends StatefulWidget {
  final String text;

  const WidgetCard({Key? key, required this.text}) : super(key: key);

  @override
  _WidgetCardState createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard>
    with SingleTickerProviderStateMixin {
  bool _showFrontSide = true;
  bool _animationCompleted = true;

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 1.1).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticIn),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationCompleted) {
          _showFrontSide
              ? _scaleController.forward()
              : _scaleController.reverse();
          setState(() {
            _showFrontSide = !_showFrontSide;
          });
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        transitionBuilder: (widget, animation) {
          animation.addListener(() {
            _animationCompleted = animation.isCompleted;
          });
          final rotateAnim = Tween(begin: pi, end: 0).animate(animation);
          return AnimatedBuilder(
            animation: rotateAnim,
            builder: (context, widget) {
              final isUnder = ValueKey(_showFrontSide) != widget!.key;
              var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
              tilt *= isUnder ? -1.0 : 1.0;
              final value =
                  isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
              return Transform(
                transform: (Matrix4.rotationY(value.toDouble())
                  ..setEntry(3, 0, tilt)),
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: widget,
                ),
              );
            },
            child: widget,
          );
        },
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeOut.flipped,
        child: _showFrontSide ? _buildFront() : _buildRear(),
      ),
    );
  }

  Widget _buildFront() {
    return Container(
      key: const ValueKey(true),
      height: 180,
      width: 120,
      color: Colors.green,
      child: Center(child: Text('front ${widget.text}')),
    );
  }

  Widget _buildRear() {
    return Container(
      key: const ValueKey(false),
      height: 180,
      width: 120,
      color: Colors.grey,
      child: const Text('rear'),
    );
  }
}
