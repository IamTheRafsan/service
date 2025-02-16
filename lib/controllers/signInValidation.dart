class Validation{

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

  static String? validatePassword(String password){
    if(password.isEmpty){
      return "Password field is empty";
    }
    return null;
  }
}