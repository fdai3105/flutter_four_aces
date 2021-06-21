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
  final _select = GameCard.none.obs;

  GameCard get cardSelect => _cardSelect.value;

  set cardSelect(GameCard value) {
    _cardSelect.value = value;
  }

  GameCard get select => _select.value;

  set select(GameCard value) {
    _select.value = value;
  }

  Future onCardSelect(GameCard card) async {
    if (cardSelect == GameCard.none) {
      Get.rawSnackbar(title: 'Please select', message: 'chon kia`');
      return;
    }
    select = card;
    await Future.delayed(const Duration(milliseconds: 400));
    if (card == cardSelect) {
      Get.rawSnackbar(title: 'Win', message: 'win nha');
    } else {
      Get.rawSnackbar(title: 'Lose', message: 'lose nha');
    }
  }

  void go() {
    select = GameCard.none;
    cardSelect = GameCard.none;
  }
}
