import 'dart:html';

import 'package:contacts_app_by_flutter/auth_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_list_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName='/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController= TextEditingController();
  bool isObscure= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize:  MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                obscureText: isObscure,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'Password ',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(isObscure? Icons.visibility_off:
                    Icons.visibility),
                    onPressed: (){
                      setState((){
                        isObscure=!isObscure;
                      });
                    },
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(onPressed: (){
                setLoginStatus(true).then((value)=>
                    Navigator.pushReplacementNamed(context, ContactListPage.routeName));
              },
                  child: Text('Login'))

            ],
          ),
        ),
      ),
    );
  }
}
