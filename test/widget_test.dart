// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:argon_flutter/main.dart';

void main() {
  testWidgets('Loads and navigates from Onboarding to Home', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // On onboarding page
    expect(find.text('GET STARTED'), findsOneWidget);

    // Taps button
    await tester.tap(find.text('GET STARTED'));
    await mockNetworkImagesFor(() => tester.pumpAndSettle());

    // Expect on Home page
    expect(find.text("Home"), findsOneWidget);
  });
}
