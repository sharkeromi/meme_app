import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meme_app/data/app_database.dart';
import 'package:meme_app/screens/homePage.dart';

import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp( ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,  });
  //final AppDatabase database;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

