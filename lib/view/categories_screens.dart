import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:news_api/controller/categories_controller.dart';
import 'package:provider/provider.dart';

import '../models/categories_news_model.dart';
import '../controller/fetching_controller.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final formate = DateFormat('MMM dd, yyyy');

  @override
  Widget build(BuildContext context) {
    log('categories');
    final provider = Provider.of<CategoriesProvider>(context, listen: false);
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.categoriesList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    provider.changeCategories(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Consumer<CategoriesProvider>(
                        builder: (context, pro, _) {
                      return Container(
                        decoration: BoxDecoration(
                            color: pro.categoryItem == pro.categoriesList[index]
                                ? Colors.blue
                                : const Color.fromARGB(255, 130, 130, 130),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                              child:
                                  Text(pro.categoriesList[index].toString())),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
          Consumer2<CategoriesProvider, ServiceProvider>(
              builder: (context, provi, newsView, _) {
            return Expanded(
              child: FutureBuilder<CategoriesNewsModel>(
                future: newsView.fetchCategoryApi(provi.categoryItem),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.black,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        DateTime dateTime = DateTime.parse(snapshot
                            .data!.articles![index].publishedAt
                            .toString());
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  imageUrl: snapshot
                                      .data!.articles![index].urlToImage
                                      .toString(),
                                  fit: BoxFit.cover,
                                  height: height * .18,
                                  width: width * .3,
                                  placeholder: (context, url) => const Center(
                                    child: SpinKitCircle(
                                      size: 50,
                                      color: Colors.black,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                height: height * .18,
                                padding:
                                    const EdgeInsets.only(left: 15, right: 10),
                                child: Column(
                                  children: [
                                    Text(snapshot.data!.articles![index].title
                                        .toString()),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(snapshot
                                            .data!.articles![index].source!.name
                                            .toString()),
                                        Text(formate.format(dateTime)),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
