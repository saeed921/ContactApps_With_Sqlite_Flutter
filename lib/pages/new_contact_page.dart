import 'dart:html';
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
  String? dob;
  String? groupValue;
  String? _imagePath;
  ImageSource _imageSource = ImageSource.camera;

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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          child: _imagePath == null
                              ? Image.asset(
                            'images/personholder.jpg',
                            height: 200,
                            width: 200,
                            fit: BoxFit.contain,
                          )
                              : Image.file(
                            File(
                              _imagePath!,
                            ),
                            height: 200,
                            width: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    // background (button) color
                                    onPrimary:
                                    Colors.black54, // foreground (text) color
                                  ),
                                  onPressed: () {
                                    _imageSource = ImageSource.camera;
                                    _getImage();
                                  },
                                  child: Text(
                                    'Camera',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    // background (button) color
                                    onPrimary:
                                    Colors.black54, // foreground (text) color
                                  ),
                                  onPressed: () {
                                    _imageSource = ImageSource.gallery;
                                    _getImage();
                                  },
                                  child: Text(
                                    'Gallery',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),

                            ],
                          ),
                        ),

                        Card(
                          child: Row(
                            children: [
                              TextButton(onPressed: _selectDate,
                                  child: Text('Select Date')),
                              Text(dob == null ? 'No Date selected' : dob!),
                            ],


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

                      ],

                    ),
                  ),
                ])
        ));
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

  void _selectDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (_selectDate != null) {
      setState(() {
dob=DateFormat('dd/MM/yyyy').format(selectedDate!);

      });
    }
  }

  void _getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
      setState(() {
        _imagePath = selectedImage.path;
      });
    }
  }
}
