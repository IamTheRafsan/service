import 'package:cloud_firestore/cloud_firestore.dart';

class receiverValidation{

  static String? validateName(String name) {
    name = name.trim();
    if (name.isEmpty) {
      return "Name field is empty";
    }
    else if (!RegExp(r'^[a-zA-Z.\s]+$').hasMatch(name)) {
      return "Name can only contain letters, spaces, and dots";
    }
    return null;
  }


  static String? validateEmail(String email){
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if(email.isEmpty){
      return "Email field is empty";
    }
    else if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password field is empty";
    } else if (password.length < 8) {
      return "Password must be at least 8 characters long";
    } else if (!RegExp(r'[a-zA-Z]').hasMatch(password)) {
      return "Password must contain at least one letter";
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      return "Password must contain at least one number";
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return "Password must contain at least one special character";
    }
    return null;
  }

  static String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return "Confirm Password cannot be empty";
    }
    if (password != confirmPassword) {
      return "Passwords do not match";
    }
    return null;
  }

  static String? validatePhoneNumber(String phoneNumber) {
    final RegExp bangladeshPhoneRegex = RegExp(r'^(01[3-9]\d{8})$');

    if (phoneNumber.isEmpty) {
      return "Phone number field is empty";
    } else if (!bangladeshPhoneRegex.hasMatch(phoneNumber)) {
      return "Enter a valid Bangladeshi phone number (e.g., 017xxxxxxxx)";
    }
    return null;
  }

  static String? validateNID(String nid) {
    final RegExp nidRegex = RegExp(r'^\d{10}$|^\d{13}$|^\d{17}$');

    if (nid.isEmpty) {
      return "NID number field is empty";
    } else if (!nidRegex.hasMatch(nid)) {
      return "Enter a valid Bangladeshi NID (10, 13, or 17 digits)";
    }
    return null;
  }


  static Future<bool> isEmailAlreadyUsed(String email) async {
    final QuerySnapshot providerResult = await FirebaseFirestore.instance
        .collection('providerDetails')
        .where('Email', isEqualTo: email)
        .limit(1)
        .get();
    final QuerySnapshot receiverResult = await FirebaseFirestore.instance
        .collection('receiverDetails')
        .where('Email', isEqualTo: email)
        .limit(1)
        .get();

    return receiverResult.docs.isNotEmpty || providerResult.docs.isNotEmpty;
  }

  static Future<bool> isPhoneAlreadyUsed(String phoneNumber) async {
    final QuerySnapshot receiverResult = await FirebaseFirestore.instance
        .collection('receiverDetails')
        .where('Phone', isEqualTo: phoneNumber)
        .limit(1)
        .get();

    return receiverResult.docs.isNotEmpty;
  }

  static Future<bool> isNidAlreadyUsed(String nid) async {
    final QuerySnapshot receiverResult = await FirebaseFirestore.instance
        .collection('receiverDetails')
        .where('NID', isEqualTo: nid)
        .limit(1)
        .get();

    return receiverResult.docs.isNotEmpty;
  }


}