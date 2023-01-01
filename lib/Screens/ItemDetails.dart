// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookstore/Screens/RowList.dart';
import 'package:bookstore/Screens/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';

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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16, 16, 16, 16),
                        child: Hero(
                          tag: 'mainImage',
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              documentSnapshot['image'],
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              documentSnapshot['title'],
                              style: AppTheme.of(context).title1,
                            ),
                            const Icon(Icons.bookmark)
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                        child: Text(
                          'by ' +
                              documentSnapshot['author'] +
                              ' . ' +
                              documentSnapshot['type'],
                          textAlign: TextAlign.start,
                          style: AppTheme.of(context).subtitle1,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                        child: Row(
                          children: [
                            RatingBarIndicator(
                              rating: double.parse(
                                  documentSnapshot['stars'].toString()),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            Text(' ' + documentSnapshot['stars'].toString()),
                            const Text('     1256 reviews ')
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.reviews_outlined,
                                  size: 35.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.menu_book_outlined,
                                  size: 35.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.speaker_outlined,
                                  size: 35.0,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                            child: Divider(
                              thickness: 1,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                        child: Text(
                          'PRLOUGE',
                          style: AppTheme.of(context).title2,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                        child: ReadMoreText(
                          documentSnapshot['prolouge'],
                          trimLines: 5,
                          colorClickableText: Colors.lightBlue,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          style: AppTheme.of(context).bodyText2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                        child: Text(
                          'Similar Books',
                          style: AppTheme.of(context).title1,
                        ),
                      ),
                      const RowList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
