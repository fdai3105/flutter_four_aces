part of 'utils.dart';

class Date {
  static String formatDate(DateTime dateTime) {
    return DateFormat('d-MM-y').add_Hm().format(dateTime);
  }
}
