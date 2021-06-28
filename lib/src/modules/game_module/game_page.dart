import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              actions: [
                IconButton(
                  onPressed: () => controller.autoRandom(),
                  icon: const Icon(Icons.shuffle),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => DialogHistory(),
                    );
                  },
                  icon: const Icon(Icons.history),
                ),
              ],
            ),
            Expanded(
              child: GetX<GameController>(
                builder: (_) {
                  return Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // _buildCards(),
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 30,
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  _build1(),
                                  _build2(),
                                  _build3(),
                                  _build4(),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            'Win: ${controller.win} / Lose: ${controller.lose}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
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
          ],
        ),
      ),
    );
  }

  Widget _buildDragTarget(Alignment currentAlign, int key) {
    return Container(
      height: 220,
      width: 100,
      child: DragTarget(
        key: ValueKey(key),
        builder: (context, data, rejectData) {
          return SizedBox();
          if (data.isEmpty) return const Text(':(');
          switch (data.first as GameCard) {
            case GameCard.spadeAce:
              return WidgetCard(
                cardType: GameCard.spadeAce,
                isSelect: /*controller.select.contains(GameCard.spadeAce)*/ true,
                onTap: (card) {
                  controller.onCardSelect(card);
                },
              );
            case GameCard.heartAce:
              return WidgetCard(
                cardType: GameCard.heartAce,
                isSelect: /*controller.select.contains(GameCard.heartAce)*/ true,
                onTap: (card) {
                  controller.onCardSelect(card);
                },
              );
            case GameCard.diamondAce:
              return WidgetCard(
                cardType: GameCard.diamondAce,
                isSelect: /*controller.select.contains(GameCard.diamondAce)*/ true,
                onTap: (card) {
                  controller.onCardSelect(card);
                },
              );
            case GameCard.clubAce:
              return WidgetCard(
                cardType: GameCard.clubAce,
                isSelect: /*controller.select.contains(GameCard.clubAce)*/ true,
                onTap: (card) {
                  controller.onCardSelect(card);
                },
              );
            case GameCard.redKing:
              return const Text(':(');
            case GameCard.none:
              return const Text(':(');
          }
        },
        onWillAccept: (data) {
          if (data == GameCard.spadeAce) {
            if (key == 2) {
              controller.heartPos = controller.spadePos;
            } else if (key == 3) {
              controller.diamondPos = controller.spadePos;
            } else if (key == 4) {
              controller.clubPos = controller.spadePos;
            }
            controller.spadePos = currentAlign;
            return true;
          } else if (data == GameCard.heartAce) {
            if (key == 1) {
              controller.spadePos = controller.heartPos;
            } else if (key == 3) {
              controller.diamondPos = controller.heartPos;
            } else if (key == 4) {
              controller.clubPos = controller.heartPos;
            }
            controller.heartPos = currentAlign;
            return true;
          } else if (data == GameCard.diamondAce) {
            if (key == 1) {
              controller.spadePos = controller.diamondPos;
            } else if (key == 2) {
              controller.heartPos = controller.diamondPos;
            } else if (key == 4) {
              controller.clubPos = controller.diamondPos;
            }
            controller.diamondPos = currentAlign;
            return true;
          } else if (data == GameCard.clubAce) {
            if (key == 1) {
              controller.spadePos = controller.clubPos;
            } else if (key == 2) {
              controller.heartPos = controller.clubPos;
            } else if (key == 3) {
              controller.diamondPos = controller.clubPos;
            }
            controller.clubPos = currentAlign;
            return true;
          } else {
            return false;
          }
        },
      ),
    );
  }

  Widget _build1() {
    return Stack(
      children: [
        AnimatedAlign(
          duration: const Duration(milliseconds: _shuffleDuration),
          alignment: controller.spadePos,
          child: Draggable(
            data: GameCard.spadeAce,
            childWhenDragging: Container(),
            feedback: WidgetCard(
              cardType: GameCard.spadeAce,
              isSelect: /*controller.select.contains(GameCard.spadeAce)*/ true,
              onTap: (card) {
                controller.onCardSelect(card);
              },
            ),
            child: WidgetCard(
              cardType: GameCard.spadeAce,
              isSelect: /*controller.select.contains(GameCard.spadeAce)*/ true,
              onTap: (card) {
                controller.onCardSelect(card);
              },
            ),
          ),
        ),
        Align(
          alignment: controller.spadePos,
          child: _buildDragTarget(controller.spadePos, 1),
        ),
      ],
    );
  }

  Widget _build2() {
    return Stack(
      children: [
        AnimatedAlign(
          duration: const Duration(milliseconds: _shuffleDuration),
          alignment: controller.heartPos,
          child: Draggable(
            data: GameCard.heartAce,
            feedback: WidgetCard(
              cardType: GameCard.heartAce,
              isSelect: /*controller.select.contains(GameCard.heartAce)*/ true,
              onTap: (card) {
                controller.onCardSelect(card);
              },
            ),
            childWhenDragging: Container(),
            child: WidgetCard(
              cardType: GameCard.heartAce,
              isSelect: /*controller.select.contains(GameCard.heartAce)*/ true,
              onTap: (card) {
                controller.onCardSelect(card);
              },
            ),
          ),
        ),
        Align(
          alignment: controller.heartPos,
          child: _buildDragTarget(controller.heartPos, 2),
        ),
      ],
    );
  }

  Widget _build3() {
    return Stack(
      children: [
        AnimatedAlign(
          duration: const Duration(milliseconds: _shuffleDuration),
          alignment: controller.diamondPos,
          child: Draggable(
            data: GameCard.diamondAce,
            feedback: WidgetCard(
              cardType: GameCard.diamondAce,
              isSelect: /*controller.select.contains(GameCard.diamondAce)*/ true,
              onTap: (card) {
                controller.onCardSelect(card);
              },
            ),
            childWhenDragging: Container(),
            child: WidgetCard(
              cardType: GameCard.diamondAce,
              isSelect: /*controller.select.contains(GameCard.diamondAce)*/ true,
              onTap: (card) {
                controller.onCardSelect(card);
              },
            ),
          ),
        ),
        Align(
          alignment: controller.diamondPos,
          child: _buildDragTarget(controller.diamondPos, 3),
        ),
      ],
    );
  }

  Widget _build4() {
    return Stack(
      children: [
        AnimatedAlign(
          duration: const Duration(milliseconds: _shuffleDuration),
          alignment: controller.clubPos,
          child: Draggable(
            data: GameCard.clubAce,
            childWhenDragging: Container(),
            feedback: WidgetCard(
              cardType: GameCard.clubAce,
              isSelect: /*controller.select.contains(GameCard.clubAce)*/ true,
              onTap: (card) {
                controller.onCardSelect(card);
              },
            ),
            child: WidgetCard(
              cardType: GameCard.clubAce,
              isSelect: /*controller.select.contains(GameCard.clubAce)*/ true,
              onTap: (card) {
                controller.onCardSelect(card);
              },
            ),
          ),
        ),
        Align(
          alignment: controller.clubPos,
          child: _buildDragTarget(controller.clubPos, 4),
        ),
      ],
    );
  }

  Widget _buildLabel() {
    return AnimatedPositioned(
      top: controller.showLabel ? 40 : -100,
      left: 0,
      right: 0,
      height: 80,
      duration: const Duration(milliseconds: 500),
      child: AnimatedOpacity(
        opacity: controller.showLabel ? 1 : 0,
        duration: const Duration(milliseconds: 250),
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

  Widget _buildBar() {
    return Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WidgetButton(
            onTap: () => controller.onChoice(GameCard.spadeAce),
            isSelect: controller.cardSelect.contains(GameCard.spadeAce),
            assets: 'assets/images/button1.svg',
          ),
          WidgetButton(
            onTap: () => controller.onChoice(GameCard.heartAce),
            isSelect: controller.cardSelect.contains(GameCard.heartAce),
            assets: 'assets/images/button2.svg',
          ),
          WidgetButton(
            onTap: () => controller.onChoice(GameCard.diamondAce),
            isSelect: controller.cardSelect.contains(GameCard.diamondAce),
            assets: 'assets/images/button3.svg',
          ),
          WidgetButton(
            onTap: () => controller.onChoice(GameCard.clubAce),
            isSelect: controller.cardSelect.contains(GameCard.clubAce),
            assets: 'assets/images/button4.svg',
          ),
        ],
      ),
    );
  }
}
