# Need Resume

Need Resume is a package to implement onResume, onPause, onReady functionality on a Stateful widget (this is for every screen).

## Quick Usage

Replace `State<MyWidget>` with `ResumableState<MyWidget>` and then implement the `void onResume()`, `void onPause()`, and/or `void onReady()` abstract method. Replace `Navigator.push()` or `Navigator.pushNamed()` with `push()` or `pushNamed()`

## Attention

`NeedResume` class is now deprecated, replaced with `ResumableState<T>` abstract class, please see example for detail

## Installation

Add this to your package's pubspec.yaml file:

```
dependencies:
  need_resume: ^1.0.3+2
```

## Example

Basic example:

```dart
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
  void onReady() {
    // Implement your code inside here

    print('HomeScreen is ready!');
  }

  @override
  void onResume() {
    // Implement your code inside here

    print('HomeScreen is resumed!');
  }

  @override
  void onPause() {
    // Implement your code inside here

    print('HomeScreen is paused!');
  }

  void goAnotherScreen() {
    // Replace Navigator.push() or Navigator.pushNamed() with push() or pushNamed()

    push(context, MaterialPageRoute(builder: (context) => AnotherScreen()));
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
    Navigator.pop(context);
  }
}
```

How about to get data from a screen? Just use `resume.data` and `resume.source`:

```dart
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
    push(context, MaterialPageRoute(builder: (context) => AnotherScreen()), 'another_screen');
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
```