import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/redPage.dart';
import 'package:push_notification/greenPage.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Push notification",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(
        title: 'flutter example'),
        routes: {
          "red":(_)=>RedPage(),
          "Green":(_)=> GreenPage(),
        },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
   MyHomePage({ Key? key,required this.title }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(18.0),
      child: Center(child: Text("This is the homePage",style: TextStyle(fontSize: 45),),),)
    );
  }
}