import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/screens/home-screen.dart';
import 'package:todos_app/providers/todos-provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        title: 'Flutter Apps',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
