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
  final _point = 1000.obs;
  final _showLabel = false.obs;
  final _labelMessage = ''.obs;

  GameCard get cardSelect => _cardSelect.value;

  set cardSelect(GameCard value) {
    _cardSelect.value = value;
  }

  List<GameCard> get select => _select;

  set select(List<GameCard> value) {
    _select.value = value;
  }

  int get point => _point.value;

  set point(int value) {
    _point.value = value;
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
    if (point == 0) {
      Get.rawSnackbar(title: 'Please cúng thêm tiền', message: '');
      return;
    }
    if (cardSelect == GameCard.none) {
      // Get.dia
      Get.rawSnackbar(title: 'Please select', message: 'chon kia`');
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
    if (card == cardSelect) {
      point += 50;
      labelMessage = 'WIN';
    } else {
      point -= 50;
      labelMessage = 'LOSE';
    }
    showLabel = true;
    await Future.delayed(const Duration(milliseconds: 2000));
    go();
  }

  void go() {
    select = [];
    cardSelect = GameCard.none;
    showLabel = false;
  }
}
