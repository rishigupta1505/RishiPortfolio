import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolioflutter/screens/CommonWidgets/Drawer.dart';
import 'package:portfolioflutter/screens/MainScreen.dart';

class AOI extends StatefulWidget {
  @override
  _AOIState createState() => _AOIState();
}

class _AOIState extends State<AOI> {
  List<String> aoi=["GENERATIVE ADVERSARIAL NETWORKS","COMPUTER VISION","CROSS PLATFORM APP DEVELOPMENT","DATA ANALYSIS","FRONTEND WEB DEVELOPMENT"];
  @override
  Widget build(BuildContext context) {
    var drawtextStyle = TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: MainDrawer(),
      appBar: AppBar(actions: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen())); },)
      ],centerTitle: true,automaticallyImplyLeading: true,title: Text("Area Of Interests"),backgroundColor: Colors.black,elevation: 2,),
      body:SafeArea(
              child: ListView.builder(itemBuilder: (BuildContext context, int index) { 
          return Container(height:200,child: Center(child: Card(borderOnForeground: true,child:Center(child:Text(aoi[index],style:drawtextStyle,textAlign: TextAlign.center,)),color:index%2==0?Colors.pink:Colors.orange)));
         },itemCount: aoi.length,),
      )
);
  }
}