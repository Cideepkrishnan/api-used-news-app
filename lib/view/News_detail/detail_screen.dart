import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/model.dart';
import 'package:news/provider/my_provider.dart';
import 'package:provider/provider.dart';

class detail_screen extends StatefulWidget {
  final int itemIndex;
  const detail_screen({super.key, required this.itemIndex});

  @override
  State<detail_screen> createState() => _detail_screenState();
}

class _detail_screenState extends State<detail_screen> {
  void initState() {
    Provider.of<Homescreen_provider>(context, listen: false).Fetchnews();
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final homescreenproviderState = Provider.of<Homescreen_provider>(context);
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  child: Image.network(
                    homescreenproviderState.datamodel
                            ?.articles?[widget.itemIndex].urlToImage ??
                        "",
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 290),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 232, 232),
                        borderRadius: BorderRadius.circular(20)),
                    height: 800,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, left: 230),
                              child: Text(
                                homescreenproviderState
                                        .datamodel
                                        ?.articles?[widget.itemIndex]
                                        .publishedAt
                                        .toString() ??
                                    "",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            Container(
                              height: 50,
                              width: 340,
                              // color: Colors.white,
                              child: Center(
                                child: Text(
                                    homescreenproviderState.datamodel
                                            ?.articles?[widget.itemIndex].title
                                            .toString() ??
                                        "",
                                    style: GoogleFonts.podkova(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21))),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 200, top: 20),
                              child: Text(
                                "By : ${homescreenproviderState.datamodel?.articles?[widget.itemIndex].author.toString() ?? ""}",
                                style: GoogleFonts.poppins(
                                    textStyle:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Text(
                                  homescreenproviderState
                                          .datamodel
                                          ?.articles?[widget.itemIndex]
                                          .description
                                          .toString() ??
                                      "",
                                  style: GoogleFonts.podkova(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19))),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
