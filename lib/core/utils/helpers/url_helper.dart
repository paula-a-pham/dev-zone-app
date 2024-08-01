import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> openUrl({required String url}) async {
    if (url.isNotEmpty) {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }
}
