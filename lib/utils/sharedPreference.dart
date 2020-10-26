import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  static SharedPreferences prefs;
}

// TODO:

//  Constants.prefs.get('role') != selected_role - this is to check if the selected role is correct or not
//  Constant.prefs.setString('role', curr_role) - this is to set the role just pass the role inplace of a

// role is basically a key and the curr_role is the vaue of the key set
// it when the request to database is true

// call this module anywhere to set and check the value of the role key
