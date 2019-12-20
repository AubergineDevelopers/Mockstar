import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:mockstar/providers/home.dart';
import 'package:mockstar/providers/details.dart';
import 'package:mockstar/screens/home/home.dart';
import 'package:mockstar/screens/details/details.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<DetailsProvider>(
          create: (context) => DetailsProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mockstar',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}
