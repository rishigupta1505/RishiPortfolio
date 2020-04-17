import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:portfolioflutter/screens/MainScreen.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:StackImage()
    );
  }
}

class StackImage extends StatefulWidget {
  @override
  _StackImageState createState() => _StackImageState();
}

class _StackImageState extends State<StackImage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controllertext;
  AnimationController _controllertext1;
  Animation<Color> _animation;
  Animation<double> _trans;
  Animation<double> _trans1;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration:const Duration(seconds:4),vsync: this);
    _controllertext = AnimationController(duration:const Duration(seconds:4),vsync: this);
    _controllertext1 = AnimationController(duration:const Duration(seconds:4),vsync: this);
    _animation=ColorTween(begin: Colors.white,end:Colors.yellow,).animate(_controller)..addStatusListener((status) {if(status==AnimationStatus.completed ){
      _controller.reverse();

    }else if(status==AnimationStatus.dismissed){
      _controller.forward();
    }});
    _trans=Tween(begin: 1.0,end:0.0).animate(CurvedAnimation(parent: _controllertext, curve: Curves.fastOutSlowIn));
    _trans1=Tween(begin: -1.0,end:0.0).animate(CurvedAnimation(parent: _controllertext1, curve: Curves.fastOutSlowIn));
    _controllertext1.forward();
    _controllertext.forward();
   _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
                  child: ListView(children: <Widget>[
            Container(child: ShaderMask(shaderCallback: (Rect bounds) => LinearGradient(colors: [Color(0xFF2980B9),Color(0xFF6DD5FA),Color(0xFFFFFFFF)],begin:Alignment.topLeft,end:Alignment.bottomRight,tileMode:TileMode.clamp ).createShader(bounds) ,
            child: ClipPath(clipper:MyCustomclipper(),child: Image.asset("images/blur.jpg",fit:BoxFit.fill,))),width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height/1.5)
          ,
      AnimatedBuilder(
                animation: _trans,
                builder: (BuildContext context, Widget child) {return Transform(
                  transform: Matrix4.translationValues(_trans.value *MediaQuery.of(context).size.width, 0, 0),
                  child: ShaderMask(shaderCallback: (Rect bounds) =>LinearGradient(colors: [Color(0xFF833ab4),Color(0xFFfd1d1d),Color(0xFFfcb045)],begin:Alignment.topLeft,end:Alignment.bottomRight,tileMode:TileMode.clamp ).createShader(bounds)  ,
            child: Center(child: Text("HELLO WORLD ",style: TextStyle(fontSize: 50.0,color: Colors.blue,fontWeight: FontWeight.bold),),)),
          ) ; },
                 
      ),
          AnimatedBuilder(
                animation: _trans1,
                builder: (BuildContext context, Widget child) {return Transform(
                  transform: Matrix4.translationValues(_trans1.value *MediaQuery.of(context).size.width, 0, 0),
                  child: ShaderMask(shaderCallback: (Rect bounds) =>LinearGradient(colors: [Color(0xFF833ab4),Color(0xFFfd1d1d),Color(0xFFfcb045)],begin:Alignment.topLeft,end:Alignment.bottomRight,tileMode:TileMode.clamp ).createShader(bounds)  ,
            child: Center(child: Text("I'm RISHI GUPTA ",style: TextStyle(fontSize: 30.0,color: Colors.blue,fontWeight: FontWeight.bold),),)),
          ) ; },
                 
      ),
           Padding(
             padding: const EdgeInsets.only(top:20),
             child: AnimatedBuilder(
                          animation: _animation,
                           builder: (BuildContext context, Widget child) { 
                             return CupBut(animation: _animation);
                           },
             )
           )
          ],),
        )
        ,
       
        
        
      )
    );
  }
}

class CupBut extends StatelessWidget {
  const CupBut({
    Key key,
    @required Animation<Color> animation,
  }) : _animation = animation, super(key: key);

  final Animation<Color> _animation;

  @override
  Widget build(BuildContext context) {
    return Center(child: CupertinoButton(child: Text("View Profile",style: TextStyle(color:_animation.value),),color: Colors.black,onPressed: ()=>{
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MainScreen()),
  )
               },),);
  }
}


class MyCustomclipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    Path path=Path();
   path.lineTo(0.0, size.height);
   // path.quadraticBezierTo(size.width/2, size.height-40, size.height, size.width);
    path.cubicTo(size.width/3, size.height, 2*size.width/3, size.height*0.7, size.width, size.height*0.85);
    path.lineTo(size.width,0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
   return false;
  }

}