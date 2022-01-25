// @dart=2.9
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/form.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {

  // Google App Script Web URL.
  static const String URLPost = "https://script.google.com/macros/s/AKfycbzG0ahuiazi4KMbfIdXXgLYOiPdTRxxkR-AqJayfPf8aJmU6xv3c5akUry0-oE1UPoJ3Q/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(FeedbackForm feedbackForm,
      void Function(String) callback) async {
    try {
      await http.post(Uri.parse(URLPost), body: feedbackForm.toJson()).then((
          response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(Uri.parse(URLPost)).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }


  String URLget = "https://script.google.com/macros/s/AKfycbxvf0clxf6Aa854I4j9ewY66VhQ4ocnLQf9Pg4rVsU7GHaAZKwSJe2qcrHdGO1ncqd5MQ/exec";

  Future<List<FeedbackForm>> getFeedbackList() async {
    return await http.get(Uri.parse(URLget)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm.fromJson(json)).toList();
    });
  }
}

