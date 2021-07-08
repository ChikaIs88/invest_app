// @dart=2.9
import 'package:chipln/logic/core/firebase_core.dart';
import 'package:chipln/logic/core/variable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfiguration extends Mock implements FirebaseConfiguration {}

void main() {
  final appConfig = MockConfiguration();

  test('Signing in Investor', () async {
    when(() => appConfig.signInUser(
        email: 'test@email.com',
        password: 'testpassword')).thenAnswer((_) => Future.value(userUid));
  });
}
