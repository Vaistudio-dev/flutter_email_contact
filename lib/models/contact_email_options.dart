import 'package:flutter_fit_utils/flutter_fit_utils.dart';

/// Options for sending emails.
class ContactEmailOptions extends Modelable {
  static const String _emailKey = "email";
  static const String _optionKey = "subjects";
  static const String _productKey = "product";
  static const String _collectionIdKey = "firestore_collection";

  /// Email address to send an email to.
  final String emailAddress;
  
  /// Possible subjects available to the end user.
  final List<String> availableSubjects;

  /// Product related to the email.
  final String product;

  /// Firestore collection that triggers the email.
  final String firestoreCollection;

  /// Options for sending emails.
  const ContactEmailOptions({
    required this.emailAddress,
    required this.availableSubjects,
    required this.product,
    required this.firestoreCollection,
  });

  /// Creates options from a [Model].
  ContactEmailOptions.fromModel(Model model) :
    emailAddress = model.data[_emailKey].toString(),
    firestoreCollection = model.data[_collectionIdKey].toString(),
    product = model.data[_productKey].toString(),
    availableSubjects = List<String>.from(model.data[_optionKey] as List);

  @override
  ContactEmailOptions copyWith({String? id, String? userId, bool? invalid = false, String? emailAddress, List<String>? availableSubjects, String? product, String? firestoreCollection}) => ContactEmailOptions(
      emailAddress: emailAddress ?? this.emailAddress,
      availableSubjects: availableSubjects ?? this.availableSubjects,
      product: product ?? this.product,
      firestoreCollection: firestoreCollection ?? this.firestoreCollection,
  );

  @override
  Model toModel() => Model(
    id: "",
    data: {
      _emailKey: emailAddress,
      _optionKey: availableSubjects,
      _productKey: product,
      _collectionIdKey: firestoreCollection,
    }
  );
}