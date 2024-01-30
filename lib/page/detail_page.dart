import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_rules/db/sql_helper.dart';
import 'package:road_rules/model/sign.dart';

import 'main_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.sign});
  final Sign? sign;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sign?.name ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.file(File(sign?.image ?? ""),height: 250),
            const SizedBox(height: 20),
            Text(sign?.desc ?? ""),
            const SizedBox(height: 20),
            CupertinoButton(onPressed: () {
              SqlHelper.deleteSign(sign?.id).then((value) {
                // print('Deleted');
                // // ScaffoldMessenger.of(context)
                // //     .showSnackBar(const SnackBar(content: Text("Deleted")));
                Navigator.of(context)
                    .pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => const MainPage()), (route) => false);
              });
            },color: Colors.red,child: Text("Delete"),)
          ],
        ),
      ),
    );
  }
}
