// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemsDetails extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  const ItemsDetails({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(documentSnapshot['title']),
              Text(documentSnapshot['author']),
              Text(documentSnapshot['prolouge']),
              Text(documentSnapshot['type']),
            ],
          ),
        ),
      ),
    );
  }
}
