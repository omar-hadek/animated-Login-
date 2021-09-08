import 'package:animated_login_app/models/home_model.dart';
import 'package:flutter/material.dart';
import './login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeModel(),
    child: MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: LoginScreen(),
    ),
    );
  }
}