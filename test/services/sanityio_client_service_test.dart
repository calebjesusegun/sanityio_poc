import 'package:flutter_test/flutter_test.dart';
import 'package:sanityio_poc/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SanityioClientServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
