import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_provider/simple_provider.dart';

void main() {
  testWidgets('Test SimpleProvider', (tester) async {
    Type type;
    await tester.pumpWidget(
      SimpleProvider(
        notifiers: <Listenable>[
          NumberProvider(),
        ],
        child: MaterialApp(
          home: Builder(
            builder: (context) => RaisedButton(
              child: Text('tap'),
              onPressed: () {
                type = SimpleProvider.of<NumberProvider>(context).runtimeType;
              },
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('tap'));

    expect(find.text('tap'), findsOneWidget);
    expect(type, NumberProvider);
  });

  testWidgets('Test SimpleBuilder', (tester) async {
    final provider = NumberProvider();

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                provider.add();
              },
              child: Text('add'),
            ),
            SimpleBuilder(
              listenable: provider,
              builder: () {
                return Text(provider.counter.toString());
              },
            ),
          ],
        ),
      ),
    );

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.text('add'));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

class NumberProvider extends ChangeNotifier {
  int counter = 0;

  void add() {
    counter++;
    notifyListeners();
  }
}
