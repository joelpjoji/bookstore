// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:bookstore/Screens/ItemDetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference _booklist =
      FirebaseFirestore.instance.collection('books');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1.28,
        child: Column(
          children: [
            const SearchBar(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Discover',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(255, 92, 92, 92)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: StreamBuilder(
                stream: _booklist.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.hasData) {
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
                                                documentSnapshot:
                                                    documentSnapshot)));
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
                                        image: NetworkImage(
                                            documentSnapshot['image']),
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
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Top',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color.fromARGB(255, 92, 92, 92)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('More →'),
                ),
              ],
            ),
            Flexible(
              flex: 1,
              child: StreamBuilder(
                stream: _booklist.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          return Row(children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemsDetails(
                                            documentSnapshot:
                                                documentSnapshot)));
                              },
                              child: SizedBox(
                                width: 160,
                                height: 300,
                                child: GFCard(
                                  color:
                                      const Color.fromARGB(255, 234, 246, 255),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  boxFit: BoxFit.fill,
                                  borderRadius: BorderRadius.circular(15.0),
                                  titlePosition: GFPosition.end,
                                  image: Image.network(
                                    documentSnapshot['image'],
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  showImage: true,
                                  content: GFListTile(
                                    margin: const EdgeInsets.all(0),
                                    padding: const EdgeInsets.all(0),
                                    titleText: documentSnapshot['title'],
                                    subTitleText:
                                        'by' + documentSnapshot['author'],
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        });
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color.fromARGB(255, 92, 92, 92)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('More →'),
                ),
              ],
            ),
            Flexible(
              flex: 1,
              child: StreamBuilder(
                stream: _booklist.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          if (index != 0 && index != 1 && index != 2) {
                            return Row(children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ItemsDetails(
                                              documentSnapshot:
                                                  documentSnapshot)));
                                },
                                child: SizedBox(
                                  width: 160,
                                  height: 300,
                                  child: GFCard(
                                    color: const Color.fromARGB(
                                        255, 234, 246, 255),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 5),
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxFit: BoxFit.fill,
                                    titlePosition: GFPosition.end,
                                    image: Image.network(
                                      documentSnapshot['image'],
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    showImage: true,
                                    content: GFListTile(
                                      margin: const EdgeInsets.all(0),
                                      padding: const EdgeInsets.all(0),
                                      titleText: documentSnapshot['title'],
                                      subTitleText:
                                          'by' + documentSnapshot['author'],
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                          } else {
                            return const SizedBox();
                          }
                        });
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(20.0),
        child: CupertinoSearchTextField(
          backgroundColor: Colors.white,
          placeholder: 'Type book name or author',
        ));
  }
}
