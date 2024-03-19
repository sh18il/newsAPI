import 'package:flutter/material.dart';
import 'package:news_api/controller/categories_provider.dart';
import 'package:provider/provider.dart';

import 'controller/provider.dart';
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