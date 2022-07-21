import 'dart:core';
const String tableContact ='tbl_contact';
const String tableContactColId='id';
const String tableContactColName='name';
const String tableContactColNumber='number';
const String tableContactColEmail='email';
const String tableContactColAddress='address';
const String tableContactColCompany='address';
const String tableContactColDesignation='address';
const String tableContactColWebsite='address';
const String tableContactColDob='dob';
const String tableContactColGender='gender';
const String tableContactColImage='image';
const String tableContactColFav='favourite';


class ContactModel{

  int? id;
  String name;
  String number;
  String? email;
  String? address;
  String? company;
  String? designation;
  String? website;
  String? dob;
  String? image;
  String? gender;
  bool isFavourite=false;

  ContactModel(
      {this.id,
        required this.name,
        required this.number,
        this.email,
        this.address,
        this.company,
        this.designation,
        this.website,
        this.dob,
        this.image,
        this.gender,
        this.isFavourite=false
      });
  Map<String,dynamic> toMap(){
    var map=<String,dynamic> {
      tableContactColName :name,
      tableContactColNumber :number,
      tableContactColEmail :email,
      tableContactColAddress :address,
      tableContactColCompany: company,
      tableContactColDesignation: designation,
      tableContactColWebsite: website,
      tableContactColDob :dob,
      tableContactColGender :gender,
      tableContactColImage :image,
      tableContactColFav: isFavourite? 1:0,
    };
    if(id!=null){
      map[tableContactColId]=id;
    }
    return map;
  }
  factory ContactModel.fromMap(Map<String,dynamic> map)=>ContactModel(
    id: map[tableContactColId],
    name: map[tableContactColName],
    number: map[tableContactColNumber],
    email: map[tableContactColEmail],
    address: map[tableContactColAddress],
    company: map[tableContactColCompany],
    designation: map[tableContactColDesignation],
    website: map[tableContactColWebsite],
    dob: map[tableContactColDob],
    gender: map[tableContactColGender],
    image: map[tableContactColImage],
    isFavourite : map[tableContactColFav]==1?true:false,
  );
  @override
  String toString() {
    return 'ContactModel{id: $id,'
        ' name: $name, '
        'number: $number,'
        ' email: $email, '
        'address: $address,'
        ' dob: $dob, '
        'gender: $gender,'
        ' image: $image,'
        ' isFavurite: $isFavourite}';
  }
}


