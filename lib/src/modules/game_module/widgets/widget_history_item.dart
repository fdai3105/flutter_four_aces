part of 'widgets.dart';

class WidgetHistoryItem extends StatelessWidget {
  final Widget firstColumn;
  final Widget secondColumn;
  final Widget threeColumn;
  final EdgeInsets? padding;

  const WidgetHistoryItem({
    Key? key,
    required this.firstColumn,
    required this.secondColumn,
    required this.threeColumn,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: firstColumn,
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: secondColumn,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: threeColumn,
            ),
          ),
        ],
      ),
    );
  }
}
