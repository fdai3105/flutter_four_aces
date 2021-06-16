import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'game_controller.dart';
import 'widgets/widgets.dart';

class GamePage extends GetView<GameController> {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WidgetBody(),
      ),
    );
  }
}

class WidgetBody extends StatefulWidget {
  const WidgetBody({Key? key}) : super(key: key);

  @override
  _WidgetBodyState createState() => _WidgetBodyState();
}

class _WidgetBodyState extends State<WidgetBody> {
  final _cards = [
    const WidgetCard(key: ValueKey(1), text: '1'),
    const WidgetCard(key: ValueKey(2), text: '2'),
    const WidgetCard(key: ValueKey(3), text: '3'),
    const WidgetCard(key: ValueKey(4), text: '4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _cards,
        ),
        ElevatedButton(
          onPressed: () {
            setState(_cards.shuffle);
          },
          child: const Text('Xáo'),
        ),
      ],
    );
  }
}
