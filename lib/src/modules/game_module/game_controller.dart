import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum GameCard {
  spadeAce,
  heartAce,
  diamondAce,
  clubAce,
  redKing,
  none,
}

class GameController extends GetxController {
  final _cardSelect = GameCard.none.obs;
  final _select = <GameCard>[].obs;
  final _showLabel = false.obs;
  final _labelMessage = ''.obs;
  bool _isAnimation = false;

  GameCard get cardSelect => _cardSelect.value;

  final cardsPosition = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomLeft,
    Alignment.bottomRight,
  ].obs;

  set cardSelect(GameCard value) {
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

  Future onCardSelect(GameCard card) async {
    if (_isAnimation) return;
    if (cardSelect == GameCard.none) {
      Get.rawSnackbar(title: 'Please select', message: 'chon kia`');
      return;
    }
    select = [card];
    print('Select: $cardSelect, result: ${select.first}');
    await Future.delayed(const Duration(milliseconds: 600));
    select = [
      GameCard.spadeAce,
      GameCard.heartAce,
      GameCard.diamondAce,
      GameCard.clubAce,
      GameCard.redKing,
    ];
    if (card == cardSelect) {
      labelMessage = 'WIN';
    } else {
      labelMessage = 'LOSE';
    }
    showLabel = true;
    await reset();
  }

  Future reset() async {
    await Future.delayed(const Duration(seconds: 3));
    cardSelect = GameCard.none;
    _isAnimation = true;
    select = [];
    showLabel = false;
    await Future.delayed(const Duration(milliseconds: 1000));
    for (var i = 0; i <= 50; i++) {
      await Future.delayed(const Duration(milliseconds: 10));
      cardsPosition.shuffle();
    }
    _isAnimation = false;
  }
}
