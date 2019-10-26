import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:need_resume/need_resume.dart';

void main() {
    testWidgets('TestWidget', (WidgetTester tester) async {
        int count = 0;

        await tester.pumpWidget(new MyWidget(() => count++));
        expect(count, 1);
    });
}

class MyWidget extends StatefulWidget {
    final VoidCallback callback;

    const MyWidget(this.callback);

    @override
    _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with NeedResume {
    @override
    Widget build(BuildContext context) {
        return Container();
    }

    @override
    void onResume() {
        // TODO: implement onResume
    }
}
