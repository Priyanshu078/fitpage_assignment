import 'package:fitpage_assignment/cubits/stockmarket_scan_cubit/stockmarket_scan_cubit.dart';
import 'package:fitpage_assignment/pages/stockmarket_scan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockMarketScanCubit()..loadScanDataFromApi(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StockMarketScanPage(),
      ),
    );
  }
}
