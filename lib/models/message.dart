/// Message sent by email.
class Message {
  /// Email subject.
  String subject;

  /// Email text.
  String text;

  /// HTML content of the email.
  String html;

  /// Message sent by email.
  Message(this.subject, this.text, this.html);

  /// Converts the instance to json.
  Map<String, dynamic> toJson() => {
    "subject": subject,
    "text": text,
    "html": html,
  };
}