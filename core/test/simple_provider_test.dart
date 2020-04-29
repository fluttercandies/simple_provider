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
}

class NumberProvider extends ChangeNotifier {}
