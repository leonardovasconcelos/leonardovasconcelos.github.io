import 'package:flutter/material.dart';
import '../models/cart_model.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
                home: HomeScreen()),
          );
        },
      ),
    );
  }
}
