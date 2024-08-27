import 'package:flutter/material.dart';
import 'package:flutter_email_contact/flutter_email_contact.dart';
import 'package:flutter_fit_utils_ui/flutter_fit_utils_ui.dart';
import 'package:flutter_fit_utils_vaistudio/config/ui_config.dart';

/// Basic form to let an end user send an email.
/// Auto-pops after an email is sent.
class ContactForm extends StatefulWidget {
  /// Email options.
  final ContactEmailOptions options;

  /// Logs to include in the email.
  final String logToInclude;

  /// Called after an email is sent.
  final Function()? onSend;

  const ContactForm({
    super.key,
    required this.options,
    this.logToInclude = "N/A",
    this.onSend,
  });

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late String subject = widget.options.availableSubjects.first;
  String message = "";

  @override
  Widget build(BuildContext context) {
    return FitPage(
      children: [
        FitTextIcon(
          icon: const Icon(Icons.comment),
          text: FitText.headline(getString("contactUs")),
          themeData: const FitTextIconThemeData(
            contentOrder: TextIconOrder.ti
          ),
        ),
        DropdownButtonFormField<String>(
          value: subject,
          isExpanded: true,
          decoration: InputDecoration(
            labelText: getString("subject"),
          ),
          onChanged: (String? value) {
            setState(() {
              subject = value!;
            });
          },
          items: widget.options.availableSubjects.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 25),
        FitTextInput.multiline(
          label: getString("message"),
          markAsRequired: true,
          maxLength: 2000,
          hint: getString("contactMessage"),
          onChange: (input) => setState(() {
            message = input;
          }),
        ),
        const SizedBox(height: 50),
        FitButton(
          onTap: () {
            final StringBuffer completeMessage = StringBuffer();

            completeMessage.write("Logs:\n");
            completeMessage.write(widget.logToInclude);
            completeMessage.write("\n\nMessage:\n");
            completeMessage.write(message);

            final Email mail = Email("", widget.options.emailAddress, Message("${widget.options.product} - $subject", completeMessage.toString(), ""));
            mail.send();

            context.showSnackbar(getString("messageReceived"));
            Navigator.of(context).pop();

            if (widget.onSend != null) {
              widget.onSend!();
            }
          },
          width: MediaQuery.of(context).size.width,
          child: FitText.button(getString("send")),
        ),
      ],
    );
  }
}
