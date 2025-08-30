# afrypay

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Le repo est projet utilise une archecture Bloc avec le parterne MVVM qui dive le projet en 3 couches (Data, Presentation et controller)
le state manager choisi est Getx pour sa complimentarite: il nous permet ainsi de gerer l'etat, la navigation l'internationalisation et meme le theme. 
pour la validation des formulaires j'ai utilise form_validator pour le stockage des donnes en locale j'ai utilise flutter_secure_storage pour la secuite. 