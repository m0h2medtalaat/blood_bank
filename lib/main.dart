import 'package:bloodbank/utilities/donation_data.dart';
import 'package:bloodbank/utilities/user_data.dart';
import 'package:flutter/material.dart';
import 'package:bloodbank/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:bloodbank/utilities/article_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ArticleData(),
        ),
        ChangeNotifierProvider(
          create: (context) => DonationData(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
