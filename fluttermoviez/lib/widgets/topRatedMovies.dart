import 'package:flutter/material.dart';
import 'package:fluttermoviez/screens/infoScreen.dart';
import 'package:fluttermoviez/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRatedMovies;

  const TopRatedMovies({super.key, required this.topRatedMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: "Top Rated Movies",
            color: Colors.white,
            size: 19.0,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: topRatedMovies.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return InfoScreen(
                              movie: topRatedMovies[index],
                              description:
                                  topRatedMovies[index]['overview'] ??
                                  'No description available',
                              bannerUrl:
                                  "https://image.tmdb.org/t/p/w500${topRatedMovies[index]['backdrop_path']}",
                              posterUrl:
                                  "https://image.tmdb.org/t/p/w500${topRatedMovies[index]['poster_path']}",
                              title:
                                  topRatedMovies[index]['title'] ??
                                  'Title Not Available',
                              vote:
                                  topRatedMovies[index]['vote_average']
                                      ?.toString() ??
                                  'N/A',
                              releaseDate:
                                  topRatedMovies[index]['release_date'] ??
                                  'Release date not available',
                            );
                          },
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500${topRatedMovies[index]['poster_path']}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ModifiedText(
                              text:
                                  topRatedMovies[index]['title'] ?? 'No Title',
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },

              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
