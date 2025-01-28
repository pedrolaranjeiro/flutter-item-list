import 'package:app/presentation/ui/home/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:app/main.dart' as app;

void main() {
  group("Items are visible", () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("Get list of items from the server", (widgetTester) async {
      app.main();

      // This is required prior to taking the screenshot (Android only).
      await binding.convertFlutterSurfaceToImage();
      await widgetTester.pumpAndSettle();

      final itemList = find.byKey(itemListKey).first;
      expect(itemList, findsOneWidget);

      await binding.takeScreenshot('screenshots/screenshot-1');
    });
  });
}
