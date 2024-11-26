import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/WorldStateModel.dart';
import 'Utilities/app_url.dart';
class StateServices{
  
  // var data;
  Future<WorldStateModel> fetchWorldStateRecords() async{
    final response = await http.get(Uri.parse(AppUrl.WorldStateApi));
    if(response.statusCode == 200){
     var  data = jsonDecode(response.body);
      print(data);
      return WorldStateModel.fromJson(data);
    }else{
      throw Exception("error");
    }
  }


  Future<List<dynamic>> CoutriesDataApi() async{
    var value;
    final response = await http.get(Uri.parse(AppUrl.CoutriesList));
    if(response.statusCode == 200){
      value = jsonDecode(response.body);
      return value;
    }else{
      throw Exception("error");
    }
  }
}