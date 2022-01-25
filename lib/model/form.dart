// @dart=2.9
class FeedbackForm {
  String name;
  String email;
  String mobileNo;
  String feedback;
  String currentDate;

  FeedbackForm(this.name, this.email, this.mobileNo, this.feedback ,this.currentDate);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['name']}", "${json['email']}",
        "${json['currentDate']}",
        "${json['mobileNo']}", "${json['feedback']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'currentDate':currentDate,
    'name': name,
    'email': email,
    'mobileNo': mobileNo,
    'feedback': feedback
  };
}
