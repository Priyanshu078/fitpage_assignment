import 'package:fitpage_assignment/stockmarket_scans/repositories/stockmarket_scan_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data_models/stockmarket_scan_data.dart';
import 'stockmarket_scan_states.dart';

class StockMarketScanCubit extends Cubit<StockMarketScanStates> {
  StockMarketScanCubit(this._stockMarketScanRepo) : super(DataLoading());

  final StockMarketScanRepo _stockMarketScanRepo;

  Future<void> loadScanDataFromApi() async {
    emit(DataLoading());
    List<StockMarketScanData> stockMarketScansList =
        await _stockMarketScanRepo.getStockMarketScansData();
    emit(DataLoaded(stockMarketScansList: stockMarketScansList));
  }
}
