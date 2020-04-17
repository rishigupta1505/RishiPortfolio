import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final List<String> s,s1;
  const SkillCard({
    Key key,
    @required this.s,
    @required this.s1
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var drawtextStyle = TextStyle(color:Colors.pink,fontSize: 20,fontWeight: FontWeight.bold);
 
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color:Colors.white,
              child: ListView.builder(padding: EdgeInsets.only(right:100),scrollDirection: Axis.horizontal,itemBuilder: (BuildContext context, int index) { 
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children:[
                Flexible(fit: FlexFit.tight,child: Image.asset(s1[index],fit: BoxFit.contain,)),
                Flexible(child: Center(child: Text(s[index],style: drawtextStyle,),))
              ]),
          );
            
            
             },itemCount: s.length,shrinkWrap: true,),
      ),
    );
  }
}