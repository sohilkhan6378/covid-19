import 'package:covid_tracker_app/view/HomeScreen.dart';
import 'package:flutter/material.dart';
class Countrydetailscreen extends StatefulWidget {
  String name;
  String image;
  int totalcases, totaldeath,totalrecoverd,active,critical,todayrecovered,test;
  Countrydetailscreen({
    required this.name,
    required this.image,
    required this.totalcases,
    required this.totaldeath,
    required this.totalrecoverd,
    required this.active,
    required this.critical,
    required this.todayrecovered,
    required this.test,
  });
  @override
  State<Countrydetailscreen> createState() => _CountrydetailscreenState();
}

class _CountrydetailscreenState extends State<Countrydetailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          centerTitle: true,
          backgroundColor: Colors.yellowAccent,
        ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*.06 ,),
                        ReusableRow(title: "TotalCases", value: widget.totalcases.toString()),
                        ReusableRow(title: "Totaldeath", value: widget.totaldeath.toString()),
                        ReusableRow(title: "Totalrecoverd", value: widget.totalrecoverd.toString()),
                        ReusableRow(title: "active", value: widget.active.toString()),
                        ReusableRow(title: "critical", value: widget.critical.toString()),
                        ReusableRow(title: "todayrecovered", value: widget.todayrecovered.toString()),
                        ReusableRow(title: "test", value: widget.test.toString()),
        
        
        
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
