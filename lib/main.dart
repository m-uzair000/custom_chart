import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 15),
        child: const Center(
          child: ChartPage(),
        ),
      ),
    );
  }
}

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<ChartAttributes> attributesList = [
    ChartAttributes(
        name: "Wear",
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0)),
    ChartAttributes(
        name: "Comfort",
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0)),
    ChartAttributes(
        name: "Handling",
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0)),
    ChartAttributes(
        name: "Hygiene",
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0)),
  ];
  List<String> ratingList = [
    "Great",
    "Good",
    "Average",
    "Poor",
    "Bad",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: attributesList.map((e) => attributeItem(e)).toList(),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: longString(ratingList).length * 10,
                    height: ratingList.length * 50,
                    decoration: const BoxDecoration(
                      border: Border(
                        // right: BorderSide(
                        //   color: Colors.grey,
                        //   width: 1.0,
                        // ),
                        top: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        left: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      children: ratingList
                          .map(
                            (e) => Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              height: 50,
                              child: Center(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(e),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(
                    width: longString(ratingList).length * 10,
                    height: 1,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  height: ratingList.length * 50 + 50,
                  width: attributesList.length * 10 + 30,
                  decoration: const BoxDecoration(
                    border: Border(
                      // right: BorderSide(
                      //   color: Colors.grey,
                      //   width: 1.0,
                      // ),
                      top: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      // bottom: BorderSide(
                      //   color: Colors.grey,
                      //   width: 1.0,
                      // ),
                      left: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemBuilder: (_, i) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: attributesList.length * 10 + 30,
                            height: ratingList.length * 50 - 1,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: ratingList.length,
                              itemBuilder: (_, i) {
                                return SizedBox(
                                  width: attributesList.length * 10 + 30,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: attributesList
                                        .map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Container(
                                              width: 8,
                                              height: 40,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              decoration: BoxDecoration(
                                                color: e.color,
                                                borderRadius:
                                                    BorderRadius.circular(2.2),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            width: attributesList.length * 10 + 30,
                            height: 1,
                            decoration: const BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            )),
                          ),
                          SizedBox(
                            width: attributesList.length * 10 + 30,
                            child: Center(
                              child: Text(
                                "0${i + 1}-Jan 2024",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (_, i) {
                      return const VerticalDivider(
                        // endIndent: 49,
                        width: 1,
                        color: Colors.grey,
                      );
                    },
                    itemCount: 8,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget attributeItem(ChartAttributes item) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: item.color),
      ),
      const SizedBox(
        width: 8,
      ),
      Text(item.name),
      const SizedBox(
        width: 12,
      ),
    ],
  );
}

class ChartAttributes {
  String name;
  Color color;

  ChartAttributes({
    required this.name,
    required this.color,
  });
}

String longString(arr) {
  String longest = arr[0];
  for (var i = 1; i < arr.length; i++) {
    if (arr[i].length > longest.length) {
      longest = arr[i];
    }
  }
  return longest;
}
