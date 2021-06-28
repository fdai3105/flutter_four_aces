import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/models/history.dart';
import '../../data/providers/hive_provider.dart';

part 'game_controller.g.dart';

@HiveType(typeId: 2)
enum GameCard {
  @HiveField(0)
  spadeAce,
  @HiveField(1)
  heartAce,
  @HiveField(2)
  diamondAce,
  @HiveField(3)
  clubAce,
  @HiveField(4)
  redKing,
  @HiveField(5)
  none,
}

class GameController extends GetxController {
  final HiveProvider hiveProvider;

  GameController({required this.hiveProvider});

  final _cardSelect = <GameCard>[].obs;
  final _select = <GameCard>[].obs;
  final _showLabel = false.obs;
  final _labelMessage = ''.obs;
  bool _isAnimation = false;
  final _win = 0.obs;
  final _lose = 0.obs;

  final _spadePos = Alignment.topLeft.obs;
  final _heartPos = Alignment.topRight.obs;
  final _diamondPos = Alignment.bottomLeft.obs;
  final _clubPos = Alignment.bottomRight.obs;

  List<GameCard> get cardSelect => _cardSelect;

  set cardSelect(List<GameCard> value) {
    if (_isAnimation) return;
    _cardSelect.value = value;
  }

  List<GameCard> get select => _select;

  set select(List<GameCard> value) {
    _select.value = value;
  }

  bool get showLabel => _showLabel.value;

  set showLabel(bool value) {
    _showLabel.value = value;
  }

  String get labelMessage => _labelMessage.value;

  set labelMessage(String value) {
    _labelMessage.value = value;
  }

  int get win => _win.value;

  set win(int value) {
    _win.value = value;
  }

  int get lose => _lose.value;

  set lose(int value) {
    _lose.value = value;
  }

  get spadePos => _spadePos.value;

  set spadePos(value) {
    _spadePos.value = value;
  }

  get heartPos => _heartPos.value;

  set heartPos(value) {
    _heartPos.value = value;
  }

  get diamondPos => _diamondPos.value;

  set diamondPos(value) {
    _diamondPos.value = value;
  }

  get clubPos => _clubPos.value;

  set clubPos(value) {
    _clubPos.value = value;
  }

  void onChoice(GameCard card) {
    if (_isAnimation) return;
    if (cardSelect.contains(card)) {
      cardSelect.removeWhere((element) => element == card);
    } else {
      if (cardSelect.length >= 3) {
        cardSelect.removeAt(0);
      }
      cardSelect.add(card);
    }
  }

  Future onCardSelect(GameCard card) async {
    if (_isAnimation) return;
    if (cardSelect.isEmpty) {
      Get.rawSnackbar(message: 'Chọn bài kìa');
      return;
    }
    select = [card];
    await _saveToHive(card);
    await Future.delayed(const Duration(milliseconds: 600));
    select = [
      GameCard.spadeAce,
      GameCard.heartAce,
      GameCard.diamondAce,
      GameCard.clubAce,
      GameCard.redKing,
    ];
    if (cardSelect.contains(card)) {
      labelMessage = 'WIN';
      win++;
    } else {
      labelMessage = 'LOSE';
      lose++;
    }
    showLabel = true;
    await reset();
  }

  Future reset() async {
    await Future.delayed(const Duration(seconds: 3));
    cardSelect = [];
    _isAnimation = true;
    select = [];
    showLabel = false;
    // await Future.delayed(const Duration(milliseconds: 1000));
    // for (var i = 0; i <= 20; i++) {
    //   await Future.delayed(const Duration(milliseconds: 20));
    //   cardsPosition.shuffle();
    // }
    _isAnimation = false;
  }

  Future _saveToHive(GameCard result) async {
    final history = History(
      dateTime: DateTime.now(),
      choice: cardSelect.toList(),
      result: result,
    );
    await hiveProvider.addHistory(history);
  }

  Future autoRandom() async {
    final cardsPosition = [
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.bottomLeft,
      Alignment.bottomRight,
    ];
    for (var i = 0; i <= 20; i++) {
      await Future.delayed(const Duration(milliseconds: 20));
      cardsPosition.shuffle();
      spadePos = cardsPosition[0];
      heartPos = cardsPosition[1];
      diamondPos = cardsPosition[2];
      clubPos = cardsPosition[3];
    }
  }
}
