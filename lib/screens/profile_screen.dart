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
                      "${!model.isLoggedIn() ? "" : model.userData["a"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
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
