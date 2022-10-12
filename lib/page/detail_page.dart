import 'package:flutter/material.dart';
import 'package:flutter_application_movie/models/model_cast.dart';
import 'package:flutter_application_movie/models/model_detail.dart';
import 'package:flutter_application_movie/services/api_service.dart';
import 'package:flutter_application_movie/ui/general/colors.dart';
import 'package:flutter_application_movie/utils/constants.dart';
import 'package:flutter_application_movie/witgets/ItemsCastWidget.dart';
import 'package:flutter_application_movie/witgets/line_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  int movieId;
  DetailPage({required this.movieId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final APIservices _apiservice = APIservices();
  MovieDetailModel? movieDetailModel;
  CastModel? castModel;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    _apiservice.getMovie(widget.movieId).then((value) {
      if (value != null) {
        movieDetailModel = value;
        isLoading = false;
        setState(() {});
      }
    });
  }

  getCast() {
    _apiservice.getCast(widget.movieId).then((value) {
      if (value != null) {
        castModel = value;
        isLoading = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getCast();
    return Scaffold(
        backgroundColor: kBrandPrimaryColor,
        body: !isLoading
            ? CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(movieDetailModel!.originalTitle),
                    backgroundColor: kBrandPrimaryColor,
                    expandedHeight: 200,
                    centerTitle: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(fit: StackFit.expand, children: [
                        Image.network(
                          "https://image.tmdb.org/t/p/w500${movieDetailModel!.backdropPath}",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                kBrandPrimaryColor,
                                kBrandPrimaryColor.withOpacity(0.01)
                              ])),
                        )
                      ]),
                    ),
                    pinned: true,
                    floating: true,
                    snap: false,
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500${movieDetailModel!.posterPath}",
                                  height: 140,
                                  width: 120,
                                ),
                              ),
                              const SizedBox(
                                width: 4.5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.date_range,
                                        color: Colors.white70,
                                        size: 14,
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Text(
                                        movieDetailModel!.releaseDate
                                            .toString()
                                            .substring(0, 10),
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    movieDetailModel!.originalTitle,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.timelapse,
                                        color: Colors.white70,
                                        size: 14,
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      Text(
                                        "${movieDetailModel!.runtime} min .",
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Overview",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          LineWidget(width: 50),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            movieDetailModel!.overview,
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 54.0,
                            child: ElevatedButton.icon(
                                onPressed: () async {
                                  Uri _uri =
                                      Uri.parse(movieDetailModel!.homepage);
                                  await launchUrl(_uri);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: kBrandsecondaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                icon: const Icon(
                                  Icons.link,
                                  color: kBrandPrimaryColor,
                                ),
                                label: Text(
                                  "Home Page",
                                  style: TextStyle(
                                      color: kBrandPrimaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                )),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            "Generos",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          LineWidget(width: 50),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            alignment: WrapAlignment.start,
                            spacing: 10,
                            children: movieDetailModel!.genres
                                .map(
                                  (e) => Chip(label: Text(e.name)),
                                )
                                .toList(),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          const Text(
                            "Cast",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          LineWidget(width: 50),
                          const SizedBox(
                            height: 16.0,
                          ),
                        ],
                      ),
                    )
                  ]))
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
