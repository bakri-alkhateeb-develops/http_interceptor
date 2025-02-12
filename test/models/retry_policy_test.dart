import 'package:http_interceptor/http_interceptor.dart';
import 'package:test/test.dart';

void main() {
  late RetryPolicy testObject;

  setUp(() {
    testObject = TestRetryPolicy();
  });

  group("maxRetryAttempts", () {
    test("defaults to 1", () {
      expect(testObject.maxRetryAttempts, 1);
    });
  });

  group("shouldAttemptRetryOnException", () {
    test("returns false by default", () async {
      expect(
        await testObject.shouldAttemptRetryOnException(
          Exception("Test Exception."),
          Request(
            'GET',
            Uri(),
          ),
        ),
        false,
      );
    });
  });

  group("shouldAttemptRetryOnResponse", () {
    test("returns false by default", () async {
      expect(
        await testObject.shouldAttemptRetryOnResponse(
          Response('', 200),
        ),
        false,
      );
    });
  });
}

class TestRetryPolicy extends RetryPolicy {}
