part of 'widgets.dart';

class WidgetCard extends StatelessWidget {
  final GameCard cardType;
  final Function(GameCard) onTap;
  final bool isSelect;

  const WidgetCard({
    required this.cardType,
    required this.onTap,
    required this.isSelect,
  });

  static const double cardHeight = 220;

  Widget _buildBack() {
    return SvgPicture.asset(
      'assets/images/back.svg',
      key: const ValueKey(true),
      height: cardHeight,
    );
  }

  Widget _buildFront() {
    var assets = '';
    switch (cardType) {
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
      case GameCard.none:
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
    var _animationCompleted = true;
    return GestureDetector(
      onTap: () {
        if (_animationCompleted) {
          onTap(cardType);
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
        transitionBuilder: (widget, animation) {
          animation.addListener(() {
            _animationCompleted = animation.isCompleted;
          });
          final rotateAnim = Tween(begin: pi, end: 0).animate(animation);
          return AnimatedBuilder(
            animation: rotateAnim,
            builder: (context, child) {
              final isUnder = ValueKey(!isSelect) != child!.key;
              var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
              tilt *= isUnder ? -1.0 : 1.0;
              final value =
                  isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
              return Transform(
                transform: (Matrix4.rotationY(value.toDouble())
                  ..setEntry(3, 0, tilt)),
                alignment: Alignment.center,
                child: child,
              );
            },
            child: widget,
          );
        },
        child: isSelect ? _buildFront() : _buildBack(),
      ),
    );
  }
}
