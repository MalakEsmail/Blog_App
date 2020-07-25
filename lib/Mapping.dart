import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'loginRegisterPage.dart';
import 'HomePage.dart';

class MappingPage extends StatefulWidget {
  final AuthImplementation auth;

  MappingPage({this.auth});

  @override
  State<StatefulWidget> createState() {
    return _MappingPageState();
  }
}

enum AuthState { singedIn, notSignedIn }

class _MappingPageState extends State<MappingPage> {
  AuthState authState = AuthState.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((fireBaseUserId) {
      setState(() {
        authState =
            fireBaseUserId == null ? AuthState.notSignedIn : AuthState.singedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authState = AuthState.singedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authState = AuthState.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authState) {
      case AuthState.notSignedIn:
        return new LoginRegisterPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthState.singedIn:
        return new HomePage(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }
    return null;
  }
}
