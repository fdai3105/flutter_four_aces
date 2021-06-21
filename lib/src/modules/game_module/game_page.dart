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
        child: GetX<GameController>(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    WidgetCard(
                      cardType: GameCard.spadeAce,
                      isSelect: controller.select == GameCard.spadeAce,
                      onTap: (card) {
                        controller.onCardSelect(card);
                      },
                    ),
                    WidgetCard(
                      cardType: GameCard.heartAce,
                      isSelect: controller.select == GameCard.heartAce,
                      onTap: (card) {
                        controller.onCardSelect(card);
                      },
                    ),
                    WidgetCard(
                      cardType: GameCard.diamondAce,
                      isSelect: controller.select == GameCard.diamondAce,
                      onTap: (card) {
                        controller.onCardSelect(card);
                      },
                    ),
                    WidgetCard(
                      cardType: GameCard.clubAce,
                      isSelect: controller.select == GameCard.clubAce,
                      onTap: (card) {
                        controller.onCardSelect(card);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetButton(
                      onTap: () {
                        controller.cardSelect = GameCard.spadeAce;
                      },
                      isSelect: controller.cardSelect == GameCard.spadeAce,
                      assets: 'assets/images/button1.svg',
                    ),
                    WidgetButton(
                      onTap: () {
                        controller.cardSelect = GameCard.heartAce;
                      },
                      isSelect: controller.cardSelect == GameCard.heartAce,
                      assets: 'assets/images/button2.svg',
                    ),
                    WidgetButton(
                      onTap: () => controller.go(),
                      isSelect: false,
                      assets: 'assets/images/buttonGO.svg',
                    ),
                    WidgetButton(
                      onTap: () {
                        controller.cardSelect = GameCard.diamondAce;
                      },
                      isSelect: controller.cardSelect == GameCard.diamondAce,
                      assets: 'assets/images/button3.svg',
                    ),
                    WidgetButton(
                      onTap: () {
                        controller.cardSelect = GameCard.clubAce;
                      },
                      isSelect: controller.cardSelect == GameCard.clubAce,
                      assets: 'assets/images/button4.svg',
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class WidgetButton extends StatelessWidget {
  final Function() onTap;
  final String assets;
  final bool isSelect;

  const WidgetButton({
    Key? key,
    required this.onTap,
    required this.assets,
    required this.isSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: isSelect
              ? Border.all(color: Colors.yellow)
              : Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5),
        ),
        child: SvgPicture.asset(
          assets,
        ),
      ),
    );
  }
}
