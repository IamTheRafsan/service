import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:service/components/reuseable_card.dart';
import 'package:service/ui/Styles.dart';
import 'package:service/ui/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  final String userEmail;

  const HomeScreen({super.key, required this.userEmail});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? userName;

  Future<void> getUserName() async {
    try {
      final querySnapshot = await _firestore
          .collection('userDetails')
          .where('email', isEqualTo: widget.userEmail)
          .get();
      final userDoc = querySnapshot.docs.first;
      setState(() {
        userName = userDoc['fullName'];
      });
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: color.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 80,
                        child: Image.asset(
                          'images/logo.png',
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hi, $userName",
                        style: BodyText.headingBoldWhite(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Location", style: BodyText.headingWhite())],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 55,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: ("Search your service..."),
                                hintStyle: TextStyle(fontSize: 14),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 17)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CatergoryCard(
                        imagePath: 'images/logo.png',
                        categoryName: "Electrician",
                        onTap: () {}),
                    CatergoryCard(
                        imagePath: 'images/logo.png',
                        categoryName: "Electrician",
                        onTap: () {}),
                    CatergoryCard(
                        imagePath: 'images/logo.png',
                        categoryName: "Electrician",
                        onTap: () {})
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CatergoryCard(
                        imagePath: 'images/logo.png',
                        categoryName: "Electrician",
                        onTap: () {}),
                    CatergoryCard(
                        imagePath: 'images/logo.png',
                        categoryName: "Electrician",
                        onTap: () {}),
                    CatergoryCard(
                        imagePath: 'images/logo.png',
                        categoryName: "Electrician",
                        onTap: () {})
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CatergoryCard(
                        imagePath: 'images/logo.png',
                        categoryName: "Electrician",
                        onTap: () {}),
                    CatergoryCard(
                        imagePath: 'images/logo.png',
                        categoryName: "Electrician",
                        onTap: () {}),
                    CatergoryCard(
                        imagePath: 'images/logo.png',
                        categoryName: "Electrician",
                        onTap: () {})
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
