class NumberUtils {
  static String getFormattedNumberString(String number) {
    return number.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},');
  }
}
