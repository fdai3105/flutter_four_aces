import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'game_controller.dart';
import 'widgets/widgets.dart';

class GamePage extends GetView<GameController> {
  const GamePage({Key? key}) : super(key: key);

  static const int _shuffleDuration = 140;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(47, 41, 36, 1),
      body: SafeArea(
        child: GetX<GameController>(
          builder: (_) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            AnimatedAlign(
                              duration: const Duration(
                                  milliseconds: _shuffleDuration),
                              alignment: controller.cardsPosition[0],
                              child: WidgetCard(
                                cardType: GameCard.spadeAce,
                                isSelect: controller.select
                                    .contains(GameCard.spadeAce),
                                onTap: (card) {
                                  controller.onCardSelect(card);
                                },
                              ),
                            ),
                            AnimatedAlign(
                              duration: const Duration(
                                  milliseconds: _shuffleDuration),
                              alignment: controller.cardsPosition[1],
                              child: WidgetCard(
                                cardType: GameCard.heartAce,
                                isSelect: controller.select
                                    .contains(GameCard.heartAce),
                                onTap: (card) {
                                  controller.onCardSelect(card);
                                },
                              ),
                            ),
                            AnimatedAlign(
                              duration: const Duration(
                                  milliseconds: _shuffleDuration),
                              alignment: controller.cardsPosition[2],
                              child: WidgetCard(
                                cardType: GameCard.diamondAce,
                                isSelect: controller.select
                                    .contains(GameCard.diamondAce),
                                onTap: (card) {
                                  controller.onCardSelect(card);
                                },
                              ),
                            ),
                            AnimatedAlign(
                              duration: const Duration(
                                  milliseconds: _shuffleDuration),
                              alignment: controller.cardsPosition[3],
                              child: WidgetCard(
                                cardType: GameCard.clubAce,
                                isSelect: controller.select
                                    .contains(GameCard.clubAce),
                                onTap: (card) {
                                  controller.onCardSelect(card);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildBar(),
                  ],
                ),
                _buildLabel(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBar() {
    return Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WidgetButton(
            onTap: () {
              controller.cardSelect = GameCard.clubAce;
            },
            isSelect: controller.cardSelect == GameCard.clubAce,
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
            onTap: () => {} /*controller.reset()*/,
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
              controller.cardSelect = GameCard.spadeAce;
            },
            isSelect: controller.cardSelect == GameCard.spadeAce,
            assets: 'assets/images/button4.svg',
          ),
        ],
      ),
    );
  }

  Widget _buildLabel() {
    return AnimatedPositioned(
      top: controller.showLabel ? 0 : -100,
      left: 0,
      right: 0,
      height: 80,
      duration: const Duration(milliseconds: 800),
      child: AnimatedOpacity(
        opacity: controller.showLabel ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/label.png'),
            ),
          ),
          child: Center(
            child: Text(
              controller.labelMessage,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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
