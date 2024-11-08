import 'package:flutter/material.dart';
import 'package:service/components/reuseable_card.dart';
import 'package:service/ui/Styles.dart';
import 'package:service/ui/appBar.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
              )
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                    Text("Hello World",
                    style: BodyText.heading(),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Location",
                    style: BodyText.subHeading())
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: ("Search your service..."),
                            hintStyle: TextStyle(
                              color: Colors.black45
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(vertical: 17)
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ),
          SizedBox(
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
                            onTap: (){

                            }
                        ),
                        CatergoryCard(
                            imagePath: 'images/logo.png',
                            categoryName: "Electrician",
                            onTap: (){

                            }
                        ),
                        CatergoryCard(
                            imagePath: 'images/logo.png',
                            categoryName: "Electrician",
                            onTap: (){

                            }
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CatergoryCard(
                            imagePath: 'images/logo.png',
                            categoryName: "Electrician",
                            onTap: (){

                            }
                        ),
                        CatergoryCard(
                            imagePath: 'images/logo.png',
                            categoryName: "Electrician",
                            onTap: (){

                            }
                        ),
                        CatergoryCard(
                            imagePath: 'images/logo.png',
                            categoryName: "Electrician",
                            onTap: (){

                            }
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CatergoryCard(
                            imagePath: 'images/logo.png',
                            categoryName: "Electrician",
                            onTap: (){

                            }
                        ),
                        CatergoryCard(
                            imagePath: 'images/logo.png',
                            categoryName: "Electrician",
                            onTap: (){

                            }
                        ),
                        CatergoryCard(
                            imagePath: 'images/logo.png',
                            categoryName: "Electrician",
                            onTap: (){

                            }
                        )
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