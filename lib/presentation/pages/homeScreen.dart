// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hadith_app/data/models/database_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  void fetch() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    List<Map<String, dynamic>> result = await dbHelper.fetchData('books');

    // Check if there is data in the result list
    if (result.isNotEmpty) {
      List<String> titles =
          result.map((book) => book['title'].toString()).toList();
      List<String> hadisno =
          result.map((book) => book['number_of_hadis'].toString()).toList();

      // Update the UI or perform any other actions with the titles
      setState(() {
        // Update the List of titles
        titlesToShow = titles;
        hadisNumber = hadisno;
      });
    }
  }

  List<String> titlesToShow = [];
  List<String> hadisNumber =
      []; // Declare a variable to hold the fetched titles

  @override
  void initState() {
    super.initState();
    fetch();
  }

  List<String> cardImages = [
    'assets/images/Polygon 2.png',
    'assets/images/Polygon 1.png',
    'assets/images/Polygon 3.png',
    'assets/images/Polygon 2.png',
    'assets/images/Polygon 1.png',
    'assets/images/Polygon 3.png',
    // Add more image paths as needed
  ];
  List<String> subHeading = [
    'Imam Bukhari',
    'Imam Muslim',
    'Imam Nasai',
    'Imam Bukhari',
    'Imam Muslim',
    'Imam Nasai',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF20a484),
          leading: IconButton(
            icon: Image.asset('assets/images/Menu.png'),
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Center(
            child: Text(
              'Al Hadith',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 16 / 20,
              ),
            ),
          ),
          actions: [
            if (isSearching)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 250,
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(color: Colors.white),
                    autofocus: true,
                  ),
                ),
              ),
            IconButton(
              icon: Image.asset('assets/images/Search.png'),
              color: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  if (!isSearching) {
                    searchController.clear();
                    FocusScope.of(context).unfocus();
                  }
                });
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: 400,
              height: 300.43,
              child: Stack(
                children: [
                  Container(
                    decoration: const ShapeDecoration(
                      color: Color(0xFF20a484),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/mask.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    right: 20,
                    child: SizedBox(
                      width: 320,
                      height: 100,
                      child: Text(
                        '“A slave [of Allah] may utter a word without giving it much thought by which he slips into the fire a distance further than that between east and west.”',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        maxLines: 4,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 20,
                    right: 20,
                    child: SizedBox(
                      width: 135,
                      height: 18,
                      child: Text(
                        '[ Bukhari and Muslim ]',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: Container(
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                      ),
                      height: 86,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            child: Container(
                              height: 86,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/goto.png',
                                          width: 45,
                                          height: 45,
                                        ),
                                        const SizedBox(height: 4.5),
                                        Text(
                                          'Last',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3333333333,
                                            color: const Color(0xff5d646e),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/plane.png',
                                          width: 45,
                                          height: 45,
                                        ),
                                        const SizedBox(height: 4.5),
                                        Text(
                                          'Go To',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3333333333,
                                            color: const Color(0xff5d646e),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/book.png',
                                          width: 45,
                                          height: 45,
                                        ),
                                        const SizedBox(height: 4.5),
                                        Text(
                                          'Apps',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3333333333,
                                            color: const Color(0xff5d646e),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/give.png',
                                          width: 45,
                                          height: 45,
                                        ),
                                        const SizedBox(height: 4.5),
                                        Text(
                                          'Sadaqa',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3333333333,
                                            color: const Color(0xff5d646e),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            child: Container(
                              height: 86,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(90),
                                    bottomRight: Radius.circular(90),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'All Hadith Book',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF101010),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 0.07,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 235,
                    width: 400,
                    color: const Color.fromARGB(37, 150, 190, 100),
                    child: ListView(
                      // Use ListView to enable vertical scrolling
                      children: [
                        CarouselSlider.builder(
                          itemCount: titlesToShow.length,
                          itemBuilder: (context, index, realIndex) {
                            String imagePath =
                                cardImages[index % cardImages.length];
                            String sub = subHeading[index % subHeading.length];

                            return Container(
                              width: 350,
                              height: 120,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Card(
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  onTap: () {
                                    // Handle card tap if needed
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              imagePath,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                            const Text(
                                              'B',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                height: 20 / 18,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                titlesToShow[index],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff101010),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              const SizedBox(height: 3),
                                              Text(
                                                sub,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              hadisNumber[index],
                                              style: GoogleFonts.poppins(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              'Hadith',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: 235,
                            viewportFraction: 0.9, // Display all cards at once
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: false, // Disable autoplay
                            enlargeCenterPage: true,
                            scrollDirection: Axis.vertical, // Set to vertical
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset('assets/images/Home.png',
                    width: 24, height: 24),
              ),
              BottomNavigationBarItem(
                label: '',
                icon:
                    Image.asset('assets/images/ico.png', width: 24, height: 24),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset('assets/images/Note.png',
                    width: 24, height: 24),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset('assets/images/Save.png',
                    width: 24, height: 24),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset('assets/images/User.png',
                    width: 24, height: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
