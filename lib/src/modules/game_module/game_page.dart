import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'game_controller.dart';
import 'widgets/widgets.dart';

class GamePage extends GetView<GameController> {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(47, 41, 36, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                WidgetCard(
                  card: GameCard.spadeAce,
                  onTap: (card) {
                    controller.cardSelect = card;
                  },
                ),
                WidgetCard(
                  card: GameCard.heartAce,
                  onTap: (card) {
                    controller.cardSelect = card;
                  },
                ),
                WidgetCard(
                  card: GameCard.diamondAce,
                  onTap: (card) {
                    controller.cardSelect = card;
                  },
                ),
                WidgetCard(
                  card: GameCard.clubAce,
                  onTap: (card) {
                    controller.cardSelect = card;
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/images/button1.svg'),
                SvgPicture.asset('assets/images/button2.svg'),
                SvgPicture.asset('assets/images/buttonGO.svg'),
                SvgPicture.asset('assets/images/button3.svg'),
                SvgPicture.asset('assets/images/button4.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
