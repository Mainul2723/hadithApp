import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // Initial Container
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF20a484),
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(15),
                //   bottomRight: Radius.circular(15),
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Frame.png'),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Books Name',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Books Name',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset('assets/images/smenu.png'),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ),

            // Floating Container with Search Field
            // Material(
            //   elevation: 5.0,
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15.0),
            //     ),
            //     child: Container(
            //       height: 50,
            //       width: 336,
            //       color: Colors.white, // Set your desired background color
            //       child: Row(
            //         children: [
            //           TextField(
            //             decoration: InputDecoration(
            //               hintText: 'Search',
            //               hintStyle: GoogleFonts.poppins(color: Colors.black),
            //             ),
            //             style: GoogleFonts.poppins(color: Colors.black),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 8),
            //             child: Image.asset(
            //               'assets/images/Search.png',
            //               color: Colors.black,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            // Expanded Container with ListView
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white70,
                      elevation: 5.0,
                      child: ListTile(
                        title: Text(
                          'Item $index',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'Item $index',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        leading: Container(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/images/dot.png'),
                              const Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  height: 20 / 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // Handle item tap
                          print('Tapped on Item $index');
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
