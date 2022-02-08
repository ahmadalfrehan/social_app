import 'package:chat/laouts/social_layout_app.dart';
import 'package:chat/login/login_screen.dart';
import 'package:chat/sharedHELper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Shard.initial();
  Shard.saveData(key: "sss", value: "Ahmad");
  String ?s;
  uId = Shard.sharedprefrences!.getString('uId');
  print(uId);
  Widget widget;
  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  Widget widget;
  MyApp(this.widget);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(this.widget),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget widget;
  MyHomePage(this.widget);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: widget,
    );
  }
}
