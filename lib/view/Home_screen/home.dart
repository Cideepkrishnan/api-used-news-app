import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/provider/my_provider.dart';
import 'package:news/view/News_detail/detail_screen.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final List<String> mychip = [
    "Sports",
    "Health",
    "Technology",
    "Bussiness",
    "Science",
    "General"
  ];

  // var decodedData;

  void initState() {
    Provider.of<Homescreen_provider>(context, listen: false).Fetchnews();
    super.initState();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homescreenproviderState = Provider.of<Homescreen_provider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "News - Daily",
            style: GoogleFonts.poltawskiNowy(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.red,
        //   onPressed: () async {
        //     Provider.of<Homescreen_provider>(context, listen: false)
        //         .Fetchnews();
        //   },
        //   child: Icon(Icons.favorite_outline),
        // ),
        body: homescreenproviderState.is_loading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  await Provider.of<Homescreen_provider>(context, listen: false)
                      .Fetchnews();
                },
                child: SingleChildScrollView(
                  // physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          width: 370,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search...",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            controller: searchController,
                            onChanged: (value) {
                              // fetchData(searchquery:searchController.text);
                              if (searchController.text.length % 2 == 0) {
                                Provider.of<Homescreen_provider>(context,
                                        listen: false)
                                    .Fetchnews(
                                        searchQuery: searchController.text);
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CarouselSlider(
                          items: List.generate(
                              10,
                              (index) => Container(
                                    width: 370,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 180,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    "${homescreenproviderState.datamodel?.articles?[index].urlToImage}",
                                                  ),
                                                  fit: BoxFit.cover),
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                              " ${homescreenproviderState.datamodel?.articles?[index].title.toString() ?? ""}",
                                              style: GoogleFonts.podkova(
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                        ),
                                      ],
                                    ),
                                  )),
                          options: CarouselOptions(
                            animateToClosest: true,
                            autoPlayCurve: Curves.linear,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            height: 270,
                            autoPlay: true,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                            Text(
                              "Latest News",
                              style: GoogleFonts.zillaSlab(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(width: 150),
                            Text(
                              "See All",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: mychip.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () async {
                                      await Provider.of<Homescreen_provider>(
                                              context,
                                              listen: false)
                                          .fetchCategorySports(
                                              category: "Sports");
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(255, 230, 230, 226),
                                      ),
                                      child: Center(
                                        child: Text(mychip[index],
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13))),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            homescreenproviderState.datamodel?.articles?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 5,
                            childAspectRatio: 2,
                            crossAxisSpacing: 4),
                        itemBuilder: (context, index) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          detail_screen(itemIndex: index),
                                    ));
                              },
                              child: Container(
                                height: 170,
                                width: 370,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          homescreenproviderState
                                                  .datamodel
                                                  ?.articles?[index]
                                                  .urlToImage ??
                                              "",
                                        ),
                                        fit: BoxFit.cover),
                                    color: const Color.fromARGB(
                                        255, 129, 129, 128),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 120, left: 10),
                                  child: Text(
                                      homescreenproviderState
                                              .datamodel?.articles?[index].title
                                              .toString() ??
                                          "",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}
