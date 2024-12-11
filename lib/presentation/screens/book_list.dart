import 'package:askbooks/Models/Model/Books.dart';
import 'package:askbooks/Provider/ApiNotifier.dart';
import 'package:askbooks/constants.dart';
import 'package:askbooks/presentation/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;


class BookList extends StatelessWidget {
  BookList({Key? key, required this.name}) : super(key: key);

  String name;

  final _random = math.Random();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.black),
        title: Text(
          name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Consumer<ApiNotifier>(
        builder: (context, value, child) {
          return FutureBuilder(
            future: value.searchBookData(searchBook: name),
            builder: (context, AsyncSnapshot<Books> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Opps! Try again later!"),
                );
              }
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: 35,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //childAspectRatio: 16 / 15,
                      crossAxisCount: 2,
                      mainAxisExtent: 260,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          // print(index);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        id: snapshot.data?.items?[index].id,
                                        boxColor: boxColors[_random.nextInt(7)],
                                      )));
                        },
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: LayoutBuilder(builder: (context, constraints) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: SizedBox(
                                    height: constraints.maxHeight / 2,
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: SizedBox(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image(
                                            height:
                                                constraints.maxHeight / 2,
                                            width: constraints.maxWidth / 2,
                                            image: NetworkImage(
                                                "${snapshot.data?.items![index].volumeInfo!.imageLinks!.thumbnail}"),
                                            fit: BoxFit.fill, // use this
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Not Found"}",
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                              fontSize:
                                                  constraints.maxWidth * 0.09,
                                            ),
                                      ),
                                      Text(
                                        "${snapshot.data?.items![index].volumeInfo?.title}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                                fontSize:
                                                    constraints.maxWidth * 0.09,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.black,
                ),
              );
            },
          );
        },
      ),
    );
  }
}