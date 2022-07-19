import 'package:contacts_app_by_flutter/pages/contact_details-page.dart';
import 'package:contacts_app_by_flutter/pages/new_contact_page.dart';
import 'package:contacts_app_by_flutter/providers/contact_prover.dart';
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
      ),body: Consumer<ContactProvider>(
      builder: (context, provider,_)=>ListView.builder(
        itemCount: provider.contactList.length,
        itemBuilder: (context, index){
          final contact = provider.contactList[index];
          return ListTile(
            onTap: ()=> Navigator.
            pushNamed(context, ContactDetailsPage.routeName,
                arguments: contact.id),
            title: Text(contact.name),
            subtitle: Text(contact.number),
            trailing: IconButton(
              icon: Icon(
                contact.isFavourite? Icons.favorite: Icons.favorite_border,

              ),onPressed: (){

            },
            ),
          );
        }
      )
    ),
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
