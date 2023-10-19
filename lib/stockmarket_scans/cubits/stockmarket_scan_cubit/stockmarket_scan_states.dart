import 'package:equatable/equatable.dart';
import '../../data_models/stockmarket_scan_data.dart';

abstract class StockMarketScanStates extends Equatable {}

class DataLoading extends StockMarketScanStates {
  @override
  List<Object?> get props => [];
}

class DataLoaded extends StockMarketScanStates {
  final List<StockMarketScanData> stockMarketScansList;
  DataLoaded({required this.stockMarketScansList});

  @override
  List<Object?> get props => [];
}
