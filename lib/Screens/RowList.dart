import 'package:bookstore/Screens/ItemDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RowList extends StatefulWidget {
  const RowList({super.key});

  @override
  State<RowList> createState() => _RowListState();
}

class _RowListState extends State<RowList> {
  final CollectionReference _booklist =
      FirebaseFirestore.instance.collection('books');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: StreamBuilder(
        stream: _booklist.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            print(snapshot);
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  if (index != 0 &&
                      index != 1 &&
                      index != 2 &&
                      index != 3 &&
                      index != 4) {
                    return ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemsDetails(
                                        documentSnapshot: documentSnapshot)));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                            ),
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black12,
                              image: DecorationImage(
                                image: NetworkImage(documentSnapshot['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                });
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
