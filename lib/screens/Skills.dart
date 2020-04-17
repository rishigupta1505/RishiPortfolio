import 'package:flutter/material.dart';
import 'package:portfolioflutter/screens/CommonWidgets/Drawer.dart';
import 'package:portfolioflutter/screens/CommonWidgets/skillcard.dart';
import 'package:portfolioflutter/screens/MainScreen.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  List<String> web=["HTML","CSS","JS","BOOTSTRAP","REATCJS","NODEJS"];
  List<String> app=["FLUTTER"];
  List<String> lang=["C","C++","Python"];
  List<String> ml=["TENSORFLOW","KERAS","NUMPY","PANDAS"];
  List<String> db=["MySQL","NEO4J"];
  List<String> webadd=["images/html.png","images/css.png","images/js.png","images/boot.png","images/react.png","images/node.png"];
  List<String> appadd=["images/flutter.png"];
  List<String> langadd=["images/c.png","images/cpp.png","images/python.jpg"];
  List<String> mladd=["images/tf.png","images/keras.png","images/numpy.png","images/pandas.png"];
  List<String> dbadd=["images/sql.png","images/neo.png"];
  @override
  Widget build(BuildContext context) {
    TextStyle textsty=TextStyle(color:Colors.pink,fontSize:20,fontWeight: FontWeight.bold);
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(actions: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen())); },)
      ],centerTitle: true,automaticallyImplyLeading: true,title: Text("Area Of Interests"),backgroundColor: Colors.black,elevation: 2,),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
                  child: CustomScrollView(slivers: <Widget>[
            SliverToBoxAdapter(child:Center(child:Text("LANGUAGES",style:textsty))),
            SliverList(delegate: SliverChildListDelegate([
              Container(height:200,child: SkillCard(s: lang, s1: langadd))
            ])),
             SliverToBoxAdapter(child:Center(child:Text("WEB DEVELOPMENT",style:textsty))),
            SliverToBoxAdapter(child: Container(height:200,child: SkillCard(s: web, s1: webadd)),),
            SliverToBoxAdapter(child:Center(child:Text("APP DEVELOPMENT",style:textsty))),
            SliverToBoxAdapter(child: Container(height:200,child: SkillCard(s: app, s1: appadd)),),
            SliverToBoxAdapter(child:Center(child:Text("MACHINE LEARNING",style:textsty))),
            SliverToBoxAdapter(child: Container(height:200,child: SkillCard(s: ml, s1: mladd)),),
            SliverToBoxAdapter(child:Center(child:Text("DATABASES",style:textsty))),
            SliverToBoxAdapter(child: Container(height:200,child: SkillCard(s: db, s1: dbadd)),),
          ],),
        ),
      )
    );
  }
}