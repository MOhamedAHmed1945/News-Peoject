//import 'package:master/Models/profile_model.dart';
import 'package:master/Helper/hive_function_box.dart';
import 'package:master/Models/model_provider.dart';
import 'package:master/Views/Screens/intro_screen.dart';
import 'package:master/Views/Screens/nav_bar/nav_bar_screens/home_screen.dart';
import 'package:master/Views/Screens/nav_bar/main_navbar.dart';
import 'package:master/Views/Screens/nav_bar/nav_bar_screens/profile_screens/edit_profile_screen.dart';
import 'package:provider/provider.dart';
import 'Views/Screens/nav_bar/nav_bar_screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'Views/Screens/nav_bar/nav_bar_screens/profile_screens/profile_screen.dart';

void main() async {
  // await Hive.initFlutter();
  // Hive.registerAdapter(ProfileHiveModelAdapter());
  // await Hive.openBox(kProfileBox);
  await HiveFunctionBox.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        home: ProfileScreen(), // ProfileScreen(), //IntroScreen
        routes: {
          IntroScreen.introRoute: (context) => const IntroScreen(),
          MainNavBar.mainNavBarRoute: (context) => const MainNavBar(),
          HomeScreen.homeRoute: (context) => const HomeScreen(),
          EditeProfileScreen.editeProfileRoute: (context) =>
               EditeProfileScreen(),
          ProfileScreen.profileRoute: (context) => ProfileScreen(),
          CategoriesScreen.categoriesScreenRoute: (context) =>
              CategoriesScreen(),
          // DecorationCategoriesScreen.decorationCategoriesScreenRoute: (context) =>
          // DecorationCategoriesScreen(),
        },
      ),
    );
  }
}
