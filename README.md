# Joomla 4 API Basic Flutter App

A basic flutter app using the Joomla 4 API.

This is tested using Joomla 4 Beta 4.



## Getting Started

Set up flutter, see https://flutter.dev/docs/get-started/install

Get this code from https://github.com/AndyGaskell/joomla4api_basic_flutter_app

Set the details for your Joomla 4 site in the file...

```lib/Networking/rest_api_manager.dart```

This needs...
* Site URL
* Joomla API token


Create all the various other flutter files...

```flutter create .```

Build and run the app...

```flutter run```



## What the App does

It is just using the content API endpoint, pulling all articles and displaying them in a list.

This is what it looks like on an Android Nexus 4 running Android 8.1.0...

![screen grab of the app](joomla4api_basic_flutter_app_small.png)



## Troubleshooting

Flutter set-up issues can usually solved by running...

```flutter doctor```

To check the API is working you can test it with a cURL call, like...

```curl --location --request GET 'http://localhost/joomla/joomla_4_beta_4/api/index.php/v1/content/article' --header 'authorization: Bearer YOUR_API_TOKEN'```

Check 
Make authorization header case insensitive in API #30882 - https://github.com/joomla/joomla-cms/pull/30882
Auth headers in Joomla 4 API should maybe be case insensitive #30871 - https://github.com/joomla/joomla-cms/issues/30871



## Things to do next 

I could / should do some more bits to this, like...

- [ ] add HTML rendering
- [ ] add image per item
- [ ] add error handling
- [ ] some other stuff...



## General Flutter links

* https://flutter.dev/docs/get-started/codelab
* https://flutter.dev/docs
* https://flutter.dev/docs/cookbook



## Joomla API Refs

* https://www.joomdev.com/blog/entry/joomla-4-api-introduction
* https://docs.joomla.org/J4.x:Joomla_Core_APIs
* https://www.youtube.com/watch?v=lT9qodsvfZg&t=38s
* https://github.com/alexandreelise/j4x-api-collection



## Useful Flutter Refs

* https://medium.com/@hagenverfolgt/basic-http-auth-with-flutter-the-right-way-e5209cbe4b55
* https://medium.com/@yugandhar0189/flutter-json-parsing-from-network-response-9c0e8756d43
* https://github.com/yugandh/Flutter_JsonParsing
* https://app.quicktype.io/


