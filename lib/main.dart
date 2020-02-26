import 'package:flutter/material.dart';
import 'package:joomla4api_basic_flutter_app/Networking/rest_api_manager.dart';
import 'package:joomla4api_basic_flutter_app/Model/joomla_articles.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder<JoomlaArticles>(
      future: RestApiManager().fetchJoomlaArticles(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              print("test:");
              print(snapshot.data.data[0].attributes.title);
              print("dunno");

            return createListView(context, snapshot);
        }
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Joomla 4 API Basic Flutter App"),
      ),
      body: futureBuilder,
    );
  }


  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    return new ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(snapshot.data.data[index].attributes.title),
              subtitle: Text(snapshot.data.data[index].attributes.text),
            ),
            new Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }
}
