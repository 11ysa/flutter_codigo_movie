import 'package:flutter/material.dart';
import 'package:flutter_application_movie/models/movie.dart';
import 'package:flutter_application_movie/services/api_service.dart';
import 'package:flutter_application_movie/ui/general/colors.dart';
import 'package:flutter_application_movie/witgets/item_movie.widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> movies = [];

  getData() {
    APIservices apIservices = APIservices();
    apIservices.getMovies().then((value) {
      movies = value;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome Jhon",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Discoverd ",
                          style: TextStyle(
                              color: Colors.white, fontSize: 38, height: 1.25),
                        )
                      ],
                    ),
                  ),
                  const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://laverdadnoticias.com/__export/1559777270074/sites/laverdad/img/2019/06/05/este_es_el_primer_poster_de_wonder_woman_1984.jpg_1902800913.jpg"))
                ],
              ),
              //seccion de caterias
              //seccion de peliculas
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemsMovieWidget(
                      modelMovie: movies[index],
                    );
                  })
            ],
          ),
        )),
      ),
    );
  }
}
