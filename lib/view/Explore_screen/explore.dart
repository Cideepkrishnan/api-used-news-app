// import 'package:flutter/material.dart';
// import 'package:news/provider/my_provider.dart';
// import 'package:provider/provider.dart';

// class explore extends StatefulWidget {
//   final int itemIndex;
//   const explore({super.key, required this.itemIndex});

//   @override
//   State<explore> createState() => _exploreState();
// }

// class _exploreState extends State<explore> {
//   final List<String> mychip = [
//     "All",
//     "Health",
//     "Technology",
//     "General",
//     "Bussiness",
//     "Science",
//     "Sports",
//     "Technology"
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final homescreenproviderState = Provider.of<Homescreen_provider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Trending",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               // margin: const EdgeInsets.symmetric(vertical: 60),
//               height: 70,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: mychip.length,
//                   itemBuilder: (context, index) => Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       width: 90,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Color.fromARGB(255, 230, 230, 226),
//                       ),
//                       child: Center(
//                           child: Text(
//                         mychip[index],
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       )),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             ListView.builder(
//               physics: AlwaysScrollableScrollPhysics(),
//               itemCount: homescreenproviderState.datamodel?.articles?.length,
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemBuilder: (context, index) => Container(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                             height: 90,
//                             width: 250,
//                             color: Colors.amber,
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     homescreenproviderState.datamodel
//                                             ?.articles?[widget.itemIndex].title
//                                             .toString() ??
//                                         "",
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 )
//                               ],
//                             )),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             height: 90,
//                             width: 120,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: NetworkImage(homescreenproviderState
//                                             .datamodel
//                                             ?.articles?[widget.itemIndex]
//                                             .urlToImage ??
//                                         ""),
//                                     fit: BoxFit.cover),
//                                 borderRadius: BorderRadius.circular(10)),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/provider/my_provider.dart';
import 'package:news/utils/database.dart';
import 'package:news/view/Explore_screen/sports.dart';
import 'package:provider/provider.dart';

class explore extends StatelessWidget {
  const explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Discover",
            style: GoogleFonts.playfairDisplay(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.black),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: database.explore.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await Provider.of<Homescreen_provider>(context,
                                listen: false)
                            .fetchCategorySports(category: database.detail[index]["title"]);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => sports1()));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  database.explore[index]["topicimage"],
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      database.explore[index]["topicname"],
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
