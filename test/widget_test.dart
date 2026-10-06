import 'package:flutter_test/flutter_test.dart';
import 'package:plant_doctor_ai/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PlantDoctorApp());

    // Verify that Splash screen title is displayed
    expect(find.text('Plant Doctor AI'), findsOneWidget);
    expect(find.text('Smart Plant Health Assistant'), findsOneWidget);
  });
}
