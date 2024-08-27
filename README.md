This package offers a way to your users to send you emails directly through your app.
This is possible with the Trigger Email Firebase extension.

## Features

- Configure pre-made email subjects
- Let a user send emails to your inbox
- Display a pre-made form to send emails.

## Needed locales
### English
```json
{
  "contactUs": "Contact us",
  "subject": "Subject",
  "contactMessage": "What do you want to tell us about ?",
  "message": "Message",
  "send": "Send",
  "messageReceived": "We got your message, thank you for your feedback !",
  "reportBug": "Report a bug",
  "improvement": "Improvement",
  "newFeature": "New feature",
  "rateApp": "Rate app",
  "helpWanted": "Help wanted"
}
```
### French
```json
{
  "contactUs": "Contactez nous",
  "subject": "Sujet",
  "contactMessage": "De quoi voulez-vous nous parler ?",
  "message": "Message",
  "send": "Envoyer",
  "messageReceived": "Nous avons reçu votre message, merci de vos commentaires !",
  "reportBug": "Signaler un bug",
  "improvement": "Amélioration",
  "newFeature": "Nouvelle fonctionnalité",
  "rateApp": "Noter l'application",
  "helpWanted": "Besoin d'aide"
}
```

## Additional information

### Trigger Email Extension
Don't forget to set the rules for the collection:
```
match /mail/{document=**} {
    allow write: if request.auth != null;
    allow write: if request.auth == null;
}
```

### Remote Config
Set the contact_option parameter like so:
```json
{
  "id": "opt",
  "data": {
    "email": "vaistudio.dev@gmail.com",
    "subjects": [
      "reportBug",
      "improvement",
      "newFeature",
      "rateApp",
      "helpWanted"
    ],
    "product": "Projct",
    "firestore_collection": "mail"
  }
}
```
