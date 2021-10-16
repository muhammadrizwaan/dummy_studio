import 'dart:ui';
class AppColors{
  static final Color whiteColor = HexColor.fromHex("#FFFFFF");
  static final Color greenColor = HexColor.fromHex("#26C486");
  static final Color blackColor = HexColor.fromHex("#2D2D2D");
  static final Color grayColor = HexColor.fromHex("#ECECEC");
  static final Color borderColor = HexColor.fromHex("#727C8E");






  static final Color mainColor = Color.fromRGBO(142, 207, 0, 1);

}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}