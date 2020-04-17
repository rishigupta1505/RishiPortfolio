import 'package:flutter/material.dart';
import 'package:portfolioflutter/screens/MainScreen.dart';
import 'package:portfolioflutter/screens/projectclass.dart';

class ProjectDetails extends StatefulWidget {
  final ProjectClass projectclass;

  ProjectDetails({Key key,@required this.projectclass});
  @override
  _ProjectDetailsState createState() => _ProjectDetailsState(projectclass: projectclass);
}

class _ProjectDetailsState extends State<ProjectDetails> {
   final ProjectClass projectclass;
    _ProjectDetailsState({Key key, @required this.projectclass});
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
var drawtextStyle = TextStyle(color:Colors.pink,fontSize: 20);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(actions: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen())); },)
      ],centerTitle: true,automaticallyImplyLeading: true,title: Text("Project Details"),backgroundColor: Colors.black,elevation: 2,),
    body:ListView(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Center(child: Text(projectclass.title,style: TextStyle(color:Colors.amber,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
      ),
      Container(width:width,height:height/2,child: Image.asset(projectclass.imageurl,fit: BoxFit.contain,),),
      Center(child: Text("DESCRIPTION",style:TextStyle(color:Colors.pink,fontSize: 20,fontWeight: FontWeight.bold),),),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(child: Text(projectclass.description,style:drawtextStyle,textAlign: TextAlign.left,),),
      )

    ],)
    );
  }
}