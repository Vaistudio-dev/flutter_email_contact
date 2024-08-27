import 'package:flutter/material.dart';
import 'package:flutter_email_contact/flutter_email_contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ContactForm(
        options: ContactEmailOptions(
          emailAddress: "test@email.com",
          availableSubjects: [
            "New Feature",
            "Bug Report",
            "Feedback",
          ],
          firestoreCollection: "mail",
          product: "WayFit",
        ),
      ),
    );
  }
}
