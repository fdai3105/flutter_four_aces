part of 'widgets.dart';

class WidgetButton extends StatelessWidget {
  final Function() onTap;
  final String assets;
  final bool isSelect;

  const WidgetButton({
    Key? key,
    required this.onTap,
    required this.assets,
    required this.isSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: isSelect
              ? Border.all(
                  color: const Color.fromRGBO(180, 146, 74, 1),
                  width: 2,
                )
              : Border.all(color: Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset(
          assets,
          height: 60,
        ),
      ),
    );
  }
}
