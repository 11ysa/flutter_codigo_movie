import 'package:flutter/material.dart';
import 'package:flutter_application_movie/models/movie.dart';
import 'package:flutter_application_movie/page/detail_page.dart';
import 'package:flutter_application_movie/ui/general/colors.dart';

class ItemsMovieWidget extends StatelessWidget {
  MovieModel modelMovie;
  ItemsMovieWidget({required this.modelMovie});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(movieId: modelMovie.id)));
      },
      child: Container(
        height: height * 0.6,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/original${modelMovie.posterPath}")),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(1),
                  blurRadius: 12,
                  offset: const Offset(0, 5))
            ]),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 15.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: kBrandPrimaryColor.withOpacity(0.7)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      modelMovie.originalTitle,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 100,
                      height: 3.2,
                      decoration: BoxDecoration(
                          color: kBrandsecondaryColor,
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      modelMovie.overview,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              modelMovie.releaseDate
                                  .toString()
                                  .substring(0, 10),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.thumb_up,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              modelMovie.voteCount.toString(),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: kBrandPrimaryColor),
                child: Text(
                  modelMovie.voteAverage.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
