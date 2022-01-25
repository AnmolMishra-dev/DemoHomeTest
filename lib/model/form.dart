// @dart=2.9
class FeedbackForm {
  String name;
  String email;
  String mobileNo;
  String feedback;
  String currentDate;

  FeedbackForm(this.name, this.email, this.feedback, this.mobileNo, this.currentDate);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['name']}", "${json['email']}","${json['feedback']}","${json['mobile_no']}","${json['currentDate']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'name': name,
    'email': email,
    'feedback': feedback,
    'mobileNo': mobileNo,
    'currentDate':currentDate,
  };
}
