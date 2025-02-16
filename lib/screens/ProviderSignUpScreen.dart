import 'package:flutter/material.dart';
import 'package:service/components/reuseable_button.dart';
import 'package:service/components/reuseable_textfield.dart';
import 'package:service/controllers/providerSignUp.dart';
import 'package:service/ui/Styles.dart';
import 'package:service/controllers/fetchData.dart';
import 'package:service/components/reuseable_dropdown.dart';


class ProviderSignUpScreen extends StatefulWidget {
  const ProviderSignUpScreen({super.key});

  @override
  _ProviderSignUpScreenState createState() => _ProviderSignUpScreenState();
}

class _ProviderSignUpScreenState extends State<ProviderSignUpScreen> {
  String userFullName = " ";
  String userEmail = " ";
  String userPassword = " ";
  String userConfirmPassword = " ";
  String userCategory = " ";
  String userDistrict = " ";
  String userPoliceStation = " ";
  String userPhoneNumber = " ";
  String userGender = " ";
  String userNID = " ";
  List<String> categoryList = [];
  List<String> districtList = [];
  List<String> policeStationList = [];
  List<String> genderList = ["Male", "Female"];


  final providerSignUp ProviderSignUp = providerSignUp();

  @override
  void initState() {
    super.initState();
    _getCategories();
    fetchDistricts();
  }

  //getting the categories from the database
  Future<void> _getCategories() async {
    List<String> categories = await fetchData.fetchCategories();
    setState(() {
      categoryList = categories;
    });
  }

  //getting the districts from the database
  Future<void> fetchDistricts() async {
    try {
      List<Map<String, List<String>>> locations = await fetchData.fetchLocations();

      List<String> districts = [];
      for (var location in locations) {
          districts.addAll(location.keys);
        }
      setState(() {
        districtList = districts;
      });
    } catch (e) {
      print("Error fetching districts");
    }
  }


  //Getting the police stations for the selected district
  Future<void> fetchPoliceStations() async{
    try {
      List<Map<String, List<String>>> locations = await fetchData
          .fetchLocations();

      List<String> policeStations = [];
      for (var location in locations) {
        if (location.containsKey(userDistrict)) {
          policeStations = location[userDistrict] ?? [];
          break;
        }
      }
      setState(() {
        policeStationList = policeStations;
      });
    }
    catch (e) {
      print("Error fetching police stations");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: BodyText.headingBold(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: InputField(
                          inputValue: (value) {
                            setState(() {
                              userFullName = value;
                            });
                          },
                          hintText: "Full Name",
                        ))
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: InputField(
                          inputValue: (value) {
                            setState(() {
                              userEmail = value;
                            });
                          },
                          hintText: "E-mail",
                          keyboardType: TextInputType.emailAddress,
                        ))
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: InputField(
                          inputValue: (value) {
                            setState(() {
                              userPassword = value;
                            });
                          },
                          hintText: "Password",
                          obsecureText: true,
                        ))
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: InputField(
                          inputValue: (value) {
                            setState(() {
                              userConfirmPassword = value;
                            });
                          },
                          hintText: "Confirm Password",
                          obsecureText: true,
                        ))
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: DropdownInputField(
                          hintText: "Select a Category",
                          options: categoryList,
                          onChanged: (String? newValue) {
                            setState(() {
                              userCategory = newValue!;
                            });
                          },
                        )
                    )
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                      child: DropdownInputField(
                        hintText: "Select District",
                        options: districtList.isNotEmpty ? districtList : ["No Data"],
                        onChanged: (String? newValue) {
                          setState(() {
                            userDistrict = newValue!;
                            fetchPoliceStations();
                          });
                        },
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                      child: DropdownInputField(
                        hintText: "Select Police Station",
                        options: policeStationList,
                        onChanged: (String? newValue) {
                          setState(() {
                            userPoliceStation = newValue!;
                          });
                        },
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: InputField(
                          inputValue: (value) {
                            setState(() {
                              userPhoneNumber = value;
                            });
                          },
                          hintText: "Mobile Number",
                        ))
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                      child: DropdownInputField(
                        hintText: "Select Your Gender",
                        options: genderList,
                        onChanged: (String? newValue) {
                          setState(() {
                            userGender = newValue!;
                          });
                        },
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: InputField(
                          inputValue: (value) {
                            setState(() {
                              userNID = value;
                            });
                          },
                          hintText: "NID number",
                        ))
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(children: [
                    Expanded(
                        child: Button(
                          onPress: () {
                            providerSignUp.signUp(context: context,
                                userFullName: userFullName,
                                userEmail: userEmail,
                                userPassword: userPassword,
                                userConfirmPassword: userConfirmPassword,
                                userCategory: userCategory,
                                userDistrict: userDistrict,
                                userPoliceStation: userPoliceStation,
                                userPhoneNumber: userPhoneNumber,
                                userGender: userGender,
                                userNID: userNID
                            );
                          },
                          buttonText: "Sign Up",
                        ))
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}