import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/provider/auth_provider.dart';
import 'package:provider_flutter/provider/count_provider.dart';
import 'package:provider_flutter/provider/example_one_provider.dart';
import 'package:provider_flutter/provider/favourite_provider.dart';
import 'package:provider_flutter/provider/theme_change_provider.dart';
import 'package:provider_flutter/screen/count_example.dart';
import 'package:provider_flutter/screen/dark_theme.dart';
import 'package:provider_flutter/screen/example_one.dart';
import 'package:provider_flutter/screen/favourite/favourite_screen.dart';
import 'package:provider_flutter/screen/login.dart';
import 'package:provider_flutter/screen/value_notify_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),

        ],
        child: Builder(
          builder: (BuildContext context) {
            final themeChanger = Provider.of<ThemeChanger>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter',
              themeMode: Provider.of<ThemeChanger>(context).themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                  primarySwatch: Colors.purple,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark
              ),
              home: LoginScreen(),
            );
          },
        ));
  }
}
