import 'package:url_launcher/url_launcher.dart';

class Util {
  static lunchUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (_) {}
  }
}
