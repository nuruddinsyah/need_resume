import 'package:flutter/material.dart';
import 'package:need_resume/need_resume.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'My Application',
            home: new HomeScreen()
        );
    }
}

class HomeScreen extends StatefulWidget {
    @override
    HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with NeedResume {
    @override
    Widget build(BuildContext context) {
        prepareResume();

        return new Scaffold(
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

    @override
    void onResume() {
        // Write your code here
        print('HomeScreen is resumed!');
    }

    void goAnotherScreen() async {
        await Navigator.push(context, MaterialPageRoute(builder: (context) => AnotherScreen()));
        needResume();
    }
}

class AnotherScreen extends StatefulWidget {
    @override
    AnotherScreenState createState() => new AnotherScreenState();
}

class AnotherScreenState extends State<AnotherScreen> {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            body: Center(
                child: RaisedButton(
                    child: Text('Back'),
                    onPressed: () {
                        goBack();
                    },
                ),
            ),
        );
    }

    void goBack() async {
        await Navigator.pop(context);
    }
}