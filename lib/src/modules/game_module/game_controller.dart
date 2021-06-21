import 'package:flutter_four_aces/src/modules/game_module/widgets/widgets.dart';
import 'package:get/get.dart';

enum GameCard {
  spadeAce,
  heartAce,
  diamondAce,
  clubAce,
  redKing,
}

class GameController extends GetxController {
  final _cardSelect = GameCard.redKing.obs;

  GameCard get cardSelect => _cardSelect.value;

  set cardSelect(GameCard value) {
    _cardSelect.value = value;
  }

  late List cards;

  @override
  void onInit() {
    cards = [
      WidgetCard(
        card: GameCard.spadeAce,
        onTap: (card) {
          cardSelect = card;
        },
      ),
      WidgetCard(
        card: GameCard.heartAce,
        onTap: (card) {
          cardSelect = card;
        },
      ),
      WidgetCard(
        card: GameCard.diamondAce,
        onTap: (card) {
          cardSelect = card;
        },
      ),
      WidgetCard(
        card: GameCard.clubAce,
        onTap: (card) {
          cardSelect = card;
        },
      ),
    ]..shuffle();
    super.onInit();
  }

  void onCardSelect(GameCard card) {
    cardSelect = card;
  }

  void go() {
    cards.shuffle();
  }
}
