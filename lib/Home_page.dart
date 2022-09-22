
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}
  
class _Home_pageState extends State<Home_page> {
   
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: Icon(Icons.home),
        title: Text('flutter 2'),
        actions: [Icon(Icons.search)]),
      body: _Buid_body,
    );
  }
}
get getData async{
   final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    // final Uri _url = Uri.parse('https://flutter.dev');
    // http.Response response = await http.get(_url);
    if(response.statusCode == 200){
      return response.body;
    }else{
      throw Exception("Error Code : ${response.statusCode}");
    }
  }
get _Buid_body { 
  return Container(
    alignment: Alignment.center,
    child: FutureBuilder<String>(
      future: getData,
      builder: (context, snapshot) {
        if(snapshot.hasError){
          print ("Error ${snapshot.error}");
          return Center(child: Text('Something wrong while loading......'),);
        }else{
          if(snapshot.connectionState == ConnectionState.done){
            print(snapshot.data);
            return Center(child: Text('Done'),);

          }else{
            return SpinKitCircle(color: Colors.red,);
          }
        }
      }
       ),
);
}