import 'package:flutter/material.dart';

class GreenPage extends StatelessWidget {
  const GreenPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(padding: EdgeInsets.all(18.0),
      child: Center(child: Text("This is the greenPage",style: TextStyle(fontSize: 45),),),)
    );
  }
}