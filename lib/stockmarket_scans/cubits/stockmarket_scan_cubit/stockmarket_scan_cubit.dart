import 'package:fitpage_assignment/cubits/stockmarket_scan_cubit/stockmarket_scan_states.dart';
import 'package:fitpage_assignment/data/stockmarket_scan_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class StockMarketScanCubit extends Cubit<StockMarketScanStates> {
  StockMarketScanCubit() : super(DataLoading());

  Future<void> loadScanDataFromApi() async {
    var dio = Dio();
    List<StockMarketScanData> stockMarketScansList = [];
    String url = 'http://coding-assignment.bombayrunning.com/data.json';
    var response = await dio.get(url);
    var jsonData = response.data;
    for (int i = 0; i < jsonData.length; i++) {
      stockMarketScansList.add(StockMarketScanData.fromJson(jsonData[i]));
      print(jsonData[i]);
    }
    emit(DataLoaded(stockMarketScansList: stockMarketScansList));
  }
}
