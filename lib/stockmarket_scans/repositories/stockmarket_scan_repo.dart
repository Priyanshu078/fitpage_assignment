import 'package:dio/dio.dart';
import 'package:fitpage_assignment/stockmarket_scans/data_models/stockmarket_scan_data.dart';

class StockMarketScanRepo {
  var dio = Dio();
  Future<List<StockMarketScanData>> getStockMarketScansData() async {
    String url = 'http://coding-assignment.bombayrunning.com/data.json';
    List<StockMarketScanData> stockMarketScansList = [];
    var response = await dio.get(url);
    var jsonData = response.data;
    for (int i = 0; i < jsonData.length; i++) {
      stockMarketScansList.add(StockMarketScanData.fromJson(jsonData[i]));
      print(jsonData[i]);
    }
    return stockMarketScansList;
  }
}
