import 'package:contacts_app_by_flutter/db/db_helper.dart';
import 'package:flutter/cupertino.dart';

import '../models/contact_models.dart';

class ContactProvider extends ChangeNotifier{


  List<ContactModel> contactList=[];
  getAllContacts() async {
    contactList = await DBHelper.getAllContacts();
    notifyListeners();
  }


  updateFavorite(int id, int value, int index) async{
    final value = favorite? 0:1;
    final rowID = await DBHelper.updateFavorite(id, value);
    if(rowID>0){
      contactList[index].isFavourite= !contactList[index].isFavourite;
      notifyListeners();
    }
  }
}