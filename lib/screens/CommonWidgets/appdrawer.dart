import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return AppBar(centerTitle: true,automaticallyImplyLeading: true,title: Text("Welcome"),backgroundColor: Colors.black,elevation: 2,);
  }
}