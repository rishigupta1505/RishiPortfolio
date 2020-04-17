

import 'package:flutter/material.dart';
import 'package:portfolioflutter/screens/CommonWidgets/Drawer.dart';
import 'package:portfolioflutter/screens/MainScreen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController textEditingController=TextEditingController();
  TextEditingController feedbackEditingController=TextEditingController();
  bool autoValidation=false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
     TextStyle textsty=TextStyle(color:Colors.white,fontSize:30,fontWeight: FontWeight.bold);
    return Scaffold(
      key:_scaffoldKey,
      backgroundColor: Colors.black,
      drawer:MainDrawer(),
      appBar:AppBar(actions: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => MainScreen())); },)
      ],centerTitle: true,automaticallyImplyLeading: true,title: Text("Contact Me"),backgroundColor: Colors.black,elevation: 2,),
    body:SafeArea(
          child: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(heightFactor: 0.6,child: Container(width:width,height:height*0.75,child: FlareActor("images/robot.flr",animation: "buscando",fit: BoxFit.contain,isPaused:false ,))),
        )
      ,
      Padding(
        padding: EdgeInsets.only(top:height*0.1),
        child: Card(color:Colors.pink,child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("GIVE SOME FEEDBACK",style: textsty,),),
          ),
          Form(key: _formKey,autovalidate: false,child: Column(children: <Widget>[
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(controller: textEditingController,autofocus: true,decoration: InputDecoration(filled: true,fillColor: Colors.white,hintText: "Name",border: OutlineInputBorder(borderSide: BorderSide(color:Colors.pink),),errorStyle: TextStyle(color:Colors.yellow,fontSize: 20,fontWeight: FontWeight.bold)),
            validator: (args){
              if(args.isEmpty)
              return "Name Field Can't Be Empty";
              else
              return null;
            },),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(controller:feedbackEditingController,maxLines: 10,autofocus: true,decoration: InputDecoration(filled: true,fillColor: Colors.white,hintText: "Feedback",border: OutlineInputBorder(borderSide: BorderSide(color:Colors.pink),),errorStyle: TextStyle(color:Colors.yellow,fontSize: 20,fontWeight: FontWeight.bold)),
            validator: (args){
              if(args.isEmpty)
              return "Feedback Field Can't Be Empty";
              else
              return null;
            },),
          
          )
          ],)),
          Center(child:RaisedButton(color: Colors.black,highlightColor: Colors.black,onPressed: () =>{ 
            autoValidation=true,
           if (_formKey.currentState.validate()) {
            _scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.green,content: Text("Feedback Sent"))),
            _launchURL(textEditingController.text,feedbackEditingController.text)
           }
           else{
             _scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text("Send Failed")))
           },},
          child: Text("Send",style: textsty,),))
        ],),),
      )
      
      ,Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(child: Row(children: <Widget>[
          Flexible(
                  child: Padding(
              padding: const EdgeInsets.only(left:1.0),
              child: Text("Email-id : ",style: TextStyle(color:Colors.pink,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          )
          ,Flexible(
                  child: Padding(
              padding: const EdgeInsets.only(left:2.0),
              child: Text("rishigupta1505@gmail.com",style: TextStyle(color:Colors.pink,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          )
        ],),),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(child: Row(children: <Widget>[
          Flexible(
                  child: Padding(
              padding: const EdgeInsets.only(left:1.0),
              child: Text("Phone No. : ",style: TextStyle(color:Colors.pink,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          )
          ,Flexible(
                  child: Padding(
              padding: const EdgeInsets.only(left:2.0),
              child: Text("8770712436",style: TextStyle(color:Colors.pink,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          )
        ],),),
      ),
      Container(
        height:110,
       
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:40.0),
            child: IconButton(icon: FaIcon(FontAwesomeIcons.whatsappSquare,size:70,color: Colors.green,), onPressed: () { 
             _launchURLwp();
             },),
          ),
           Padding(
            padding: const EdgeInsets.only(right:40.0),
            child: IconButton(icon: FaIcon(FontAwesomeIcons.instagramSquare,size:70,color: Colors.pink,), onPressed: () { 
              _launchURLusing("https://www.instagram.com/rishigupta1505/");
             },),
          ),
           Padding(
            padding: const EdgeInsets.only(right:40.0),
            child: IconButton(icon: FaIcon(FontAwesomeIcons.sms,size:70,color: Colors.blue,), onPressed: () {  
              _launchURLsms();
            },),
          ),
           Flexible(
                      child: Padding(
              padding: const EdgeInsets.only(left:10,right:40.0),
              child: IconButton(icon: FaIcon(FontAwesomeIcons.mobileAlt,size:70,color: Colors.white,), onPressed: () { 
                _launchURLtele();
               },),
          ),
           ),
          
          

        ],),
      )
      
      ],
      ),
    )
    );
  }
  _launchURL(String name,String feedback) async {
  try
  {var url = 'mailto:rishigupta1505@gmail.com?subject=Feedback from $name &body=$feedback';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch';
  }
  }
  catch(e)
  {
    AlertDialog(content: Text("WE WERE NOT ABLE TO SENT MAIL DUE TO SOME REASONS.PLEASE CHECK IF YOU DO HAVE THE MAIL APP"),);
  }
}
 _launchURLtele() async {
  try
  {var url = 'tel:+918770712436';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch';
  }
  }
  catch(e)
  {
    AlertDialog(content: Text("WE WERE NOT ABLE TO SENT MAIL DUE TO SOME REASONS.PLEASE CHECK IF YOU DO HAVE THE MAIL APP"),);
  }
}
 _launchURLwp() async {
  try
  {var url = 'whatsapp://send?phone=+918770712436&text=Hello';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch';
  }
  }
  catch(e)
  {
    AlertDialog(content: Text("WE WERE NOT ABLE TO SENT MAIL DUE TO SOME REASONS.PLEASE CHECK IF YOU DO HAVE THE MAIL APP"),);
  }
}

_launchURLsms() async {
  try
  {var url = 'sms:+918770712436';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch';
  }
  }
  catch(e)
  {
    AlertDialog(content: Text("WE WERE NOT ABLE TO SENT MAIL DUE TO SOME REASONS.PLEASE CHECK IF YOU DO HAVE THE MAIL APP"),);
  }
}
_launchURLusing(String url1) async {
  try
  {var url = '$url1';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch';
  }
  }
  catch(e)
  {
    AlertDialog(content: Text("WE WERE NOT ABLE TO SENT MAIL DUE TO SOME REASONS.PLEASE CHECK IF YOU DO HAVE THE MAIL APP"),);
  }
}
@override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textEditingController.dispose();
    feedbackEditingController.dispose();
    super.dispose();
  }
}