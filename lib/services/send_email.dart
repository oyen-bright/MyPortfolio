import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

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
}
