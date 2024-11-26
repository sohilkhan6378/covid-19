import 'package:covid_tracker_app/Model/WorldStateModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Services/State_Services.dart';
import 'ContriesList.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({super.key});

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();

  }

  final ColorList = <Color>[
    const Color(0xff4285F4),

    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: Text("World Covid-19 Record"),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              FutureBuilder(
                  future: stateServices.fetchWorldStateRecords(),
                  builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                          child: SpinKitCircle(
                        color: Colors.white,
                        controller: _controller,
                      ));
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "Total":
                                  double.parse(snapshot.data!.cases.toString()),
                              "Recovered": double.parse(
                                  snapshot.data!.recovered.toString()),
                              "Deaths":
                                  double.parse(snapshot.data!.deaths.toString()),
                              // "Active":  double.parse(snapshot.data!.active.toString()),
                              // "Pending":  double.parse(snapshot.data!.todayCases.toString())
                            },
                            animationDuration: Duration(seconds: 3),
                            chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            chartType: ChartType.ring,
                            colorList: ColorList,
                            centerText: "Covide 19 \n Result",
                            legendOptions: LegendOptions(
                                legendPosition: LegendPosition.left),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * .04),
                            child: Card(
                              child: Column(
                                children: [
                                  ReusableRow(
                                      title: "Total",
                                      value: snapshot.data!.cases.toString()),
                                  ReusableRow(
                                      title: "Recovered",
                                      value: snapshot.data!.recovered.toString()),
                                  ReusableRow(
                                      title: "Death",
                                      value: snapshot.data!.deaths.toString()),
                                  ReusableRow(
                                      title: "TodayCases",
                                      value: snapshot.data!.critical.toString()),
                                  ReusableRow(
                                      title: "TodayDeaths",
                                      value: snapshot.data!.todayRecovered
                                          .toString()),
                                  ReusableRow(
                                      title: "TodayActive",
                                      value: snapshot.data!.active.toString()),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ContrieslistData(),
                                  ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "TRACK COUNTRIES",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  }),
            ],
          ),
        )),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10, top: 20, bottom: 05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(value)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Divider(
                height: 1,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
