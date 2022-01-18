import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

main() {
  group('DirectusUser', () {
    test('Creating an invalid user should throw', () {
      expect(() => DirectusUser({}), throwsException);
      expect(() => DirectusUser({"id": "123-abc"}), throwsException);
      expect(() => DirectusUser({"email": "will@acn.com"}), throwsException);
      expect(() => DirectusUser({"id": "123-abc", "email": "will@acn.com"}),
          returnsNormally);
    });
    test('User essential properties are retrieved from property list', () {
      final sut = DirectusUser({
        "id": "abc-123",
        "first_name": "Will",
        "last_name": "McAvoy",
        "email": "will@acn.com"
      });
      expect(sut.id, "abc-123");
      expect(sut.firstname, "Will");
      expect(sut.lastname, "McAvoy");
      expect(sut.email, "will@acn.com");
    });

    test('Extra properties can be added and read', () {
      final sut = DirectusUser({"id": "abc-123", "email": "will@acn.com"});
      sut.setValue("Sète", forKey: "location");
      expect(sut.getValue(forKey: "location"), "Sète");
    });

    test('Reading an undefined property returns null without crashing', () {
      final sut = DirectusUser({"id": "abc-123", "email": "will@acn.com"});
      expect(sut.getValue(forKey: "undefined_property"), null);
      expect(sut.firstname, null);
      expect(sut.lastname, null);
    });
  });
}
