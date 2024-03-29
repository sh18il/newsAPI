import 'package:flutter/material.dart';
import 'package:news_api/controller/categories_controller.dart';
import 'package:news_api/controller/fetching_controller.dart';
import 'package:provider/provider.dart';

import 'controller/homescreen_controller.dart';
import 'view/home_sceen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => HomeScreenProvider(),),
            ChangeNotifierProvider(create: (context) => CategoriesProvider(),),
            ChangeNotifierProvider(create: (context) => ServiceProvider(),),
          ],
          child:
        MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    ),
    );
  }
}
