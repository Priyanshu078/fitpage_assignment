import 'package:fitpage_assignment/constants/colors.dart';
import 'package:fitpage_assignment/widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/stockmarket_scan_cubit/stockmarket_scan_cubit.dart';
import '../cubits/stockmarket_scan_cubit/stockmarket_scan_states.dart';
import 'criteria_data_page.dart';

class StockMarketScanPage extends StatelessWidget {
  StockMarketScanPage({super.key});

  final MyColors myColors = MyColors();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: myColors.backroundColor,
        body: BlocBuilder<StockMarketScanCubit, StockMarketScanStates>(
            builder: (context, state) {
          return state is DataLoaded
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == state.stockMarketScansList.length) {
                          return Container();
                        } else {
                          return SizedBox(
                            height: height * 0.08,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    height: height * 0.01,
                                    width: height * 0.01,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: myColors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CriteriaDataPage(
                                                  stockMarketScanData: state
                                                          .stockMarketScansList[
                                                      index],
                                                  myColors: myColors,
                                                )));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text: state
                                            .stockMarketScansList[index].name,
                                        color: myColors.white,
                                        fontSize: 18,
                                        wantDecoration: true,
                                        decorationColor: myColors.white,
                                      ),
                                      MyText(
                                        text: state
                                            .stockMarketScansList[index].tag,
                                        color: state.stockMarketScansList[index]
                                                    .color ==
                                                'red'
                                            ? myColors.red
                                            : myColors.green,
                                        fontSize: 14,
                                        wantDecoration: true,
                                        decorationColor: myColors.white,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        return LayoutBuilder(builder: (context, constraints) {
                          int count =
                              (constraints.maxWidth / (width * 0.005)).floor();
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                              height: height * 0.01,
                              width: width,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: count,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 1.0),
                                      child: Container(
                                        height: width * 0.005,
                                        width: width * 0.005,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: myColors.white,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        });
                      },
                      itemCount: state.stockMarketScansList.length + 1,
                    ),
                  ),
                )
              : state is ErrorState
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text: "Please check your internet connection",
                            color: myColors.white,
                            fontSize: 20,
                            wantDecoration: false,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                context
                                    .read<StockMarketScanCubit>()
                                    .loadScansData();
                              },
                              child: MyText(
                                text: "Retry",
                                color: myColors.white,
                                fontSize: 16,
                                wantDecoration: false,
                              ))
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator());
        }));
  }
}
