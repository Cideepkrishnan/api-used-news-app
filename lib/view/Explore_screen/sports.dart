import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/provider/my_provider.dart';
import 'package:provider/provider.dart';

class sports1 extends StatefulWidget {
  const sports1({
    super.key,
  });

  @override
  State<sports1> createState() => _sports1State();
}

class _sports1State extends State<sports1> {
  
  void initState() {
    Provider.of<Homescreen_provider>(context, listen: false)
        .fetchCategorySports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homescreenproviderState = Provider.of<Homescreen_provider>(context);
    return Scaffold(
      body: homescreenproviderState.is_loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await Provider.of<Homescreen_provider>(context, listen: false)
                    .fetchCategorySports();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          homescreenproviderState.datamodel?.articles?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, childAspectRatio: 2),
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            height: 170,
                            width: 370,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 20),
                                      child: Container(
                                        height: 130,
                                        width: 180,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ListTile(
                                          title: Text(
                                            homescreenproviderState.datamodel
                                                    ?.articles?[index].title
                                                    .toString() ??
                                                "",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              homescreenproviderState
                                                      .datamodel
                                                      ?.articles?[index]
                                                      .publishedAt
                                                      .toString() ??
                                                  "",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        height: 140,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    homescreenproviderState
                                                            .datamodel
                                                            ?.articles?[index]
                                                            .urlToImage ??
                                                        ""),
                                                fit: BoxFit.cover),
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.only(
                                //           left: 150),
                                //       child: Container(
                                //         height: 140,
                                //         width: 140,
                                //         decoration: BoxDecoration(
                                //             image: DecorationImage(
                                //                 image: NetworkImage(
                                //                     homescreenproviderState
                                //                             .datamodel
                                //                             ?.articles?[index]
                                //                             .urlToImage ??
                                //                         ""),
                                //                 fit: BoxFit.cover),
                                //             color: Colors.black,
                                //             borderRadius:
                                //                 BorderRadius.circular(20)),
                                //         // child: Text(
                                //         //   homescreenproviderState.datamodel
                                //         //           ?.articles?[index].title
                                //         //           .toString() ??
                                //         //       "",
                                //         //   style:
                                //         //       TextStyle(color: Colors.brown),
                                //         // ),
                                //       ),
                                //     )
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
