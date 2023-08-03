import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Services {
  Future<String> sendEmail(
      {required String email,
      required String name,
      required String message}) async {
    try {
      final apiKey = dotenv.env['sendGridToken'];
      final email = dotenv.env['email'];
      final response =
          await http.post(Uri.parse("https://api.sendgrid.com/v3/mail/send"),
              body: jsonEncode({
                "personalizations": [
                  {
                    "to": [
                      {"email": email}
                    ],
                    "subject": "$name from portfolio"
                  }
                ],
                "from": {"email": email},
                "content": [
                  {"type": "text/plain", "value": jsonEncode(message)}
                ]
              }),
              headers: {
            "Authorization": "Bearer $apiKey",
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*'
          });

      print(response.body);
      print(response.statusCode);
      return "";
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future<Map<DateTime, int>?> getGitHubStats() async {
    try {
      final gitHubApiKey = dotenv.env['gitHubToken'];

      const username = "oyen-bright";
      final year = DateTime.now().year;
      final headers = {'Authorization': 'token $gitHubApiKey'};

      final http.Response res = await http.get(
          Uri.parse("https://api.github.com/users/$username/events"),
          headers: headers);
      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 200) {
        final events = json.decode(res.body);
        final List contributions =
            events.where((e) => e['type'] == 'PushEvent').toList();

        print(contributions.length);

        final Map<DateTime, int> c = {};
        for (var contribution in contributions) {
          final date = DateFormat('yyyy-MM-dd')
              .parse(DateTime.parse(contribution['created_at']).toString());
          c.update(date, (value) => value + 1, ifAbsent: () => 1);
        }
        print(c);
        print(c.runtimeType);

        return c;
      } else {
        throw Exception('Failed to fetch contributions');
      }
    } catch (e) {
      return null;
    }
  }
}
