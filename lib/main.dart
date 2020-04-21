import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawer/new_page.dart';
void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[50]: null,
        ),
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        "/a":(BuildContext context)=>new NewPage("New Page"),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Drawer App"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 9.0: 0.0 ,
      ),
      drawer: new Drawer(
        
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
            accountName: new Text("Sarvesh"),
            accountEmail: new Text("shreyas2335@gmail.com"),
            currentAccountPicture: new CircleAvatar(
              child :new Text("S"),
              backgroundColor: Colors.black54,
            ),
            otherAccountsPictures: <Widget>[
              new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("C"),
              )
            ],
            ),
            new ListTile(
              title: new Text("Page 1"),
              trailing: new Icon(Icons.arrow_right),
              onTap: (){ //Navigator.of(context).pushNamed("/a");
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context)=> new NewPage("Page 1"),
                        ));
              }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Page 2"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                      //Navigator.of(context).pushNamed("/a");
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context)=> new NewPage("Page 2")
                        ));
              }
     
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: ()=> Navigator.of(context).pop(),
            )
          ],
        )
        ),
      body: new Container(
        child: new Center(
          child: new Text("Home Page"),
        ),
      )
    );
  }
}