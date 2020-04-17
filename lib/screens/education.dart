import 'package:flutter/material.dart';
import 'package:portfolioflutter/screens/CommonWidgets/educationclass.dart';
import 'package:portfolioflutter/screens/MainScreen.dart';

import 'CommonWidgets/Drawer.dart';
class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  List<EducationClass> list=[EducationClass(titleText: "Senior Secondary",place: "Ryan International School",cgpa:"10",board: "CBSE",passingyear: "2015"),
  EducationClass(titleText: "Higher Secondary",place: "Ryan International School",cgpa:"94",board: "CBSE",passingyear: "2017"),
  EducationClass(titleText: "B.Tech",place: "Indian Institute Of Information Technology ,Bhopal",cgpa:"9.536",board: "CSE",passingyear: "2021")];
  @override
  Widget build(BuildContext context) {
     TextStyle textsty=TextStyle(color:Colors.white,fontSize:20,fontWeight: FontWeight.bold);
    return Scaffold(
      drawer:MainDrawer(),
    appBar: AppBar(actions: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen())); },)
      ],centerTitle: true,automaticallyImplyLeading: true,title: Text("Area Of Interests"),backgroundColor: Colors.black,elevation: 2,),       
    body:SafeArea(
          child: ListView.builder(itemBuilder: (BuildContext context, int index) { 
          return (index!=2)?Container(color:Colors.black,child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(color:Colors.pink,child: Column(children: <Widget>[
              Center(child: Text(list[index].titleText,style: textsty,),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("School: ",style: textsty),
                  Text(list[index].place,style: textsty)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Board: ",style: textsty),
                  Text(list[index].board,style: textsty)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  index==0?Text("CGPA: ",style: textsty):Text("Percentage: ",style: textsty),
                  index==0?Text(list[index].cgpa+"/10",style: textsty):Text( list[index].cgpa+"/100",style: textsty)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Passing Year: ",style: textsty),
                  Text(list[index].passingyear,style: textsty)
                ],),
              ),
            ],),),
          )):Container(color:Colors.black,child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(color:Colors.pink,child: Column(children: <Widget>[
              Center(child: Text(list[index].titleText,style: textsty),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("College: ",style: textsty),
                  Expanded(child: Text(list[index].place,style: textsty))
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Branch: ",style: textsty),
                  Text(list[index].board,style: textsty)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("CGPA: ",style: textsty),
                  Text(list[index].cgpa+"/10",style: textsty)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Passing Year: ",style: textsty),
                  Text(list[index].passingyear,style: textsty)
                ],),
              ),
            ],),),
          ));
         },itemCount: list.length,),
    )
    );
  }
}