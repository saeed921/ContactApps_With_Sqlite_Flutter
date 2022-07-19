import 'package:contacts_app_by_flutter/pages/new_contact_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName='/contact_details';
  const ContactDetailsPage({Key? key}) : super(key: key);

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  late int id;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    id=ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details Page'),
      ),

    );
  }
}
