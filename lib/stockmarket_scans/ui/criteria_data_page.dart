import 'package:fitpage_assignment/constants/colors.dart';
import 'package:fitpage_assignment/stockmarket_scans/ui/sub_criteria_data_page.dart';
import 'package:fitpage_assignment/widgets/mytext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../data_models/stockmarket_scan_data.dart';

class CriteriaDataPage extends StatelessWidget {
  const CriteriaDataPage(
      {super.key, required this.stockMarketScanData, required this.myColors});

  final StockMarketScanData stockMarketScanData;
  final MyColors myColors;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: myColors.backroundColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              height: height * 0.2,
              width: width,
              color: myColors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: stockMarketScanData.name,
                    color: myColors.white,
                    fontSize: 25,
                    wantDecoration: false,
                  ),
                  MyText(
                    text: stockMarketScanData.tag,
                    color: stockMarketScanData.color == 'red'
                        ? myColors.red
                        : myColors.green,
                    fontSize: 18,
                    wantDecoration: false,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          8.0, index == 0 ? 0 : 8.0, 8.0, 8.0),
                      child: stockMarketScanData.criteriaList[index].type ==
                              'variable'
                          ? RichText(
                              text: TextSpan(
                                  children: stockMarketScanData
                                      .criteriaList[index].text
                                      .split(" ")
                                      .map((word) {
                              if (word == '\$1') {
                                return TextSpan(
                                  text: "(",
                                  children: [
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SubCriteriaDataPage(
                                                          variableType:
                                                              stockMarketScanData
                                                                  .criteriaList[
                                                                      index]
                                                                  .variable!
                                                                  .variable1!,
                                                          myColors: myColors,
                                                          stockMarketScanData:
                                                              stockMarketScanData,
                                                        )));
                                          },
                                        text: stockMarketScanData
                                                    .criteriaList[index]
                                                    .variable!
                                                    .variable1!
                                                    .type ==
                                                'value'
                                            ? stockMarketScanData
                                                .criteriaList[index]
                                                .variable!
                                                .variable1!
                                                .values![0]
                                                .toString()
                                            : stockMarketScanData
                                                .criteriaList[index]
                                                .variable!
                                                .variable1!
                                                .defaultValue!
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: myColors.darkBlue,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: myColors.darkBlue,
                                            decorationThickness: 2)),
                                    TextSpan(
                                        text: ") ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: myColors.darkBlue)),
                                  ],
                                  style: TextStyle(
                                      fontSize: 20, color: myColors.darkBlue),
                                );
                              } else if (word == '\$2') {
                                return TextSpan(
                                  text: "(",
                                  children: [
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SubCriteriaDataPage(
                                                          variableType:
                                                              stockMarketScanData
                                                                  .criteriaList[
                                                                      index]
                                                                  .variable!
                                                                  .variable2!,
                                                          myColors: myColors,
                                                          stockMarketScanData:
                                                              stockMarketScanData,
                                                        )));
                                          },
                                        text: stockMarketScanData
                                                    .criteriaList[index]
                                                    .variable!
                                                    .variable2!
                                                    .type ==
                                                'value'
                                            ? stockMarketScanData
                                                .criteriaList[index]
                                                .variable!
                                                .variable2!
                                                .values![0]
                                                .toString()
                                            : stockMarketScanData
                                                .criteriaList[index]
                                                .variable!
                                                .variable2!
                                                .defaultValue!
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: myColors.darkBlue,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: myColors.darkBlue,
                                            decorationThickness: 2)),
                                    TextSpan(
                                        text: ") ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: myColors.darkBlue)),
                                  ],
                                  style: TextStyle(
                                      fontSize: 20, color: myColors.darkBlue),
                                );
                              } else if (word == '\$3') {
                                return TextSpan(
                                  text: "(",
                                  children: [
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SubCriteriaDataPage(
                                                          variableType:
                                                              stockMarketScanData
                                                                  .criteriaList[
                                                                      index]
                                                                  .variable!
                                                                  .variable3!,
                                                          myColors: myColors,
                                                          stockMarketScanData:
                                                              stockMarketScanData,
                                                        )));
                                          },
                                        text: stockMarketScanData
                                                    .criteriaList[index]
                                                    .variable!
                                                    .variable3!
                                                    .type ==
                                                'value'
                                            ? stockMarketScanData
                                                .criteriaList[index]
                                                .variable!
                                                .variable3!
                                                .values![0]
                                                .toString()
                                            : stockMarketScanData
                                                .criteriaList[index]
                                                .variable!
                                                .variable3!
                                                .defaultValue!
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: myColors.darkBlue,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: myColors.darkBlue,
                                            decorationThickness: 2)),
                                    TextSpan(
                                        text: ") ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: myColors.darkBlue)),
                                  ],
                                  style: TextStyle(
                                      fontSize: 20, color: myColors.darkBlue),
                                );
                              } else if (word == '\$4') {
                                return TextSpan(
                                  text: "(",
                                  children: [
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SubCriteriaDataPage(
                                                          variableType:
                                                              stockMarketScanData
                                                                  .criteriaList[
                                                                      index]
                                                                  .variable!
                                                                  .variable4!,
                                                          myColors: myColors,
                                                          stockMarketScanData:
                                                              stockMarketScanData,
                                                        )));
                                          },
                                        text: stockMarketScanData
                                                    .criteriaList[index]
                                                    .variable!
                                                    .variable4!
                                                    .type ==
                                                'value'
                                            ? stockMarketScanData
                                                .criteriaList[index]
                                                .variable!
                                                .variable4!
                                                .values![0]
                                                .toString()
                                            : stockMarketScanData
                                                .criteriaList[index]
                                                .variable!
                                                .variable4!
                                                .defaultValue!
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: myColors.darkBlue,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: myColors.darkBlue,
                                            decorationThickness: 2)),
                                    TextSpan(
                                        text: ") ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: myColors.darkBlue)),
                                  ],
                                  style: TextStyle(
                                      fontSize: 20, color: myColors.darkBlue),
                                );
                              } else {
                                return TextSpan(
                                    text: "$word ",
                                    style: const TextStyle(fontSize: 20));
                              }
                            }).toList()))
                          : MyText(
                              text:
                                  stockMarketScanData.criteriaList[index].text,
                              color: myColors.white,
                              fontSize: 20,
                              wantDecoration: false),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyText(
                        text: "and",
                        color: myColors.white,
                        fontSize: 14,
                        wantDecoration: false,
                      ),
                    );
                  },
                  itemCount: stockMarketScanData.criteriaList.length),
            )
          ]),
        ),
      ),
    );
  }
}
