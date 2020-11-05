import 'package:flutter/material.dart';
import 'package:need_resume/need_resume.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'My Application', home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ResumableState<HomeScreen> {
  @override
  void onResume() {
    switch (resume.source) {
      case 'another_screen':
        print('Data from AnotherScreen: ${resume.data}');
        break;
    }
  }

  void goAnotherScreen() {
    push(context, MaterialPageRoute(builder: (context) => AnotherScreen()),
        'another_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Go to Another Screen'),
          onPressed: () {
            goAnotherScreen();
          },
        ),
      ),
    );
  }
}

class AnotherScreen extends StatefulWidget {
  @override
  AnotherScreenState createState() => AnotherScreenState();
}

class AnotherScreenState extends ResumableState<AnotherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Go Back'),
          onPressed: () {
            goBack();
          },
        ),
      ),
    );
  }

  void goBack() {
    Navigator.pop(context, 'Hello!');
  }
}
