import 'package:contacts_app_by_flutter/auth_prefs.dart';
import 'package:contacts_app_by_flutter/pages/contact_details-page.dart';
import 'package:contacts_app_by_flutter/pages/login_page.dart';
import 'package:contacts_app_by_flutter/pages/new_contact_page.dart';
import 'package:contacts_app_by_flutter/providers/contact_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListPage extends StatefulWidget {
  static const String routeName='/';
  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List Page'),
        actions: [
          PopupMenuButton(

              itemBuilder: (context)=>[
                PopupMenuItem(
    onTap: (){
      setLoginStatus(false).then((value)=>
          Navigator.pushReplacementNamed(context, LoginPage.routeName));
    },
    child: const Text('Logout'),
    )
        ],
          ) ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add Contact',


        onPressed: (){
          Navigator.pushNamed(context, NewContactPage.routeName);
        },
      ),
    );
  }
}
