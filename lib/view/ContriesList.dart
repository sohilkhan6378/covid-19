import 'package:flutter/material.dart';

import '../Services/State_Services.dart';
import 'CountryDetailScreen.dart';
class ContrieslistData extends StatefulWidget {
  const ContrieslistData({super.key});

  @override
  State<ContrieslistData> createState() => _ContrieslistDataState();
}

class _ContrieslistDataState extends State<ContrieslistData> {

  TextEditingController CountryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
     backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text("Coutries Record"),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
                child: TextFormField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  controller: CountryController,
                  onChanged: (value){
                    setState(() {
              
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search With Country Name",
                    hintStyle: TextStyle(
                      color: Colors.grey
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                        style: BorderStyle.solid,
                      )
                    ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                            style: BorderStyle.solid,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                            style: BorderStyle.solid,
                          )
                      )
                  ),
                ),
              ),
            ),
            Expanded(child: FutureBuilder(future: stateServices.CoutriesDataApi(), builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(color: Colors.blue,),);
              }else{
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {

                    String name = snapshot.data![index]["country"];
                    if(CountryController.text.isEmpty){

                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Countrydetailscreen(
                            name: snapshot.data![index]["country"],
                            image:  snapshot.data![index]["countryInfo"]["flag"],
                            totalcases: snapshot.data![index]["cases"],
                            totaldeath: snapshot.data![index]["todayDeaths"],
                            totalrecoverd: snapshot.data![index]["recovered"],
                            active: snapshot.data![index]["active"],
                            critical: snapshot.data![index]["critical"],
                            todayrecovered: snapshot.data![index]["todayRecovered"],
                            test: snapshot.data![index]["tests"],




                          ),));
                        },
                        child: Column(
                          children: [
                            GestureDetector(
                              child: ListTile(
                                title: Text("${snapshot.data![index]["country"]}", style: TextStyle(
                                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold
                                ),),
                                subtitle: Text("${snapshot.data![index]["cases"]}", style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w400,fontSize: 16

                                ),),
                                leading: Image(image: NetworkImage(
                                  snapshot.data![index]["countryInfo"]["flag"],
                                ),
                                  height: 60, width: 60,),
                              ),
                            )
                          ],
                        ),
                      );
                    }else if(name.toLowerCase().contains(CountryController.text.toLowerCase())){

                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Countrydetailscreen(
                            name: snapshot.data![index]["country"],
                            image:  snapshot.data![index]["countryInfo"]["flag"],
                            totalcases: snapshot.data![index]["cases"],
                            totaldeath: snapshot.data![index]["todayDeaths"],
                            totalrecoverd: snapshot.data![index]["recovered"],
                            active: snapshot.data![index]["active"],
                            critical: snapshot.data![index]["critical"],
                            todayrecovered: snapshot.data![index]["todayRecovered"],
                            test: snapshot.data![index]["tests"],




                          ),));
                        },
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("${snapshot.data![index]["country"]}", style: TextStyle(
                                color: Colors.white,
                              ),),
                              subtitle: Text("${snapshot.data![index]["cases"]}", style: TextStyle(
                                color: Colors.white
                              ),),
                              leading: Image(image: NetworkImage(
                                snapshot.data![index]["countryInfo"]["flag"],
                              ),
                                height: 60, width: 60,),
                            )
                          ],
                        ),
                      );
                    }else{

                      return Container();
                    }

                },
                );
              }

            }))
          ],
        ),
      ),
    );
  }
}
