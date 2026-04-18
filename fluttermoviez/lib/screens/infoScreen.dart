import 'package:flutter/material.dart';
import 'package:fluttermoviez/utils/text.dart';

class InfoScreen extends StatelessWidget {
  final Map<String, dynamic> movie;
  final String description, bannerUrl, posterUrl, title, vote, releaseDate;

  const InfoScreen({
    super.key,
    required this.movie,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.title,
    required this.vote,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(
          text: movie['title'] ?? movie['name'] ?? 'Title Not Available',
          color: Colors.white,
          size: 20.0,
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.5,
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500" +
                              movie['backdrop_path'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Text(
                    movie['title'] ?? movie['name'] ?? 'Title Not Available',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: ModifiedText(
                    text: "⭐Rating : " + vote,
                    color: Colors.white,
                    size: 18.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 140,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500" +
                            movie['poster_path'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ModifiedText(
                        text: "Description",
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(height: 10),
                      ModifiedText(
                        text: description ?? 'Description Not Available',
                        color: Colors.white,
                        size: 12,
                      ),
                      SizedBox(height: 7),
                      ModifiedText(
                        text: "Release Date - " + releaseDate,
                        color: Colors.white,
                        size: 13,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
