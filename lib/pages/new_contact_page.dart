
import 'package:contacts_app_by_flutter/models/contact_models.dart';
import 'package:contacts_app_by_flutter/pages/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';



class NewContactPage extends StatefulWidget {
  static const String routeName='/new_contact';
  const NewContactPage({Key? key}) : super(key: key);

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {

  final formKey = GlobalKey<FormState>();
  ImageSource _imageSource = ImageSource.camera;


  String? groupValue;
  String? imagePath;
  String? dob;


  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    companyController.dispose();
    addressController.dispose();
    designationController.dispose();
    websiteController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact Page'),
        actions: [
          IconButton(onPressed: _savebutton,
              icon: Icon(Icons.save))

        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
            children: [
              Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90),

                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Icon(Icons.add_a_photo_sharp,),
                    Image.asset('images/personholder.jpg',
                      height: 50, width: 50,
                      fit: BoxFit.contain,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _imageSource = ImageSource.camera;
                              getImages();
                            },
                            child: Text('Camera')),
                        ElevatedButton(onPressed: () {
                          _imageSource = ImageSource.gallery;
                          getImages();
                        }, child: Text('Gallery'))
                      ],
                    )

                  ],
                ),
              ),
              Card(
                child: TextButton(
                  onPressed: selectDates(),
                  child: Text(dob == null ? 'Select Date' :
                  dob!),
                ),
              ),

              Card(
                child: Row(
                  children: [
                    Text('Select Gender'),
                    Radio<String>(
                      value: 'Male',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value;
                        });
                      },

                    ),
                    Text('Male'),
                    Radio<String>(
                        value: 'Female',
                        groupValue: groupValue,
                        onChanged: (value) {
                          setState(() {
                            groupValue = value;
                          });
                        }),
                    Text('Female'),
                  ],
                ),

              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'name',
                  prefixIcon: Icon(Icons.person),
                ), validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'this field is must be required';
                }
                if (value.length > 20) {
                  return 'Name must be in 20 character';
                }
              },
              ),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  labelText: 'number',
                  prefixIcon: Icon(Icons.numbers),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty ||
                      value.length < 6) {
                    return 'password length must be 6 character';
                  }
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'email',
                  prefixIcon: Icon(Icons.email),

                ),
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'address',
                  prefixIcon: Icon(Icons.location_on_outlined),

                ),
              ),
              TextFormField(
                controller: companyController,
                decoration: InputDecoration(
                  labelText: 'company',
                  prefixIcon: Icon(Icons.work_history),

                ),
              ),
              TextFormField(
                controller: designationController,
                decoration: InputDecoration(
                  labelText: 'designation',
                  prefixIcon: Icon(Icons.signpost),

                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'website',
                  prefixIcon: Icon(Icons.wordpress),

                ),
              ),

            ]),

      ),
    );
  }

  void _savebutton() {
    if (formKey.currentState!.validate()) {
      final Contact = ContactModel(
        name: nameController.text,
        number: numberController.text,
        email: emailController.text,
        address: addressController.text,
        company: companyController.text,
        designation: designationController.text,
        website: websiteController.text,
      );
      print(Contact.toString());
    }
  }

  void getImages() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
      setState(() {
        imagePath = selectedImage.path;
      });
    }
  }


  selectDates() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      setState(() {
        dob = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }
}
