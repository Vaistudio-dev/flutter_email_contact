import 'dart:convert';

import 'package:flutter_email_contact/flutter_email_contact.dart';
import 'package:flutter_fit_utils/model/model.dart';
import 'package:flutter_fit_utils_config/remote_config.dart';

class ContactConfig extends RemoteConfig {
  static const String _emailConfigKey = "contact_options";

  late ContactEmailOptions emailOptions;

  @override
  void read() {
    emailOptions = ContactEmailOptions.fromModel(Model.fromJson(jsonDecode(appConfig.getString(_emailConfigKey)) as Map<String, dynamic>));
  }
}