import 'package:timeago/timeago.dart' as timeago;

class TimeAgo {
  static String format(DateTime dateTime) {
    return timeago.format(dateTime, allowFromNow: true);
  }

  static String formatShort(DateTime dateTime) {
    return timeago.format(dateTime, locale: 'en_short', allowFromNow: true);
  }
}
