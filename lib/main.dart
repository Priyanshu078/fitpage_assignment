import 'package:fitpage_assignment/stockmarket_scans/repositories/stockmarket_scan_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'stockmarket_scans/cubits/stockmarket_scan_cubit/stockmarket_scan_cubit.dart';
import 'stockmarket_scans/ui/stockmarket_scan_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => StockMarketScanRepo(),
      child: BlocProvider(
        create: (context) =>
            StockMarketScanCubit(context.read<StockMarketScanRepo>())
              ..loadScansData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StockMarketScanPage(),
        ),
      ),
    );
  }
}
