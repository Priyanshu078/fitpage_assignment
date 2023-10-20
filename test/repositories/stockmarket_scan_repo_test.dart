import 'package:fitpage_assignment/stockmarket_scans/data_models/stockmarket_scan_data.dart';
import 'package:fitpage_assignment/stockmarket_scans/repositories/stockmarket_scan_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'stockmarket_scan_repo_test.mocks.dart';

@GenerateMocks([StockMarketScanRepo])
Future<void> main() async {
  late MockStockMarketScanRepo mockStockMarketScanRepo;

  setUp(() {
    mockStockMarketScanRepo = MockStockMarketScanRepo();
  });

  test('Getting StockMarket Scans Data from Api', () async {
    List<StockMarketScanData> list = [];

    when(mockStockMarketScanRepo.getStockMarketScansData())
        .thenAnswer((_) async {
      return list;
    });

    var response = await mockStockMarketScanRepo.getStockMarketScansData();

    expect(response, isA<List<StockMarketScanData>>());
    expect(response, list);
  });
}
