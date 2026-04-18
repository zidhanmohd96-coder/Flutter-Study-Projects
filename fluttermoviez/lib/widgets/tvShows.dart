import 'package:flutter/material.dart';
import 'package:fluttermoviez/screens/infoScreen.dart';
import 'package:fluttermoviez/utils/text.dart';

class TvShows extends StatelessWidget {
  final List tvShows;

  const TvShows({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "TV Shows", color: Colors.white, size: 19.0),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: tvShows.length,
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
                              movie: tvShows[index],
                              description:
                                  tvShows[index]['overview'] ??
                                  'No description available',
                              bannerUrl:
                                  "https://image.tmdb.org/t/p/w500${tvShows[index]['backdrop_path']}",
                              posterUrl:
                                  "https://image.tmdb.org/t/p/w500${tvShows[index]['poster_path']}",
                              title:
                                  tvShows[index]['original_name'] ??
                                  'Title Not Available',
                              vote:
                                  tvShows[index]['vote_average']?.toString() ??
                                  'N/A',
                              releaseDate:
                                  tvShows[index]['first_air_date'] ??
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
                                  "https://image.tmdb.org/t/p/w500${tvShows[index]['poster_path']}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ModifiedText(
                              text:
                                  tvShows[index]['original_name'] ??
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
