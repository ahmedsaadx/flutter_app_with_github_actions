import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ahmeddev_app/main.dart'; // Update this path based on your actual main file location

void main() {
  testWidgets('Calculator button press test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Check initial state
    expect(find.text('0'), findsOneWidget);

    // Tap buttons to perform calculation 1 + 1
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('+'));
    await tester.pump();
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('='));
    await tester.pump();

    // Verify that the result is 2
    expect(find.text('2'), findsOneWidget);

    // Clear the calculator
    await tester.tap(find.text('C'));
    await tester.pump();

    // Verify that the display is cleared
    expect(find.text('0'), findsOneWidget);
  });
}
