import 'dart:collection';

import 'package:bookstore/Screens/BookCard.dart';
import 'package:bookstore/Screens/ItemDetails.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference booklist = FirebaseFirestore.instance.collection('books');

  late Stream<QuerySnapshot> bookitems;

  initState() {
    super.initState();
    bookitems = booklist.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: bookitems,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot querySnapshot = snapshot.data;
            print(querySnapshot.docs[0]["title"]);
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;
            print(documents[0]);
            List<Map> items = documents
                .map((e) => {
                      'image': e['image'],
                      'title': e['title'],
                      'author': e['author'],
                      'prolouge': e['prolouge'],
                      'star': e['star'],
                      'type': e['quantity'],
                    })
                .toList();

            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];
                  //REturn the widget for the list items
                  return ListTile(
                    title: Text('${thisItem['title']}'),
                    subtitle: Text('${thisItem['author']}'),
                  );
                });
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// void retrieve() {
//   FirebaseFirestore.instance.collection('books').get().then((value) => {
//         value.docs.forEach((results) {
//           print(results.data());
//         })
//       });
// }

class HomeContainer extends StatefulWidget {
  const HomeContainer({
    super.key,
    required this.document,
  });
  final QueryDocumentSnapshot<Object?> document;

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
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
          Expanded(
            child: Container(
              color: Colors.red,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Text(widget.document["title"]);
                  },
                  separatorBuilder: (ctx, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: 100),
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
