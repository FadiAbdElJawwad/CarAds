import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences logindata;
late bool newuser;

void checkIfAlreadyLogin() async {
  logindata = await SharedPreferences.getInstance();
  newuser = (logindata.getBool('login') ?? false);
}


@override
void initState() {
  // ignore: todo
  // TODO: implement initState
  checkIfAlreadyLogin();
}

