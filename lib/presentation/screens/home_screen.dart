
import 'package:askbooks/Provider/ThemeProvider.dart';
import 'package:askbooks/presentation/screens/book_list.dart';
import 'package:askbooks/presentation/widgets/books/adventure_books.dart';
import 'package:askbooks/presentation/widgets/books/anime_books.dart';
import 'package:askbooks/presentation/widgets/books/novel.dart';
import 'package:askbooks/presentation/widgets/books/popular_books.dart';
import 'package:askbooks/presentation/widgets/headline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/books/horror.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Container with Primary Color
            Container(
              height: height / 3.8,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                
              ),
              child: SafeArea(
                minimum: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ask Books",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Consumer<ThemeProvider>(
                          builder: (context, themeProvider, child) {
                            return Switch(
                              value: themeProvider.isDarkMode,
                              onChanged: (value) {
                                themeProvider.toggleTheme();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        // Add search logic here
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        child:const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Search for Books"),
                            Icon(Icons.search),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16), // Add spacing between sections

            // Most Popular Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Most Popular',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookList(name: "Fiction"),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8), // Add spacing below the title
            Container(
              height: height / 5.3,
              margin: const EdgeInsets.only(left: 16),
              child: const PopularBooks(),
            ),

            // Other Categories
            Headline(
              category: "Anime",
              showAll: "Anime",
            ),
            SizedBox(
              height: height / 3.4,
              child: const AnimeBooks(),
            ),
            Headline(
              category: "Action & Adventure",
              showAll: "Action & Adventure",
            ),
            SizedBox(
              height: height / 3.4,
              child: const AdevntureBooks(),
            ),
            Headline(
              category: "Novel",
              showAll: "Novel",
            ),
            SizedBox(
              height: height / 3.4,
              child: const NovelBooks(),
            ),
            Headline(
              category: "Horror",
              showAll: "Horror",
            ),
            SizedBox(
              height: height / 3.4,
              child: const HorrorBooks(),
            ),
          ],
        ),
      ),
    );
  }
}
