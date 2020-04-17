import 'package:flutter/material.dart';
import 'package:portfolioflutter/screens/CommonWidgets/Drawer.dart';
import 'package:portfolioflutter/screens/MainScreen.dart';
import 'package:portfolioflutter/screens/projectclass.dart';
import 'package:portfolioflutter/screens/projectdetails.dart';

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  List<ProjectClass> ls=[ProjectClass("Multi User Chat System","It was a basic chat system developed using JAVA Swing and Socket Programming.","images/java.png"),
  ProjectClass("MOVIE RECOMMENDATION SYSTEM USING PYTHON AND NEOJ GRAPH DATABASE","""In this I developed a movie recommendation system using various method such as collaborative filtering, content based filtering,Jaccard method etc. and using graph database Neo4j. Python was used as a primary language. Py2neo library was used to interact with database and MovieLens Dataset was used.""","images/recom.png"),
  ProjectClass("DATA ANALYSIS PROJECTS",""" Worked on various Datasets such as Breast Cancer
Dataset,Global Superstore Dataset,Student graduating Datasets
etc.It involved extracting insights from data using data
visualisation,data preparation,data cleaning .""", "images/ds.jpg"),
ProjectClass("MACHINE LEARNING PROJECTS","""
Prediction of the prices of flights, fees of the doctors, salaries of
data scientists, chances of breast cancer, survival chances of
titanic passengers, cuisines by analyzing the ingredients. All
these involved algorithms like SVM, K-Neighbors, KMeans,
XGBoost,Mean-Shift, Neural Networks, Linear and
Logistic Regression, Random Forest,PCA analysis etc.""","images/ml.jpg")
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
    appBar: AppBar(actions: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen())); },)
      ],centerTitle: true,automaticallyImplyLeading: true,title: Text("PROJECTS"),backgroundColor: Colors.black,elevation: 2,), 
    drawer:MainDrawer(),
    body:ListView.builder(itemBuilder: (BuildContext context, int index) { 
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(color:Colors.amber,child: Column(children: <Widget>[
          Container(height:MediaQuery.of(context).size.height/4,width:MediaQuery.of(context).size.width,child: Image.asset(ls[index].imageurl,fit: BoxFit.contain,)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(ls[index].title,textAlign: TextAlign.center,style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
          ),
          Text(ls[index].description,overflow: TextOverflow.ellipsis,style: TextStyle(color:Colors.pink,fontSize: 15,fontWeight: FontWeight.bold))
        ,Center(child:RaisedButton(child:Text("Read More"),onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ProjectDetails(projectclass: ls[index],)));
        },color: Colors.black,textColor: Colors.pink,))
        ],),),
      
      );
     },itemCount: ls.length,),
    );
  }
}