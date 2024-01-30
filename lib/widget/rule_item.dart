import 'dart:io';

import 'package:flutter/material.dart';
import 'package:road_rules/model/sign.dart';

class RuleItem extends StatelessWidget {
  const RuleItem({super.key, required this.onClick, required this.sign});
  final void Function() onClick;
  final Sign? sign;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade100,
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.file(File(sign?.image ?? ""))),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text("${sign?.name}",style: const TextStyle(color: Colors.black,fontSize: 20),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
