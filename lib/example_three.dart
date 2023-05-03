import 'dart:convert';

import 'package:apis/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserList() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: FutureBuilder(
          future: getUserList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('loading');
            } else {
              return ListView.builder(itemBuilder: (context, index) {
                return Card(
                  child: Column(children: [
                    Text(snapshot.data![index].name.toString()),
                    Text(snapshot.data![index].address!.geo!.lat.toString()),
                    Text(snapshot.data![index].company!.name.toString())
                  ]),
                );
              });
            }
          },
        ))
      ]),
    );
  }
}
