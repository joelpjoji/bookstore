import 'dart:collection';

import 'package:bookstore/Screens/BookCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(30.0),
              child: CupertinoSearchTextField(
                backgroundColor: Colors.white,
                placeholder: 'Type book name or author',
              )),
          Column(children: [
            const Text('Discover'),
          ]),
          Text('Top'),
          ...data.map(
            (e) => Expanded(
              child: Container(
                color: Colors.red,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Text("data");
                    },
                    separatorBuilder: (ctx, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 100),
              ),
            ),
          ),
          Text('recommended'),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: SingleChildScrollView(
                child: Card(
                  child: Text('data'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
