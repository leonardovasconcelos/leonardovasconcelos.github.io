import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../screens/login_screen.dart';
import '../tiles/order_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfilersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
      height: 140.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Nome: ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "E-mail: ${!model.isLoggedIn() ? "" : model.userData["email"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Data de Nascimento: ${!model.isLoggedIn() ? "" : model.userData["date"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Endereço: ${!model.isLoggedIn() ? "" : model.userData["address"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    GestureDetector(
                      child: Text(
                        !model.isLoggedIn() ? "Entre ou cadastre-se >" : "Sair",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        if (!model.isLoggedIn())
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        else
                          model.signOut();
                      },
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
