# Joomla 4 API Basic Flutter App

A basic flutter app using the Joomla 4 API.

## Getting Started

Set up flutter, see https://flutter.dev/docs/get-started/install

Get this code from https://github.com/AndyGaskell/joomla4api_basic_flutter_app

Set the details for your Joomla 4 site in the file...
```lib/Networking/rest_api_manager.dart```
This needs...
* Site URL
* Joomla site's username
* Joomla site's password


Create all the various other flutter files...
```flutter create .```

Build and run the app...
```flutter run```




This project is a starting point for a Flutter application.

A few resources for a Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## API

https://www.joomdev.com/blog/entry/joomla-4-api-introduction

https://docs.joomla.org/J4.x:Joomla_Core_APIs


curl --location --request GET 'http://localhost/amh/api/index.php/v1/content/article' --header 'Authorization: Basic username_password_hash'


## API Auth

https://medium.com/@hagenverfolgt/basic-http-auth-with-flutter-the-right-way-e5209cbe4b55


## Refs

https://medium.com/@yugandhar0189/flutter-json-parsing-from-network-response-9c0e8756d43

https://github.com/yugandh/Flutter_JsonParsing

https://app.quicktype.io/
