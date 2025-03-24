// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate_mvvm/presentation/views/signin_screen.dart';

void main() {

  testWidgets('SignInScreen email and password validation', (WidgetTester tester) async {
    // Build the SignInScreen widget.
    await tester.pumpWidget(GetMaterialApp(home: SignInScreen(email: '')));

    // Verify that the email and password fields are empty.
    expect(find.text(''), findsNWidgets(2));

    // Enter invalid email and password.
    await tester.enterText(find.byType(TextField).first, 'invalid-email');
    await tester.enterText(find.byType(TextField).last, '');

    // Verify that the email and password fields contain the entered text.
    expect(find.text('invalid-email'), findsOneWidget);
    expect(find.text(''), findsOneWidget);

    // Enter valid email and password.
    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password');

    // Verify that the email and password fields contain the entered text.
    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('password'), findsOneWidget);

    // Verify email validation using GetX's feature.
    expect(GetUtils.isEmail('invalid-email'), isFalse);
    expect(GetUtils.isEmail('test@example.com'), isTrue);
  });
}
