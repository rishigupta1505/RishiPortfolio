import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:portfolioflutter/screens/CommonWidgets/Drawer.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  
  List<String> im=["images/blackportrait.jpg","images/blackportrait2.jpg","images/hack.jpg"];
  List<String> content=["Hii,I'm Rishi Gupta.","I am presently pursuing Computer Science Engineering from Indian Institute Of Information Technology, Bhopal.","I am a Flutter Developer and Machine Learning enthusiast.","I like solving challenging algorithmic problems .I am a self motivated person.I like learning new Technologies and implement them.","My Machine Learing projects explores fields like object detection,Generative Adversarial Networks,Predictions,Data Visualisations.","I like developing apps using Flutter and have cloned UI's of many Apps and have designed my own UI's as well","I am Eagerly looking for Internship and if you find me worth it kindly contact me."];
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    final GlobalKey _scaffoldKey = new GlobalKey();
    return ScaffolMain(scaffoldKey: _scaffoldKey, im: im, width: width,content:content,height:height);
  }
}

class ScaffolMain extends StatelessWidget {
  const ScaffolMain({
    Key key,
    @required GlobalKey<State<StatefulWidget>> scaffoldKey,
    @required this.im,
    @required this.width,
    @required this.content,
    @required this.height,
  }) : _scaffoldKey = scaffoldKey, super(key: key);

  final GlobalKey<State<StatefulWidget>> _scaffoldKey;
  final List<String> im,content;
  final double width,height;

  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
          key: _scaffoldKey,
          drawer: MainDrawer(),
      appBar: AppBar(centerTitle: true,automaticallyImplyLeading: true,title: Text("Welcome"),backgroundColor: Colors.black,elevation: 2,),
      backgroundColor: Colors.black, // Color(0xFF120994),
        body:SafeArea(
                  child: CustomScrollView(slivers: <Widget>[
            SliverList(delegate: SliverChildListDelegate([
              OrientationBuilder(builder: (BuildContext context, Orientation orientation) { 
                return CarouselSlider.builder(scrollPhysics: ClampingScrollPhysics(),aspectRatio: orientation==Orientation.portrait?1.3:1,enlargeCenterPage: true,enableInfiniteScroll: true,autoPlay: true,itemCount: im.length, itemBuilder: (BuildContext context,int itemindex)=>Container(decoration:BoxDecoration(borderRadius:BorderRadius.only(bottomLeft:Radius.circular(0),bottomRight:Radius.circular(0))),width:width,child: Image.asset(im[itemindex],fit: BoxFit.contain,)));
               },
               )
              ,Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Container(width:100,height:100,child: FlareActor("images/intro.flr",animation: "coding",fit: BoxFit.contain)),
                  Text("About Me",style: TextStyle(fontSize:30,fontWeight:FontWeight.bold,color: Colors.pink),),
                   Container(width:100 ,height:100,child: FlareActor("images/intro.flr",animation: "coding",fit: BoxFit.contain))
                ],
              ),
                ),
              ),
              ListView.builder(itemBuilder: (BuildContext context, int index) { 
                return index%2==0?Align(child:Container(decoration:BoxDecoration(color: Colors.lightGreen,borderRadius: BorderRadius.all(Radius.circular(10))),width:width*0.5,child: Card(margin:EdgeInsets.all(5),elevation:0,color: Colors.lightGreen,child:Text(content[index],style: TextStyle(fontSize:20,color:Colors.white),))),alignment: Alignment.centerLeft,):Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(child:Container(decoration:BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.all(Radius.circular(10))),width:width*0.7,child: Card(margin:EdgeInsets.all(5),elevation: 0,color: Colors.pink,child:Text(content[index],style: TextStyle(fontSize:20,color:Colors.white)),)),alignment: Alignment.centerRight),
                );
               },itemCount: content.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),
                Container(width:100,height:100,child: FlareActor("images/BeerToast.flr",animation: "beer",fit: BoxFit.contain,isPaused:false ,))
            ]))
          ],),
        )
        );
  }
}
