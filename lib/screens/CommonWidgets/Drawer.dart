import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:portfolioflutter/screens/Contact.dart';
import 'package:portfolioflutter/screens/education.dart';
import 'package:portfolioflutter/screens/project.dart';

import '../Skills.dart';
import '../areaofinterest.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var drawtextStyle = TextStyle(color:Colors.pink,fontSize: 20);
    return Drawer(child: ListView(
            
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(color:Colors.black,child: DrawerHeader(child: Column(
                children: <Widget>[
                  Center(child: Text("Know More About Me",style: TextStyle(color:Colors.pink,fontSize:20),),),
                  Container(width:100,height:100,child: FlareActor("images/Meteor.flr",animation: "Idle",fit: BoxFit.contain,isPaused:false ,))
                ],
              ))),
          ListTile(title: Text("Education",style: drawtextStyle,),onTap: ()=>{
            Navigator.pop(context),
            Navigator.push(context,MaterialPageRoute(builder: (context) => Education()),
  )
          },),
          ListTile(title: Text("Skills",style: drawtextStyle),onTap: ()=>{
            Navigator.pop(context),
            Navigator.push(context,MaterialPageRoute(builder: (context) => Skills()),
  )
          }),
          ListTile(title: Text("Projects",style: drawtextStyle),onTap: ()=>{
            Navigator.pop(context),
            Navigator.push(context,MaterialPageRoute(builder: (context) => Project()),
  )
          }),
          ListTile(title: Text("Area Of Interests",style: drawtextStyle),onTap: ()=>{
            Navigator.pop(context),
            Navigator.push(context,MaterialPageRoute(builder: (context) => AOI()),
  )
          }),
          ListTile(title: Text("Contact Me",style: drawtextStyle),onTap: ()=>{
            Navigator.pop(context),
            Navigator.push(context,MaterialPageRoute(builder: (context) => Contact()),
  )
          })

      ],),);
  }
}