
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_rules/db/sql_helper.dart';
import 'package:road_rules/page/detail_page.dart';
import 'package:road_rules/widget/rule_item.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Road Rules"),
        ),
        body: FutureBuilder(
          future: SqlHelper.getAllSigns(),
          builder: (context, snapshot) {
            if(snapshot.data != null && snapshot.data?.isNotEmpty == true) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) => OpenContainer(
                  openColor: Colors.transparent,
                //  closedColor: Colors.transparent,
                  closedBuilder: (context, invoke) => RuleItem(sign: snapshot.data?[index],onClick: invoke),
                  openBuilder: (context, invoke) => DetailPage(sign: snapshot.data?[index]),
                ),
              );
            } else {
              return const Center(child: CupertinoActivityIndicator(),);
            }
          },
        ),
      );
    }
  }
