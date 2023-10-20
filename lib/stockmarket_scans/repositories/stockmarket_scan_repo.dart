import 'package:dio/dio.dart';
import 'package:fitpage_assignment/stockmarket_scans/data_models/stockmarket_scan_data.dart';

class StockMarketScanRepo {
  Future<List<StockMarketScanData>> getStockMarketScansData() async {
    var dio = Dio();
    String url = 'http://coding-assignment.bombayrunning.com/data.json';
    List<StockMarketScanData> stockMarketScansList = [];
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.data;
      for (int i = 0; i < jsonData.length; i++) {
        stockMarketScansList.add(StockMarketScanData.fromJson(jsonData[i]));
      }
      return stockMarketScansList;
    } else {
      return <StockMarketScanData>[];
    }
  }
}
