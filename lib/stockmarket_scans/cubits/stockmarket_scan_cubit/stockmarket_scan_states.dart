import 'package:fitpage_assignment/data/stockmarket_scan_data.dart';

class StockMarketScanStates {}

class DataLoading extends StockMarketScanStates {}

class DataLoaded extends StockMarketScanStates {
  final List<StockMarketScanData> stockMarketScansList;
  DataLoaded({required this.stockMarketScansList});
}
