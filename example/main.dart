import 'package:flutter/material.dart';
import 'package:route_transition_pz/route_transition_pz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1': (_) => Page1Page(),
        'page2': (_) => Page2Page(),
      },
    );
  }
}

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Container(
        child: Center(
          child: MaterialButton(
            color: Colors.white,
            onPressed: () {
              RouteTransitions(
                context: context,
                child: Page2Page(),
                animationType: AnimationType.fadeIn,
                duration: Duration(seconds: 2),
              );
            },
            child: Text("Go to Page 2"),
          ),
        ),
      ),
    );
  }
}

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Center(child: Text("Page2 Page")),
      ),
    );
  }
}
