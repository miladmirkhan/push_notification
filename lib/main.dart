import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notification/redPage.dart';
import 'package:push_notification/greenPage.dart';
import 'package:push_notification/services/local_notification_dervice.dart';

//top level
//resive message when app is in the backGround
//works in background on applecation where there open or close
Future<void> backGroundHandler(RemoteMessage message)async{
print(message.data.toString());//data
print(message.notification!.title);//tilte
}
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotification.initialize();
 await Firebase.initializeApp();

//it should be top level  not inside the class becouse its working in it's own tred
 FirebaseMessaging.onBackgroundMessage(backGroundHandler);
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
  void initState() {
    // TODO: implement initState
    super.initState();

  //give you the message on which user taps
  //openthe app from terminated state 
    FirebaseMessaging.instance.getInitialMessage().then((message){

if(message !=null){//in here message can be null, non null value 

   final routeFromMessage=message.data["route"];//fetch the route (firebase messageing custom data add route like red)
   Navigator.of(context).pushNamed(routeFromMessage); // this will push you to one of route that you spesified in firebase like red

}
       
    });//make onMessage work properly

    //foreground not in the background (only in app)
    FirebaseMessaging.onMessage.listen((message) { 
if(message.notification !=null){
      print(message.notification!.body);//we add null check becouse it can be null (shows the body)
      print(message.notification!.title);// (shows the title)
}

  LocalNotification.display(message);//display the notification as head up notification
    }); //stream that may contain data we have to listen
    
                      //app in background
   FirebaseMessaging.onMessageOpenedApp.listen((message) {//use when user tab on the notification (have to codition when app inbackground and open, and user tab on notification)
     //app in background 
    //user tab the notification
     final routeFromMessage=message.data["route"];//fetch the route (firebase messageing custom data add route like red)

      Navigator.of(context).pushNamed(routeFromMessage); // this will push you to one of route that you spesified in firebase like red
      print(routeFromMessage);
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(18.0),
      child: Center(child: Text("This is the homePage",style: TextStyle(fontSize: 45),),),)
    );
  }
}