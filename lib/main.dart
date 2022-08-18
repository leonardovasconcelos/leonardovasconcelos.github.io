import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../models/cart_model.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/user_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _inicialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<CartModel>(
            model: CartModel(model),
            child: MaterialApp(
                title: "Loja Fictícia",
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    primaryColor: Colors.purple[200]),
                debugShowCheckedModeBanner: false,
                home: FutureBuilder(
                    future: _inicialization,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print("Error");
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return HomeScreen();
                      }
                      return CircularProgressIndicator();
                    })),
          );
        },
      ),
    );
  }
}
