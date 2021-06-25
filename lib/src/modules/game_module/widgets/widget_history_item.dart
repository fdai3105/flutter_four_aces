part of 'widgets.dart';

class WidgetHistoryItem extends StatelessWidget {
  final Widget firstColumn;
  final Widget secondColumn;
  final EdgeInsets? padding;

  const WidgetHistoryItem({
    Key? key,
    required this.firstColumn,
    required this.secondColumn,
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
            fit: FlexFit.tight,
            child: firstColumn,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: secondColumn,
          ),
        ],
      ),
    );
  }
}
