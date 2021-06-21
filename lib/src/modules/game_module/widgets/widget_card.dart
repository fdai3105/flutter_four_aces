part of 'widgets.dart';

class WidgetCard extends StatefulWidget {
  final GameCard card;
  final Function(GameCard) onTap;

  const WidgetCard({
    Key? key,
    required this.card,
    required this.onTap,
  }) : super(key: key);

  @override
  _WidgetCardState createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard>
    with SingleTickerProviderStateMixin {
  bool _showFrontSide = true;
  bool _animationCompleted = true;

  static const double cardHeight = 220;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildFront() {
    return SvgPicture.asset(
      'assets/images/back.svg',
      key: const ValueKey(true),
      height: cardHeight,
    );
  }

  Widget _buildRear() {
    var assets = '';
    switch (widget.card) {
      case GameCard.spadeAce:
        assets = 'assets/images/front 1.svg';
        break;
      case GameCard.heartAce:
        assets = 'assets/images/front 5.svg';
        break;
      case GameCard.diamondAce:
        assets = 'assets/images/front 3.svg';
        break;
      case GameCard.clubAce:
        assets = 'assets/images/front 4.svg';
        break;
      case GameCard.redKing:
        assets = 'assets/images/front 2.svg';
        break;
    }
    return SvgPicture.asset(
      assets,
      key: const ValueKey(false),
      height: cardHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.card);
        if (_animationCompleted) {
          setState(() {
            _showFrontSide = !_showFrontSide;
          });
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeOut.flipped,
        transitionBuilder: (widget, animation) {
          animation.addListener(() {
            _animationCompleted = animation.isCompleted;
          });
          final rotateAnim = Tween(begin: pi, end: 0).animate(animation);
          return AnimatedBuilder(
            animation: rotateAnim,
            builder: (context, widget) {
              final isUnder = ValueKey(_showFrontSide) != widget!.key;
              var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
              tilt *= isUnder ? -1.0 : 1.0;
              final value =
                  isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
              return Transform(
                transform: (Matrix4.rotationY(value.toDouble())
                  ..setEntry(3, 0, tilt)),
                alignment: Alignment.center,
                child: widget,
              );
            },
            child: widget,
          );
        },
        child: _showFrontSide ? _buildFront() : _buildRear(),
      ),
    );
  }
}
