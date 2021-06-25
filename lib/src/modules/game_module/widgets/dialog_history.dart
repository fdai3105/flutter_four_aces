part of 'widgets.dart';

class DialogHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromRGBO(188, 151, 76, 1),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 0,
      child: Container(
        height: 600,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'History',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const WidgetHistoryItem(
              firstColumn: Text(
                'Date',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              secondColumn: Text(
                'Game',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              threeColumn: Text(
                'Result',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<Box<History>>(
                builder: (context, box, widget) {
                  if (box.values.isEmpty) {
                    return const Center(
                      child: Text(
                        'Nothing to show',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: box.values.toList().length,
                    itemBuilder: (context, i) {
                      final item = box.values.toList()[i];
                      return WidgetHistoryItem(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 10,
                        ),
                        firstColumn: Text(
                          Date.formatDate(item.dateTime),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        secondColumn: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildGame(
                                GameCard.clubAce, item.choice, item.result),
                            _buildGame(
                                GameCard.heartAce, item.choice, item.result),
                            _buildGame(
                                GameCard.spadeAce, item.choice, item.result),
                            _buildGame(
                                GameCard.diamondAce, item.choice, item.result),
                          ],
                        ),
                        threeColumn: Text(
                          item.choice.contains(item.result) ? 'Win' : 'Lose',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      );
                    },
                  );
                },
                valueListenable: Hive.box<History>('history').listenable(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGame(GameCard cardType, List<GameCard> choice, GameCard result) {
    var assets = '';
    switch (cardType) {
      case GameCard.spadeAce:
        assets = 'assets/images/spade.svg';
        break;
      case GameCard.heartAce:
        assets = 'assets/images/heart.svg';
        break;
      case GameCard.diamondAce:
        assets = 'assets/images/diamond.svg';
        break;
      case GameCard.clubAce:
        assets = 'assets/images/club.svg';
        break;
      case GameCard.redKing:
        break;
      case GameCard.none:
        break;
    }

    final isSelect = choice.contains(cardType);
    final isResult = cardType == result;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ColoredBox(
        color: isResult ? Colors.yellow : Colors.transparent,
        child: Opacity(
          opacity: isSelect ? 1 : 0.2,
          child: SvgPicture.asset(
            assets,
            height: 30,
          ),
        ),
      ),
    );
  }
}
