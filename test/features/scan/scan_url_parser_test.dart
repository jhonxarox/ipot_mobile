import 'package:flutter_test/flutter_test.dart';
import 'package:ipot_mobile/features/scan/data/scan_url_parser.dart';

void main() {
  group('parseTableId', () {
    test('accepts ipot://table/{tableId}', () {
      expect(parseTableId('ipot://table/T001'), 'T001');
      expect(parseTableId('  ipot://table/42  '), '42');
    });

    test('accepts bare table id for manual entry', () {
      expect(parseTableId('T001'), 'T001');
      expect(parseTableId('table-7'), 'table-7');
    });

    test('rejects https and other schemes', () {
      expect(parseTableId('https://example.com/table/T001'), isNull);
      expect(parseTableId('http://ipot/table/T001'), isNull);
    });

    test('rejects wrong ipot host or path shape', () {
      expect(parseTableId('ipot://restaurant/T001'), isNull);
      expect(parseTableId('ipot://table'), isNull);
      expect(parseTableId('ipot://table/T001/extra'), isNull);
    });

    test('rejects empty and malformed input', () {
      expect(parseTableId(''), isNull);
      expect(parseTableId('   '), isNull);
      expect(parseTableId('ipot://table/'), isNull);
      expect(parseTableId('table/with/slash'), isNull);
      expect(parseTableId('bad id!'), isNull);
    });
  });
}
