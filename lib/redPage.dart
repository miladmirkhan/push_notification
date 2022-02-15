import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  const RedPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(padding: EdgeInsets.all(18.0),
      child: Center(child: Text("This is the redPage",style: TextStyle(fontSize: 45),),),)
    );
  }
}