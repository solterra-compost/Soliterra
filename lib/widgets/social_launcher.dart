import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class SocialLauncher {
  static Future<void> instagram() async {
    try {
      Uri url = Uri.parse('https://www.instagram.com/solterra_vermicompost');
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception("Can't open instagram");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> twitter_x() async {
    Uri url = Uri.parse('https://www.instagram.com/solterra_vermicompost');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Can't open twitter_x");
    }
  }

  static Future<void> facebook() async {
    Uri url = Uri.parse('https://www.instagram.com/solterra_vermicompost');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Can't open facebook");
    }
  }

  static Future<void> linkedin() async {
    Uri url = Uri.parse('https://www.instagram.com/solterra_vermicompost');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Can't open linkedin");
    }
  }
}
