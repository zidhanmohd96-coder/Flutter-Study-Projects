import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternewz/helper/data.dart';
import 'package:flutternewz/helper/widgets.dart';
import 'package:flutternewz/models/categorie_model.dart';
import 'package:flutternewz/views/categorie_news.dart';
import '../helper/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _loading;
  var newslist;

  List<CategorieModel> categories = [];

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "NewZ",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Y",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      /// Categories
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              imageAssetUrl: categories[index].imageAssetUrl,
                              categoryName: categories[index].categoryName,
                            );
                          },
                        ),
                      ),

                      /// News Article
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        // Add a null check to handle the list properly
                        child: newslist == null
                            ? Center(child: Text("No news found"))
                            : ListView.builder(
                                itemCount: newslist.length,
                                shrinkWrap:
                                    true, // Tells ListView to take only needed space
                                physics:
                                    NeverScrollableScrollPhysics(), // Important!
                                itemBuilder: (context, index) {
                                  return NewsTile(
                                    // Use the '??' operator to provide fallback values for the UI
                                    imgUrl:
                                        newslist[index].urlToImage ??
                                        "https://via.placeholder.com/400",
                                    title: newslist[index].title ?? "No Title",
                                    desc: newslist[index].description ?? "",
                                    content: newslist[index].content ?? "",
                                    posturl: newslist[index].articleUrl ?? "",
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  const CategoryCard({
    super.key,
    required this.imageAssetUrl,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CategoryNews(newsCategory: categoryName.toLowerCase()),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
