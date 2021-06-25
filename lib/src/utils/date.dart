part of 'utils.dart';

class Date {
  static String formatDate(DateTime dateTime) {
    return DateFormat.yMd().add_Hm().format(dateTime);
  }
}
