part of 'widgets.dart';

class DialogHistory extends StatelessWidget {
  const DialogHistory({
    Key? key,
    required this.history,
  }) : super(key: key);

  final List<History> history;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 600,
        child: Column(
          children: [
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
            ),
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, i) {
                  final item = history[i];
                  return WidgetHistoryItem(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                    firstColumn: Text(
                      item.dateTime.toString(),
                      textAlign: TextAlign.center,
                    ),
                    secondColumn: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildGame(GameCard.clubAce, item.choice, item.result),
                        _buildGame(GameCard.heartAce, item.choice, item.result),
                        _buildGame(GameCard.spadeAce, item.choice, item.result),
                        _buildGame(
                            GameCard.diamondAce, item.choice, item.result),
                      ],
                    ),
                  );
                },
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
    return Opacity(
      opacity: isSelect ? 1 : 0.4,
      child: Material(
        shape: CircleBorder(side: BorderSide(color: Colors.black87)),
        child: SvgPicture.asset(assets),
      ),
    );
  }
}
