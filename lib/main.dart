import 'package:flutter/material.dart';
import 'package:movies/layout/homeScreen.dart';
import 'package:movies/provider/bot_nav_bar_provider.dart';
import 'package:movies/screens/movie_detail_screen.dart';
import 'package:provider/provider.dart';

import 'mytheme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BotNavBarProvider(),
        ),
      ],
      child: MaterialApp(
        theme: MyTheme.DarkMode,
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.ROUTENAME,
        routes: {
          HomeScreen.ROUTENAME: (context) => HomeScreen(),
          MovieDetailsScreen.ROUTENAME: (context) => MovieDetailsScreen(),
        },
      ),
    );
  }
}
