import 'package:fitpage_assignment/constants/colors.dart';
import 'package:fitpage_assignment/stockmarket_scans/data_models/stockmarket_scan_data.dart';
import 'package:fitpage_assignment/widgets/mytext.dart';
import 'package:flutter/material.dart';

class SubCriteriaDataPage extends StatelessWidget {
  const SubCriteriaDataPage(
      {super.key,
      required this.variableType,
      required this.myColors,
      required this.stockMarketScanData});

  final StockMarketScanData stockMarketScanData;
  final VariableType variableType;
  final MyColors myColors;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: variableType.type == 'value'
            ? ListView.separated(
                itemBuilder: (context, index) {
                  List<num> valuesList = List.from(variableType.values!);
                  if (stockMarketScanData.tag == 'Bullish' &&
                      variableType.type == 'value') {
                    valuesList.sort((a, b) => b.compareTo(a));
                  } else if (stockMarketScanData.tag == 'Bearish' &&
                      variableType.type == 'value') {
                    valuesList.sort((a, b) => a.compareTo(b));
                  }
                  if (index == valuesList.length) {
                    return Container();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyText(
                        text: valuesList[index].toString(),
                        color: myColors.white,
                        fontSize: 25,
                        wantDecoration: false,
                      ),
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: myColors.white,
                    thickness: 1,
                  );
                },
                itemCount: variableType.values!.length + 1)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      text: variableType.studyType!.toUpperCase(),
                      color: myColors.white,
                      fontSize: 40,
                      wantDecoration: false),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  MyText(
                      text: 'Set Parameters',
                      color: myColors.white,
                      fontSize: 25,
                      wantDecoration: false),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: myColors.white,
                    height: height * 0.2,
                    width: width,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: "Period",
                            color: myColors.black,
                            fontSize: 14,
                            wantDecoration: false,
                          ),
                          SizedBox(
                            width: width * 0.5,
                            height: height * 0.04,
                            child: Material(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: myColors.black)),
                                ),
                                initialValue:
                                    variableType.defaultValue.toString(),
                              ),
                            ),
                          )
                        ]),
                  )
                ],
              ),
      ),
    );
  }
}
