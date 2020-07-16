import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:nile_app/authenticate/auth.dart';
import 'package:nile_app/home_page.dart';
import 'package:nile_app/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //rreturn  home or auth
    if (user == null) {
      return Auth();
    } else {
      return HomePage();
    }
  }
}
