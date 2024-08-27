import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_email_contact/flutter_email_contact.dart';

import 'message.dart';

/// Email to be sent with the Trigger Email Firebase extension.
class Email {
  /// Email Id.
  String id;

  /// Email address to receive the email.
  String to;

  /// Message contained in the email.
  Message message;

  /// Creates a new email to send.
  Email(this.id, this.to, this.message);

  /// Sends the email.
  Future<void> send({String firestoreCollection = "mail"}) async {
    final mailDocument = FirebaseFirestore.instance.collection(firestoreCollection).doc();
    id = mailDocument.id;

    await mailDocument.set(toJson());
  }

  /// Converts the instance to json.
  Map<String, dynamic> toJson() => {
    "id": id,
    "to": to,
    "message": message.toJson(),
  };
}