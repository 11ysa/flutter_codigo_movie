import 'package:flutter/material.dart';
import 'package:flutter_application_movie/ui/general/colors.dart';
import 'package:flutter_application_movie/witgets/line_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBrandPrimaryColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("The Jhon"),
              backgroundColor: kBrandPrimaryColor,
              expandedHeight: 200,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(fit: StackFit.expand, children: [
                  Image.network(
                    "https://i.ebayimg.com/images/g/cPQAAOSwCUBikUf1/s-l500.jpg",
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
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            "https://i.pinimg.com/564x/7c/4c/97/7c4c9708c1b7ea790165ff46a5b089b1.jpg",
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
                                Icon(
                                  Icons.date_range,
                                  color: Colors.white70,
                                  size: 14,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "2022-01-01",
                                  style: TextStyle(
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
                              "the messi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  color: Colors.white70,
                                  size: 14,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "120 min .",
                                  style: TextStyle(
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
                      "data",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    LineWidget(width: 50),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "hola querida",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 54.0,
                      child: ElevatedButton.icon(
                          onPressed: () async {
                            Uri _uri = Uri.parse(
                                "https://www.foxmovies.com/movies/fight-club");
                            await launchUrl(_uri);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: kBrandsecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
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
                    Text(
                      "Generos",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    LineWidget(width: 50),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      children: [
                        Chip(label: Text("Crimen")),
                        Chip(label: Text("dfgdfgdfg")),
                        Chip(label: Text("dfgdfgdfgdfg")),
                        Chip(label: Text("dfgsdfgdhgdfg"))
                      ],
                    )
                  ],
                ),
              )
            ]))
          ],
        ));
  }
}
