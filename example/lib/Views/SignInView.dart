/*
 * Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'ErrorView.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String _signUpError = "";

  @override
  void initState() {
    super.initState();
  }

  void _signIn() async {
    // Sign out before in case a user is already signed in
    // If a user is already signed in - Amplify.Auth.signIn will throw an exception
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e);
    }

    try {
      await Amplify.Auth.signIn(
          username: usernameController.text.trim(),
          password: passwordController.text.trim());
      Navigator.pop(context, true);
    } on AuthException catch (e) {
      setState(() {
        _signUpError = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          // wrap your Column in Expanded
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your username',
                    labelText: 'Username *',
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Enter your password',
                    labelText: 'Password *',
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
               ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<
                          Color>(
                        const Color.fromRGBO(
                            109, 44, 237, 1),
                      ),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(6.0)),
                          ))),
                  onPressed: _signIn,
                  child: const Text('Sign in', textAlign: TextAlign.center, style: TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Inter',
    fontSize: 14,
    letterSpacing: 0.20000000298023224,
    fontWeight: FontWeight.normal,
    height: 1.7142857142857142
    ),),
                ),
                ErrorView(_signUpError)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
