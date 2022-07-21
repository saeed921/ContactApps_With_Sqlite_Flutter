import 'package:contacts_app_by_flutter/auth_prefs.dart';
import 'package:contacts_app_by_flutter/pages/contact_list_page.dart';
import 'package:contacts_app_by_flutter/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName='/launcher_page';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    // TODO: implement initState
    getLoginStatus().then((velue){
      if(velue){
        Navigator.pushReplacementNamed(context, ContactListPage.routeName)
      }
      else{
        Navigator.pushReplacementNamed(context, LoginPage.routeName)
      }
    super.initState();
  }
        });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
