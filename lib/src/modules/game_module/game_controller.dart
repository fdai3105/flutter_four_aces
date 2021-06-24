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
  // final _cardSelect = GameCard.none.obs;
  final _cardSelect = <GameCard>[].obs;
  final _select = <GameCard>[].obs;
  final _showLabel = false.obs;
  final _labelMessage = ''.obs;
  bool _isAnimation = false;
  final cardsPosition = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomLeft,
    Alignment.bottomRight,
  ].obs;

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
    } else {
      labelMessage = 'LOSE';
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
    await Future.delayed(const Duration(milliseconds: 1000));
    for (var i = 0; i <= 20; i++) {
      await Future.delayed(const Duration(milliseconds: 20));
      cardsPosition.shuffle();
    }
    _isAnimation = false;
  }
}
