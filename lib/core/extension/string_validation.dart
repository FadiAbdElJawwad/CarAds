extension StringValidation on String{

  String? get validatName{
    String? result;
    if (isEmpty){
      result = 'Please Enter Your Name';
    }
    return result;
  }
  String? get validatMobile{
    String? result;
    if (isEmpty){
      result = 'Please Enter Your Mobile Number';
    }
    return result;
  }

  String? get validateEmail{
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    String? result;
    if (isEmpty){
      result = 'Please enter your email address';
    }else if (!(emailRegExp.hasMatch(this))){
      result = 'Please enter a valid email address';
    }
    return result;
  }

  String? get validatPassword {
    String? result;
    if (isEmpty) {
      result = 'Please enter your password';
    } else if (!(length >= 6)) {
      result = 'Password must be at least 6 characters long';
    }
    return result;
  }
}