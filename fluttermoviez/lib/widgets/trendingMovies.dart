import 'package:flutter/material.dart';
import 'package:fluttermoviez/screens/infoScreen.dart';
import 'package:fluttermoviez/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trendingMovies;

  const TrendingMovies({super.key, required this.trendingMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: "Trending Movies",
            color: Colors.white,
            size: 19.0,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: trendingMovies.length,
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
                              movie: trendingMovies[index],
                              description:
                                  trendingMovies[index]['overview'] ??
                                  'No description available',
                              bannerUrl:
                                  "https://image.tmdb.org/t/p/w500${trendingMovies[index]['backdrop_path']}",
                              posterUrl:
                                  "https://image.tmdb.org/t/p/w500${trendingMovies[index]['poster_path']}",
                              title:
                                  trendingMovies[index]['title'] ??
                                  'Title Not Available',
                              vote:
                                  trendingMovies[index]['vote_average']
                                      ?.toString() ??
                                  'N/A',
                              releaseDate:
                                  trendingMovies[index]['release_date'] ??
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
                                  "https://image.tmdb.org/t/p/w500${trendingMovies[index]['poster_path']}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ModifiedText(
                              text:
                                  trendingMovies[index]['title'] ??
                                  'Title Not Available',
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
