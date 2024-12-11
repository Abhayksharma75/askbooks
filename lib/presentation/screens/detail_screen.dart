import 'package:askbooks/Models/DetailModel/DetailModel.dart';
import 'package:askbooks/Provider/ApiNotifier.dart';
import 'package:askbooks/Provider/Wishlistprovider.dart';
import 'package:askbooks/constants.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.id, this.boxColor}) : super(key: key);

  var id;
  final Color? boxColor;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      body: Consumer<ApiNotifier>(
        builder: (context, value, child) {
          return widget.id != null
              ? FutureBuilder<DetailModel>(
                  future: value.showBookData(id: widget.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Check your Internet Connection"),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      final book = snapshot.data;

                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 350,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: height * 250,
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          book?.volumeInfo?.imageLinks?.thumbnail ?? '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 70,
                                    left: 16,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: AppColors.black,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    book?.volumeInfo?.title ?? "Censored",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(fontSize: 24),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    book?.volumeInfo?.authors?.isNotEmpty == true
                                        ? book!.volumeInfo!.authors![0]
                                        : "Censored",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 35),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          book?.volumeInfo?.printType ?? '',
                                          style: Theme.of(context).textTheme.headlineSmall,
                                        ),
                                        const Spacer(flex: 2),
                                        Text(
                                          "${book?.volumeInfo?.pageCount ?? 0} Pages",
                                          style: Theme.of(context).textTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () async {
                                          Uri url = Uri.parse("${book?.volumeInfo?.previewLink}");
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url, mode: LaunchMode.externalApplication);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        style: OutlinedButton.styleFrom(side: BorderSide(width: 1)),
                                        child: Text(
                                          "VIEW ONLINE",
                                          style: Theme.of(context).textTheme.headlineSmall,
                                        ),
                                      ),
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          final wishlistProvider =
                                              Provider.of<WishlistProvider>(context, listen: false);
                                          wishlistProvider.toggleWishlist(book!);
                                        },
                                        style: OutlinedButton.styleFrom(side: BorderSide(width: 1)),
                                        icon: Consumer<WishlistProvider>(
                                          builder: (context, wishlistProvider, _) {
                                            return Icon(
                                              Icons.favorite,
                                              color: wishlistProvider.isInWishlist(book!)
                                                  ? Colors.red
                                                  : AppColors.black,
                                            );
                                          },
                                        ),
                                        label: Text(
                                          "WISHLIST",
                                          style: Theme.of(context).textTheme.headlineSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text("Details", style: Theme.of(context).textTheme.titleMedium),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Author", style: Theme.of(context).textTheme.headlineSmall),
                                          Text("Publisher", style: Theme.of(context).textTheme.headlineSmall),
                                          Text("Published Date", style: Theme.of(context).textTheme.headlineSmall),
                                          Text("Categories", style: Theme.of(context).textTheme.headlineSmall),
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(book?.volumeInfo?.authors?[0] ?? '',
                                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16)),
                                            Text(book?.volumeInfo?.publisher ?? '',
                                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16)),
                                            Text(book?.volumeInfo?.publishedDate ?? '',
                                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16)),
                                            Text(book?.volumeInfo?.categories?[0] ?? '',
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text("Description", style: Theme.of(context).textTheme.titleMedium),
                                  const SizedBox(height: 10),
                                  ReadMoreText(
                                    parse(book?.volumeInfo?.description ?? "").documentElement?.text ?? '',
                                    trimLines: 6,
                                    colorClickableText: AppColors.black,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: '...Read More',
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),
                                    trimExpandedText: ' Less',
                                  ),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () async {
                                      Uri url = Uri.parse("${book?.volumeInfo?.infoLink}");
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url, mode: LaunchMode.externalApplication);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.black),
                                    child: Text(
                                      "Buy",
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                )
              : const Center(child: Text("Oops! No Data Found"));
        },
      ),
    );
  }
}
