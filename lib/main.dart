import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meme_app/data/app_database.dart';
import 'package:meme_app/screens/homePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp( ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,  });

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

